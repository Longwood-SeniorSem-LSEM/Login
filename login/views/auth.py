# Import flask dependencies
from flask import (Blueprint, request, render_template,
                  flash, g, session, redirect, url_for)
assert (Blueprint, request, render_template, flash, g, session, redirect,
        url_for)

# Import password / encryption helper tools
from werkzeug import (check_password_hash, generate_password_hash)
assert (check_password_hash, generate_password_hash)

# Import the database object from the main app module
from login import mysql

# Import module models (i.e. User)
# from login.models import User
from login.forms.auth import LoginForm
import login.models as User
import login.decorators as d
assert (LoginForm, User, d)

# Define the blueprint: 'auth', set its url prefix: app.url/auth
mod = Blueprint('auth', __name__)


# route for handling the login page logic
@mod.route('/login', methods=['GET', 'POST'])
def login():
    req = request.form
    error = None
    if request.method == 'POST':
        if (attemptLogin(req['username'],req['password'])):
            session['logged_in'] = True
            flash('You were logged in.')
            gatherUser(req['username'])
            return redirect(url_for('home.home'))
        else:
            error = 'Invalid Credentials. Please try again.'
    return render_template('auth/login.html', error=error)



@mod.route('/logout')
@d.login_required
def logout():
    session.pop('logged_in', None)
    flash('You were logged out.')
    return redirect(url_for('auth.login'))



def attemptLogin(user,password):
    '''
    This function is used purely to access the database that we currently
    have running.  Simple SQL statements have been inserted to check our test
    database's user/user_credentials tables.
    '''
    cursor = mysql.connect().cursor()
    # Blatant use of SQL statements in python
    cursor.execute("SELECT email,passwd FROM users "
                   "WHERE email='{}';".format(user))
    data = cursor.fetchone()
    if ((data is None) or not (check_password_hash(generate_password_hash(data[1]), password))):
        return False
    else:
        return True

def gatherUser(user):
    cursor = mysql.connect().cursor()
    # Blatant use of SQL statements in python
    cursor.execute("SELECT first_name,last_name,account_type,email,user_id, class_id "
                    "FROM users NATURAL JOIN rosters WHERE email='{}';".format(user))
    data = cursor.fetchone()
    session['name'] = "{} {}".format(data[0],data[1])
    session['account_type'] = "{}".format(data[2])
    session['email'] = "{}".format(data[3])
    session['user_id'] = "{}".format(data[4])
    session['class_id'] = "{}".format(data[5])


# Set the route and accepted methods
# @mod.route('/login/', methods=['GET', 'POST'])
# def login():
    # # If sign in form is submitted
    # form = LoginForm(request.form)
    # # Verify the sign in form
    # if form.validate_on_submit():
        # user = User.query.filter_by(email=form.email.data).first()
        # if user and check_password_hash(user.password, form.password.data):
            # session['user_id'] = user.id
            # flash('Welcome %s' % user.name)
            # return redirect(url_for('auth.home'))
        # flash('Wrong email or password', 'error-message')
    # return render_template("auth/login.html", form=form)
