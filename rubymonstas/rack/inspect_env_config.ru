class Application
  def call(env)    # here is the call that 'run' needs. hash env = incomming
                   # request, courtesy of Rack

    puts inspect_env(env)

    status  = 200
    headers = { "Content-Type" => "text/html" }
  # body    = ["Yay, your first web application! <3"]
    body    = ["<html><body><h1>Yay, your first web application!
               <3</h1></body></html>"]

    [status, headers, body] # HTTP response array
  end

  def inspect_env(env)
    puts format('Request headers', request_headers(env))
    puts format('Server info', server_info(env))
    puts format('Rack info', rack_info(env))
  end

  def request_headers(env)
    env.select { |key, value| key.include?('HTTP_') }
  end

  def server_info(env)
    env.reject { |key, value| key.include?('HTTP_') or key.include?('rack.') }
  end

  def rack_info(env)
    env.select { |key, value| key.include?('rack.') }
  end

  def format(heading, pairs)
    [heading, "", format_pairs(pairs), "\n"].join("\n")
  end

  def format_pairs(pairs)
    pairs.map { |key, value| '  ' + [key, value.inspect].join(': ') }
  end
end

run Application.new   # run is a Rack method that needs something that
  # responds to 'call'

# check PATH_INFO: and REQUEST_METHOD: in server info.