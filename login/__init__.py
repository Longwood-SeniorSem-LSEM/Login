import os
import sys

# Import flask and template operators & SQLAlchemy
from flask import Flask, render_template
from flaskext.mysql import MySQL

# Define the WSGI application object & Configurations
weblogin = Flask(__name__)
weblogin.config.from_object('config')

# Database
mysql = MySQL()
mysql.init_app(weblogin)

# Configure Secret Key
def install_secret_key(weblogin, filename='secret_key'):
    # Configure the SECRET_KEY from a file
    # in the instance directory.

    # If the file does not exist, print instructions
    # to create it from a shell with a random key,
    # then exit.
    filename = os.path.join(weblogin.instance_path, filename)
    try:
        weblogin.config['SECRET_KEY'] = open(filename, 'rb').read()
    except IOError:
        print('Error: No secret key. Create it with:')
        full_path = os.path.dirname(filename)
        if not os.path.isdir(full_path):
            print('mkdir -p {filename}'.format(filename=full_path))
        print('head -c 24 /dev/urandom > {filename}'.format(filename=filename))
        sys.exit(1)


if not weblogin.config['DEBUG']:
    install_secret_key(weblogin)

# Sample HTTP error handling
@weblogin.errorhandler(404)
def not_found(error):
    return render_template('404.html'), 404


# Import a module / component using its blueprint handler variable (mod_auth)
from login.views import auth
from login.views import home

# Register blueprint(s)
weblogin.register_blueprint(auth.mod)
weblogin.register_blueprint(home.mod)
