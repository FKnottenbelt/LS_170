require 'socket'

server = TCPserver.new("localhost", 8080)
loop do
  client = server.accept

  request_line = client.gets
  puts request_line

  client.puts request_line
  client.close
end

client.puts "HTTP/1.1 200 OK\r\n\r\n"