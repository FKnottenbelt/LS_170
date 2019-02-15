require 'socket'

server = TCPServer.new("localhost", 8080)
loop do
  client = server.accept

  request_line = client.gets
  puts request_line

  client.puts "HTTP/1.1 200 ok"
  client.puts "Content-Type: text/plain\r\n\r\n"

  client.puts request_line
  client.close
end

# nb: replace localhost with droplet IP (or just "") and port
# with a open tcp port when running on droplet.
# in browser go to http://<ip>:<port>
