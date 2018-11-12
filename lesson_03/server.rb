require 'socket'

server = TCPServer.new("localhost", 8080)
loop do
  client = server.accept

  request_line = client.gets
  puts request_line

  client.puts request_line
  client.close
end

# nb: replace localhost with droplet IP and port
# with a open tcp port when running on droplet.
# in browser go to http://<ip>:<port>