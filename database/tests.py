from weblogin import weblogin
import unittest


#username_test = "Nullam.enim@infelis.com"
#password_test = "AXE95TPY5NB"

class FlaskTestCase(unittest.TestCase):

    # Ensure that Flask was set up correctly
    def test_index(self):
        tester = weblogin.test_client(self)
        response = tester.get('/login', content_type='html/text')
        self.assertEqual(response.status_code, 200)

    # Ensure that the login page loads correctly
    def test_login_page_loads(self):
        tester = weblogin.test_client(self)
        response = tester.get('/login')
        self.assertIn(b'Lancer Quest', response.data)

    # Ensure login behaves correctly with correct credentials
    def test_correct_login(self):
        tester = weblogin.test_client()
        response = tester.post(
            '/login',
            data=dict(username="Nullam.enim@infelis.com", password="AXE95TPY5NB"),
            follow_redirects=True
        )
        self.assertIn(b'You were logged in', response.data)

    # Ensure login behaves correctly with incorrect credentials
    def test_incorrect_login(self):
        tester = weblogin.test_client()
        response = tester.post(
            '/login',
            data=dict(username="wrong", password="wrong"),
            follow_redirects=True
        )
        self.assertIn(b'Invalid Credentials. Please try again.', response.data)

    # Ensure logout behaves correctly
    def test_logout(self):
        tester = weblogin.test_client()
        tester.post(
            '/login',
            data=dict(username="Nullam.enim@infelis.com", password="AXE95TPY5NB"),
            follow_redirects=True
        )
        response = tester.get('/logout', follow_redirects=True)
        self.assertIn(b'You were logged out', response.data)

    # Ensure that main page requires user login
    def test_main_route_requires_login(self):
        tester = weblogin.test_client()
        response = tester.get('/', follow_redirects=True)
        self.assertIn(b'You need to login first.', response.data)

    # Ensure that logout page requires user login
    def test_logout_route_requires_login(self):
        tester = weblogin.test_client()
        response = tester.get('/logout', follow_redirects=True)
        self.assertIn(b'You need to login first.', response.data)

if __name__ == '__main__':
    unittest.main()
