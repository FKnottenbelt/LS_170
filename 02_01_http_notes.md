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

HTTP is nothing more than an agreement in
the form of formatted text that dictates how a client and server
communicate.

The most important parts of an HTTP response are:

    status code
    headers
    message body, which contains the raw response data

Session data is generated and stored on the server-side and the `session
id` is sent to the client in the form of a cookie. Web applications take
advantage of this to mimic a stateful experience on the web.

Developing and securing a web application is fragile and problematic and it's
mostly due to working with HTTP.

Understanding HTTP and things like GET, POST, sessions, cookies and what
it means to be "stateless" are vital. Understanding the basics of HTTP
means you know what is happening "behind the scenes" when you build a web
application.

Learning about security means you're aware of threats like XSS,
session hijacking and the countermeasures you need to guard against
them.

> state

mimic state with:
- `session indentifier`:
  having the server send some form of a unique token to the client.
  Whenever a client makes a request to that server, the client appends
  this token as part of the request, allowing the server to identify clients.
  In web development, we call this unique token that gets passed back and
  forth the session identifier.

  The id sent with a session is unique and expires in a relatively short
  time. In this context, it means you'll be required to login again after the
  session expires. If we log out, the session id information is gone

> Where is the session data stored?

The simple answer is: on the server somewhere. Sometimes, it's
just stored in memory, while other times, it could be stored in
some persistent storage, like a database or key/value store. Where
the session data is actually is not too important right now. The
most important thing is to understand that the session id is
stored on the client, and it is used as a "key" to the session
data stored server side. That's how web applications work around
the statelessness of HTTP.

> AJAX

AJAX requests are just like normal requests: they are sent to the server
with all the normal components of an HTTP request, and the server handles
them like any other request. The only difference is that instead of the
browser refreshing and processing the response, the response is processed
by a callback function, which is usually some client-side JavaScript code.

> Security messures

**HTTPS**
With HTTPS every request/response is encrypted before being
transported on the network.
HTTPS sends messages through a cryptographic protocol called `TLS`
for encryption. Earlier versions of HTTPS used `SSL` or `Secure
Sockets Layer` until TLS was developed. These cryptographic
protocols use `certificates` to communicate with remote servers and
exchange security keys before data encryption happens.

**Same-origin policy**
The same-origin policy is an important concept that permits
resources originating from the same site to access each other with
no restrictions, but prevents access to documents/resources on
different sites. Stated differently, it prevents scripts from one
site from manipulating documents from another site.

Documents in the same origin must have the same protocol, hostname and port
number.

The same origin policy pertains to accessing the contents of files,
and not linking. You are always free to link to any URL.

The same-origin policy is an important guard against session
hijacking attacks and serves as a cornerstone of web application security.

**Countermeasures for Session Hijacking**
- resetting sessions (a successful login must render an old session id
  invalid and create a new one)
- setting an expiration time on sessions
- use HTTPS to protect the session id

**Countermeasures for cross-site scripting (XSS)**
- Sanitize user input. Eliminate problematic input, such
  as script tags, or disallowing HTML and JavaScript input
  altogether in favor of a safer format, like Markdown.
- escape all user input data when displaying it. If you do need to
  allow users to input HTML and JavaScript, then when you print it out,
  make sure to escape it (with [HTML entities](http://entitycode.com/#math-content))
  so that the browser does not interpret it as code.

> Security threats

**Session Hijacking**
If a hacker gets hold of the users session Id (often stored as a string in a
cookie stored on the users computer), both the attacker and the user now
share the same session and both can access the web application.

**Cross-Site Scripting (XSS)**
This type of attack happens when you allow users to input HTML or
JavaScript that ends up being displayed by the site directly.

If the server side code doesn't do any sanitization of input, the
user input will be injected into the page contents, and **the browser
will interpret the HTML and JavaScript and execute it**.

example: in a comment a attacker could summit
```html
hello world &lt;script&gt;alert("hello world...")&lt;script&gt;
```
(which will only make a alert message pop-up, but you can see the potential)

NB:  `&lt;` is `<`,  `&lt;` is `>`. See [HTML entities](http://entitycode.com/#math-content)

> CORS

`CORS` is a mechanism that allows resources from one domain to be requested
from another domain, bypassing the same-origin policy. CORS works
by adding new HTTP headers, which allow servers to serve resources
to permitted origin domains.

> Summary
HTTP is a text-based protocol that is the foundation of the web.

There are two parties involved in HTTP: the client and the server.

A complete HTTP interaction involves a request which is sent from the
client to the server, and a response which is sent from the server to
the client.

A request is sent to a host and must include a method, a path, and a
Host header. It may also include parameters, additional headers, or
a body.

GET is the HTTP method used to retrieve a resource from the server.

A response must include a status. It may also include headers or a
body.

A 200 OK status in a response means the request was successful.

Modern web browsers include debugging tools that allow you to inspect
the HTTP activity of a page.
