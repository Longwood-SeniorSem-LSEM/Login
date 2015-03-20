import os
import sys

# Import flask and template operators & SQLAlchemy
from flask import Flask, render_template
# from flask.ext.sqlalchemy import SQLAlchemy
from flaskext.mysql import MySQL

# Define the WSGI application object & Configurations
weblogin = Flask(__name__)
weblogin.config.from_object('config')

# Define the database object which is imported
# by modules and views
# Database config
mysql = MySQL()
weblogin.config['MYSQL_DATABASE_USER'] = 'root'
weblogin.config['MYSQL_DATABASE_DB'] = 'test'
weblogin.config['MYSQL_DATABASE_HOST'] = 'localhost'
weblogin.config['MYSQL_DATABASE_PASSWORD'] = 'vagrantpass'
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
from login.mod_auth.views import mod_auth as auth_module
from login.mod_home.views import mod_home as home_module
# Later on I'll import the other blueprints the same way:
# from weblogin.comments.views import mod as commentsModule
# from weblogin.posts.views import mod as postsModule

# Register blueprint(s)
weblogin.register_blueprint(auth_module)
weblogin.register_blueprint(home_module)
# Later on I'll register the other blueprints the same way:
# weblogin.register_blueprint(commentsModule)
# weblogin.register_blueprint(postsModule)

# Build the database:
# This will create the database file using SQLAlchemy
# db.create_all()
