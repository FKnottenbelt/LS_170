require "erb"

template = %(
  <html>
    <body>
      <h1>Messages for <%= name %></h1>
      <ul>
        <% messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </body>
  </html>
)

name = "Ruby Monstas"
messages = [
  "We meet every Monday night at 7pm",
  "We've almost completed the beginners course!",
  "Feel free to come by and join us!"
]


html = ERB.new(template).result(binding)
puts html

# output:
# <html>
#   <body>
#     <h1>Messages for Ruby Monstas</h1>
#     <ul>
#       <li>We meet every Monday night at 7pm</li>
#       <li>We've almost completed the beginners course!</li>
#       <li>Feel free to come by and join us!</li>
#     </ul>
#   </body>
# </html>
