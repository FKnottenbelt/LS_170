require 'socket'

def parse_request(request)
  input = request.split

  http_method = input.shift
  path = input.first.split('?').shift

  param_array = input.first.split('?').last
  param_array = param_array.split('&')

  params = {}
  param_array.each do |param|
    key = param.split('=').first
    value = param.split('=').last
    params[key] = value
  end

  request = Struct.new(:method, :path, :params)
  request = request.new(http_method, path, params)
end

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

  request = parse_request(request_line)

  # first line of request into response (display in browser)
  client.puts request_line

  # our program (into response (display in browser))
  sides = request.params["sides"].to_i
  rolls = request.params["rolls"].to_i
  rolls.times { client.puts rand(1..sides) }

  # close connection
  client.close
end

# nb: replace localhost with droplet IP (or just "") and port
# with a open tcp port when running on droplet.
# in browser go to http://<ip>:<port>
# on AWS, just go to preview running application (no port, you
# can just add the params, starting with '?')
