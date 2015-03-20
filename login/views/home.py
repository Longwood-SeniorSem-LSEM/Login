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
from flaskext.mysql import MySQL
import login.decorators as d
assert (MySQL, d)

# Define the blueprint: 'home'
mod = Blueprint('home', __name__)

# use decorators to link the function to a url
# this is the home page
@mod.route('/')
@d.login_required
def home():
    return render_template('home/index.html')  # render a template

@mod.route('/calendar')
@d.login_required
def calendar():
    return render_template('home/calendar.html')  # render a template
