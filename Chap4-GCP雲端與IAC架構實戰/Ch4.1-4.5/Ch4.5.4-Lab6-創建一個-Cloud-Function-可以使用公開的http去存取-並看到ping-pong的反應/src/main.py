from flask import make_response, request


def ping(request):
    headers = {
        'Content-Type': 'text/plain'
    }
    response = make_response('Pong!', 200, headers)
    return response
