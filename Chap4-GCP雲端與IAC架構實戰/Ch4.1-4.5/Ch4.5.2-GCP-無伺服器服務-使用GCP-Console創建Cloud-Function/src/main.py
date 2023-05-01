from flask import make_response, request


def handler(request):
    headers = {
        'Content-Type': 'text/plain'
    }
    response = make_response('Hello, World!', 200, headers)
    return response
