import os
# Import flask dependencies
from flask import (current_app, Blueprint, request, render_template,
                  session, redirect, url_for, send_from_directory)

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
    return render_template('home/index.html', user=session['name'])



# This is the assignments page.  Currently professors will are able to upload documents and text files.
# Students also use this page to view assignments.
@mod.route('/assignments', methods=['GET', 'POST'])
@d.login_required
def assignments():
    conn = mysql.connect()
    cursor = conn.cursor()
    prof_data = []
    student_data = []
    if (session["account_type"] == 'professor' and request.method == "POST"):
        file_storage_url = None
        try:
            # Here we will grab the files from the request object, check to make sure
            # it is actually a file and an allowed file extension.  Then we will find
            # url path we want to use, save the file and insert the metadata
            # concerning the file into the database.  Finally we will redirect back
            # to this site so the request method becomes GET and the file
            # automagically appears.
            if ('upload' in request.form):
                # Here we are checking to see if the submit button's name field is contained
                # in the request.form data.
                due_date = request.form['due_date']
                assign_date = request.form['assign_date']
                due_date = makeSQLdatetime(due_date)
                f = request.files['file']
                if f and allowed_file(f.filename):
                    filename = f.filename
                    file_storage_url = os.path.join(current_app.config['UPLOAD_FOLDER'], filename)
                    f.save(file_storage_url)
            elif ('textBoxSubmit' in request.form):
                # This will handle text input from the professor and text box submit form
                filename = request.form['Title'] + '.txt'
                file_storage_url = os.path.join(current_app.config['UPLOAD_FOLDER'], filename)
                text = request.form['Assignment']
                fh = open(file_storage_url, 'w+')
                fh.write(text)
                fh.close()
            if file_storage_url is not None:
                cursor.execute("INSERT INTO assignment_storage "
                            "(assignment_data, user_id, class_id, assignment_name, assign_date, due_date) "
                            "VALUES ('{0}', {1}, {2}, '{3}', '{4}', '{5}');".format(file_storage_url,
                                                            session['user_id'],
                                                            session['class_id'],
                                                            filename, assign_date, due_date))
                conn.commit()
            return redirect(url_for('home.assignments'))
        except Exception as e:
            print (e)
    if (session["account_type"] == 'professor'):
        cursor.execute("SELECT assignment_name, assignment_data, assign_date, due_date FROM assignment_storage "
                    "WHERE class_id={};".format(session["class_id"]))
                    # "NATURAL JOIN rosters WHERE class_id={};".format(session["class_id"]))
        prof_data = cursor.fetchall()

    cursor.execute("SELECT assignment_name, assignment_data, assign_date, due_date FROM assignment_storage "
                   "WHERE class_id={};".format(session["class_id"]))
    student_data = cursor.fetchall()
    # Render template with possible teacher data and definitely student_data
    return render_template('home/assignments.html', user=session["name"],
                           prof=prof_data, student=student_data)



# Professors use this page to remove an assignment
@mod.route('/assignments/remove', methods=['GET', 'POST'])
@d.login_required
def assignments_remove():
    if (session["account_type"] == 'professor' and request.method == "POST"):
        # if receive confirmation - then remove
        confirmation = request.form.get("confirm")
        if (confirmation == 'yes'):
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute("SELECT assignment_data FROM assignment_storage "
                           "WHERE assignment_name='{0}' AND class_id={1};".format(request.form.get("filename"), session["class_id"]))
            delete_me = cursor.fetchone()
            os.remove(delete_me[0])
            cursor.execute("DELETE FROM assignment_storage "
                           "WHERE assignment_name='{0}' AND class_id={1};".format(request.form.get("filename"), session["class_id"]))
            conn.commit()
        # Cancelled remove action
        return redirect(url_for('home.assignments'))
    # This will be executed first --
    else:
        filename = request.args.get("field1")
        return render_template("home/assignments_remove.html", filename=filename)



# Professors use this page to make edits to the assign and due dates.
@mod.route('/assignments/edit', methods=['GET', 'POST'])
@d.login_required
def assignments_edit():
    if (session["account_type"] == 'professor' and request.method == "POST"):
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("UPDATE assignment_storage SET assign_date='{0}', due_date='{1}' "
                        "WHERE assignment_name='{2}' AND class_id={3};".format(request.form.get("assign_date"),
                                                                               makeSQLdatetime(request.form.get("due_date")),
                                                                               request.form.get("filename"),
                                                                               session["class_id"]))
        conn.commit()
        return redirect(url_for('home.assignments'))
    # This will be executed first --
    else:
        filename = request.args.get("field1")
        assign_date = request.args.get("field2")
        due_date = request.args.get("field3")
        due_date = makeHTMLdatetime(due_date)
        return render_template("home/assignments_edit.html", user=session['name'], filename=filename, assign_date=assign_date, due_date=due_date)



# A calendar from Longwood University.
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



@mod.route('/upload', methods=['GET', 'POST'])
@d.login_required
def upload():
    # This function uses GET to retrieve the arguments of the file
    filename = request.args.get("field1")
    return send_from_directory(current_app.config['UPLOAD_FOLDER'], filename, as_attachment=True)



# Helper function smoking room
def allowed_file(filename):
    return '.' in filename and \
        filename.rsplit('.',1)[1] in current_app.config['ALLOWED_EXTENSIONS']
def makeSQLdatetime(html_datetime_local):
    return html_datetime_local[0:10] + " " + html_datetime_local[11:] + ":00"
def makeHTMLdatetime(sql_datetime):
    return sql_datetime[:10]+"T"+sql_datetime[11:16]
