# sql.py - Create a SQLite3 table and populate it with data


#import sqlite3

#with sqlite3.connect('users.db') as connection:

    ## get a cursor object used to execute SQL commands
    #c = connection.cursor()

    #c.execute('DROP TABLE IF EXISTS users')
    ## create the table
    #c.execute('CREATE TABLE users(user TEXT, password TEXT)')

    ## insert dummy data into the table
    #c.execute('INSERT INTO users VALUES("admin", "admin")')
    #c.execute('INSERT INTO users VALUES("dan", "dan")')

import MySQLdb
config = {
    'user': 'root',
    'passwd': 'vagrantpass',
    'host': 'localhost',
    'db': 'test'
}
db = MySQLdb.connect(**config)
cur = db.cursor()
for line in open('sql_setup.sql'):
    cur.execute(line)
db.commit()
