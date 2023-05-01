from flask import Flask, request, make_response

app = Flask(__name__)


@app.route('/')
def index():
    headers = {
        'Content-Type': 'text/plain'
    }
    response = make_response('Hello, World!', 200, headers)
    return response


@app.route('/ping')
def ping():
    headers = {
        'Content-Type': 'text/plain'
    }
    response = make_response('pong', 200, headers)
    return response
