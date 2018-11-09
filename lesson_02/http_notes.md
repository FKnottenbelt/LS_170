`HTTP`, or Hypertext Transfer Protocol is a system of rules, a protocol,
that serve as a link between applications and the transfer of hypertext
documents. Stated differently, it's an agreement, or message format,
of how machines communicate with each other. HTTP follows a simple
model where a client makes a request to a server and waits for a
response. Hence, it's referred to as a request response protocol.
Think of the request and the response as text messages, or strings,
which follow a standard format that the other machine can understand.


> curl request:

(adding the user agent that curl wants:
-A 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.101 Safari/537.36')
and specifying output file: > curl_request.txt

curl -X GET "https://www.reddit.com/" -m 30 -v -A 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.101 Safari/537.36' > curl_request.txt