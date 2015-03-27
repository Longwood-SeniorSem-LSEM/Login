# Define application directory
import os
_basedir = os.path.abspath(os.path.dirname(__file__))

# Development Environment
DEBUG = True

# Define maintainers
ADMINS = frozenset(['Daniel Hill', 'daniel.hill@live.longwood.edu'])

# Use this secret key for signing cookies.
SECRET_KEY = 'This string will be replaced with a proper key in production.'

# Define Database
# SQLALCHEMY_DATABASE_URI = 'mysql+mysqldb://root:vagrantpass@localhost/test'
# SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(_basedir, 'app.db')
MYSQL_DATABASE_USER = 'root'
MYSQL_DATABASE_DB = 'test'
MYSQL_DATABASE_HOST = 'localhost'
MYSQL_DATABASE_PASSWORD = 'vagrantpass'

# Define uploaded documents area
UPLOAD_FOLDER = '/vagrant/uploaded_activites'
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif', 'doc', 'docx'])

# Application threads. A common general assumption is
# using 2 per available processor cores - to handle
# incoming requests using one and performing background
# operations using the other.THREADS_PER_PAGE = 4
THREADS_PER_PAGE = 2

# Enable protection agains *Cross-site Request Forgery (CSRF)*
CSRF_ENABLED = True
# Use a secure, unique, secret key for signing data
CSRF_SESSION_KEY = "somethingimpossibletoguessinthehistoryofalltheuniverseFOREVER"
