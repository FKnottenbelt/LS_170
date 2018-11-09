`HTTP`, or Hypertext Transfer Protocol is a system of rules, a protocol,
that serve as a link between applications and the transfer of hypertext
documents. Stated differently, it's an agreement, or message format,
of how machines communicate with each other. HTTP follows a simple
model where a client makes a request to a server and waits for a
response. Hence, it's referred to as a request response protocol.
Think of the request and the response as text messages, or strings,
which follow a standard format that the other machine can understand.

> HTTP tools

Paw, Insomnia, Postman (gui)
curl, HTTPie (cli)

> curl request:

(adding the user agent that curl wants:
-A 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.101 Safari/537.36')
and specifying output file: > curl_request.txt

curl -X GET "https://www.reddit.com/" -m 30 -v -A 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.101 Safari/537.36' > curl_request.txt

nb: looks like a lot of the time spooling to html might make more sense

see `curl --help`:
`-X` command following
`-m` max-time in seconds allowed for transfer
`-v` verbose
`-A` user agent

`-d` data

> HTTP GET requests

GET requests are used to retrieve a resource, and most links are GETs.

The response from a GET request can be anything, but if it's
HTML and that HTML references other resources, your browser
will automatically request those referenced resources. A pure
HTTP tool will not.

> POST Requests

curl blackjack looks like it doesn't work. But it is is stopping
after the first response with the 'redirect' to
http://al-blackjack.herokuapp.com/bet (and an empty body)
See also to code 303.

Normally your browser will automatically go on the the /bet
(send new GET request) and you will get the bet page as a response to
that.

Note: If you're using some other HTTP tool, like Insomnia or Postman,
you may have to uncheck `automatically follow redirects` in order to see
the Location response header. (it will not stop, but behave like
browser)

See all this in the inspector under network.

> know:

you should be comfortable with:

    using the inspector to view HTTP requests
    making GET/POST requests with an HTTP tool

The most important components to understand about an HTTP request
are:

    HTTP method
    path
    headers
    message body (for POST requests)
