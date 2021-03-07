import unittest

import azure.functions as func
from SampleFunc import main


class TestFunction(unittest.TestCase):
    def test_sample_func(self):
        req = func.HttpRequest(
            method='GET',
            body=None,
            url='/api/SampleFunc',
            params={'name': 'hoge'}
        )

        resp = main(req)

        self.assertEqual(
            resp.get_body(),
            b'Hello, hoge. This HTTP triggered function executed successfully.'
        )
