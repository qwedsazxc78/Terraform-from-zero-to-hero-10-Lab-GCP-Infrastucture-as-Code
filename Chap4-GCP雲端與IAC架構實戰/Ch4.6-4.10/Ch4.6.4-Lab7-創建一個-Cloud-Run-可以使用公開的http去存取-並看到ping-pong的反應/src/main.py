from flask import Flask, request, make_response
import os

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


@app.route('/health')
def health():
    headers = {
        'Content-Type': 'text/plain'
    }
    response = make_response('healthy', 200, headers)
    return response


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
