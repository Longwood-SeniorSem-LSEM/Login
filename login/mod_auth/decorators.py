from functools import wraps

from flask import (Flask, render_template, redirect,
    url_for, request, session, flash)
assert (Flask, render_template, redirect, url_for, request, session, flash)

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
