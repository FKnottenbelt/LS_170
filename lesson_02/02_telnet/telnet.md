don't have telnet, but culr seems to give the same info.
so instead of
```
$ telnet google.com 80
$ GET /
```
(webservers connect on port 80)

just did
```
curl -X GET google.com -m 30 -v > telnet.html
```
which gave a redirect:
```
301 Moved Permanently
< Location: http://www.google.com/
```
so :
```
curl -X GET www.google.com -m 30 -v > telnet.html
```
gave :
```
Note: Unnecessary use of -X or --request, GET is already inferred.
* Rebuilt URL to: www.google.com/
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0*   Trying 172.217.8.164...
* TCP_NODELAY set
* Connected to www.google.com (172.217.8.164) port 80 (#0)
> GET / HTTP/1.1
> Host: www.google.com
> User-Agent: curl/7.53.1
> Accept: */*
>
< HTTP/1.1 200 OK
< Date: Sun, 11 Nov 2018 15:52:57 GMT
< Expires: -1
< Cache-Control: private, max-age=0
< Content-Type: text/html; charset=ISO-8859-1
< P3P: CP="This is not a P3P policy! See g.co/p3phelp for more info."
< Server: gws
< X-XSS-Protection: 1; mode=block
< X-Frame-Options: SAMEORIGIN
< Set-Cookie: 1P_JAR=2018-11-11-15; expires=Tue, 11-Dec-2018 15:52:57 GMT; path=/; domain=.google.com
< Set-Cookie: NID=146=TbNGMNFWgRt1E6OOokBIXoDSvKysEH1F23Y23VnOZ-zEGRW185_gWb1TmDLqOyWdhL_Gv7E6Lw0nF2l17508wLlw4OjwXQLOL4U0oSdpVXzrZVHYyDeyrVRD8lffCc7o1rIGqHiBrvhk6fl-l_u1py6lfiLyuIvlB-zP4HKEz0Q; expires=Mon, 13-May-2019 15:52:57 GMT; path=/; domain=.google.com; HttpOnly
< Accept-Ranges: none
< Vary: Accept-Encoding
< Transfer-Encoding: chunked
<
{ [2100 bytes data]
100 13512    0 13512    0     0   123k      0 --:--:-- --:--:-- --:--:--  124k
* Connection #0 to host www.google.com left intact
```
and the body in telnet.html
