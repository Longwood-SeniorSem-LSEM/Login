# Import flask dependencies
from flask import (Blueprint, request, render_template,
                  flash, g, session, redirect, url_for)
assert (Blueprint, request, render_template, flash, g, session, redirect,
        url_for)

# Import password / encryption helper tools
from werkzeug import (check_password_hash, generate_password_hash)
assert (check_password_hash, generate_password_hash)

# Import the database object from the main app module (if we had one)
# Instead just import MySQL for Errors and universal decorators
from login import mysql

# Import Modules
import login.decorators as d

# Define the blueprint: 'home'
mod = Blueprint('home', __name__)

# use decorators to link the function to a url
# this is the home page
@mod.route('/')
@d.login_required
def home():
    return render_template('home/index.html', user=session['name'])  # render a template

@mod.route('/assignments', methods=['GET', 'POST'])
@d.login_required
def assignments():
    cursor = mysql.connect().cursor()
    if (session["account_type"] == 'professor'):
        '''
        The professor will be able to upload using a form
        or text box.  This block will only execute for professors
        '''
        # professor_data = cursor.fetchall().execute("SELECT * FROM assignment_storage "
                                                   # "")
        pass
    # student_data = cursor.fetchall().execute("SELECT * FROM assignment_storage "
                                             # "NATURAL JOIN rosters WHERE rosters.user_id={}".format(session["user_id"]))
    # Render template with possible teacher data and definitely student_data
    return render_template('home/assignments.html')

@mod.route('/calendar')
@d.login_required
def calendar():
    return render_template('home/calendar.html', user=session['name'])  # render a template

@mod.route('/courses')
@d.login_required
def courses():
    cursor = mysql.connect().cursor()
    if (session["account_type"] == 'student'):
        # Blatant use of SQL statements in python
        cursor.execute("SELECT subject,course,section "
                        "FROM classes JOIN rosters ON id=class_id "
                        "WHERE user_id='{}';".format(session["user_id"]))
        data = cursor.fetchone()
        # return render_template('home/courses.html', user=session["name"],
                            # subject=data[0], course=data[1],
                            # section=data[2], title=data[3])
    elif (session["account_type"] == 'professor'):
        cursor.execute("SELECT subject,course,section "
                        "FROM classes JOIN rosters ON id=class_id "
                        "WHERE user_id='{}';".format(session["user_id"]))
        data = cursor.fetchall()
        # return render_template('home/courses.html', user)
    return render_template('home/courses.html', user=session["name"],
                            data=data)
