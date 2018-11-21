class Application
  def call(env)    # here is the call that 'run' needs. hash env = incomming
                   # request, courtesy of Rack
    status  = 200
    headers = { "Content-Type" => "text/html" }
  # body    = ["Yay, your first web application! <3"]
    body    = ["<html><body><h1>Yay, your first web application!
               <3</h1></body></html>"]

    [status, headers, body] # HTTP response array
  end
end

run Application.new   # run is a Rack method that needs something that
  # responds to 'call'
