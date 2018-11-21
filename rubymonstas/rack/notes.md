> Rack

This gem comes with a little executable (command line program)
called `rackup`. This command looks for a file `config.ru` in the
current directory, and starts a web server using it, on your local
computer.

> running rackup on AWS.

first check you have rack gem installed: `gem list rack`
we don't want port 9292 (see output when you run rackup)
```
Femke:~/environment/monstas/rack (master) $ rackup
[2018-10-20 14:40:04] INFO  WEBrick 1.3.1
[2018-10-20 14:40:04] INFO  ruby 2.4.1 (2017-03-22) [x86_64-linux]
[2018-10-20 14:40:04] INFO  WEBrick::HTTPServer#start: pid=5089 port=9292
```
see at  http://localhost:9292

AWS wants you at 8080 for rack.
So run: `rackup -p 8080`
```
[2018-10-20 14:42:41] INFO  WEBrick 1.3.1
[2018-10-20 14:42:41] INFO  ruby 2.4.1 (2017-03-22) [x86_64-linux]
[2018-10-20 14:42:41] INFO  WEBrick::HTTPServer#start: pid=5170 port=8080
80.101.189.63 - - [20/Oct/2018:14:42:50 +0000] "GET / HTTP/1.1" 200 - 0.0003
80.101.189.63 - - [20/Oct/2018:14:42:50 +0000] "GET /favicon.ico HTTP/1.1" 200 - 0.0003
80.101.189.63 - - [20/Oct/2018:14:42:50 +0000] "GET /favicon.ico HTTP/1.1" 200 - 0.0003
```
AWS will give you a link to click to take you to browser :-D
( contrl c to quit rack)

> Rack run

run needs to be passed something that responds to `call`
a simple proc or lambda will do: (yield to block, but call to
proc remember? A proc will respond to `call`)

```ruby
application = lambda do |env|
  [200, { "Content-Type" => "text/html" }, ["Yay, your first web application! <3"]]
end

run application
```
using a class will give more flexibility since we can add methods
```ruby
class Application
  def call(env)    # here is the call that 'run' needs
    status  = 200
    headers = { "Content-Type" => "text/html" }
    body    = ["Yay, your first web application! <3"]

    [status, headers, body]
  end
end

run Application.new
```

> Rack protocol

A Rack application implements a method call that takes a hash
representing the request, and is supposed to return an array
containing the status code, a hash containing the headers, and an
array containing the request body.

Once Rack got these three things back from our method call it will
create the respective response (text) message out of it, and send
it back to the browser, so the browser can handle it (and in our
case display the body).

> Rack on droplet

(I did install sinatra, but probably not neccesary)
open firewall for port 9292:
sudo ufw allow 9292/tcp
sudo ufw enable

run rackup with host option (-o or --host)
`rackup -o IPADRESS`
rackup -o 178.128.252.150

point your browser at http://droplet_ip:port
http://178.128.252.150:9292

> Sinatra on droplet

https://www.digitalocean.com/community/tutorials/how-to-install-and-get-started-with-sinatra-on-your-system-or-vps