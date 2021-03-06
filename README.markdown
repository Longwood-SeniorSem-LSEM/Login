LOGIN SYSTEM
============
<p>
This repository provides the login function and flask framework.<br>
Branches are used to integrate features from Databases and Webpages.<br>
</p>

Setting Up The Python Requirements
----------------------------------
<p>
On Debian/Ubuntu systems go ahead and install python-pip.<br>
<code>sudo apt-get install python-pip</code><br>
Then use pip to install virutalenv.<br>
<code>sudo pip install virtualenv</code><br>

These two commands install the recommended python package installer and use pip to install the virtual environment program.
<br>
Next pull the repository with `git clone https://repo.url`

Navigate to the login folder and enter `virtualenv venv`<br>
Next type `source venv/bin/activate` to enter your environment.<br>
Finally type `pip install -r requirements.txt` to install the dependencies of the framework.
</p>

Setting Up The MySQL Requirements
---------------------------------
On Debian/Ubuntu systems make sure you have the following packages:
  * python-dev
  * python-mysqldb
  * mysql-server
  * libmysqlclient-dev<br />

Next edit the sql.py to reflect the user name and password you use.  Also make sure that a database named ‘test’ present.



You are all set!

