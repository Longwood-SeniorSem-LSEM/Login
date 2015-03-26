from werkzeug.security import (generate_password_hash,
     check_password_hash)
# from backports.pbkdf2 import pbkdf2_hmac, compare_digest

class User(object):
    '''
    This is a user object.  It automagically hashes passwords passed to it.
    For now, I am including the passwd field because we have a database full of
    unhashed passwords.
    '''
    def __init__(self, fn, ln, account_type, email, password=None):
        self.firstname = fn
        self.lastname = ln
        self.account_type = account_type
        self.email = email
        self.passwd = password
        # self.set_password(password)

    def set_password(self, password):
        self.pw_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.pw_hash, password)
