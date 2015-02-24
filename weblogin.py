# import the Flask class from the flask module
from flask import (Flask, render_template, redirect,
    url_for, request, session, flash, g)
from functools import wraps
import sqlite3

# create the object
weblogin = Flask(__name__)

# config
weblogin.secret_key = 'secret'
weblogin.database_users = 'users.db'


# login required decorator
def login_required(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, **kwargs)
        else:
            flash('You need to login first.')
            return redirect(url_for('login'))
    return wrap


# use decorators to link the function to a url
# this is the home page
@weblogin.route('/')
@login_required
def home():
    return render_template('index.html')  # render a template


@weblogin.route('/welcome')
def welcome():
    return render_template('welcome.html')  # render a template


# route for handling the login page logic
@weblogin.route('/login', methods=['GET', 'POST'])
def login():
    req = request.form
    error = None
    if request.method == 'POST':
        if (attemptLogin(req['username'],req['password'])):
            session['logged_in'] = True
            flash('You were logged in.')
            return redirect(url_for('home'))
        else:
            error = 'Invalid Credentials. Please try again.'
    return render_template('login.html', error=error)


@weblogin.route('/logout')
@login_required
def logout():
    session.pop('logged_in', None)
    flash('You were logged out.')
    return redirect(url_for('welcome'))


# connect to posts database
def connect_db_users():
    return sqlite3.connect(weblogin.database_users)


# This is the main function here.
# check login information
def attemptLogin(user,password):
    try:
        g.db = connect_db_users()
        cur = g.db.execute("SELECT user,password FROM users WHERE "
                           "user='{}';".format(user))
        info = cur.fetchone()
        g.db.close()
        if ((info is None) or (info[1] != password)):
            return False
        else:
            return True
    except sqlite3.OperationalError:
        "Error"

# start the server with the 'run()' method
if __name__ == '__main__':
    weblogin.run(debug=True)
