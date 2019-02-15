require 'socket'

def parse_request(request)
  http_method, path_and_params, version = request.split
  path, all_parameters = path_and_params.split('?')
  param_array = (!!all_parameters ? all_parameters.split('&') : [])

  params = {}
  param_array.each do |param|
    key, value = param.split('=')
    params[key] = value
  end

  [http_method, path, params]
end

server = TCPServer.new("localhost", 8080)
loop do
  client = server.accept

  request_line = client.gets
  puts request_line
  next unless request_line

  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.1 200 ok"
  client.puts "Content-Type: text/html"
  client.puts

  client.puts "<html>"
  client.puts "<body>"

  client.puts "<pre>"
  client.puts request_line
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Rolls!</h1>"
  sides = params["sides"].to_i
  rolls = params["rolls"].to_i
  rolls.times { client.puts "<p>", rand(1..sides), "</p>" }

  client.puts "</body>"
  client.puts "</html>"
  client.close
end
