# sql.py - Create a SQLite3 table and populate it with data


import sqlite3

# create a new database if the database doesn't already exist
#with sqlite3.connect('posts.db') as connection:
#
#    # get a cursor object used to execute SQL commands
#    c = connection.cursor()
#
#    c.execute('DROP TABLE IF EXISTS posts')
#    # create the table
#    c.execute('CREATE TABLE posts(title TEXT, details TEXT)')
#
#    # insert dummy data into the table
#    c.execute('INSERT INTO posts VALUES("Good", "I\'m good.")')
#    c.execute('INSERT INTO posts VALUES("Well", "I\'m well.")')
#    c.execute('INSERT INTO posts VALUES("Excellent", "I\'m excellent.")')
#    c.execute('INSERT INTO posts VALUES("Okay", "I\'m okay.")')
with sqlite3.connect('users.db') as connection:

    # get a cursor object used to execute SQL commands
    c = connection.cursor()

    c.execute('DROP TABLE IF EXISTS users')
    # create the table
    c.execute('CREATE TABLE users(user TEXT, password TEXT)')

    # insert dummy data into the table
    c.execute('INSERT INTO users VALUES("admin", "admin")')
    c.execute('INSERT INTO users VALUES("dan", "dan")')
