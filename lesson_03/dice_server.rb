require 'socket'

server = TCPServer.new("localhost", 8080)
loop do
  # catch request and establish connection object
  client = server.accept

  # take first line of request
  request_line = client.gets
  puts request_line # print to terminal

  # return headers
  client.puts "HTTP/1.1 200 ok"
  client.puts "Content-Type: text/plain\r\n\r\n"

  # first line of request into response (display in browser)
  client.puts request_line

  # our program (into response (display in browser))
  client.puts rand(1..6)

  # close connection
  client.close
end

# nb: replace localhost with droplet IP (or just "") and port
# with a open tcp port when running on droplet.
# in browser go to http://<ip>:<port>
