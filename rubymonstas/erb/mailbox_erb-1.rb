require "erb"

class Email
  attr_reader :subject, :date, :from
  def initialize(subject, args={})
    @subject = subject
    @date = args[:date]
    @from = args[:from]
  end
end

class Mailbox
  attr_reader :emails, :name

  def initialize(box, emails)
    @name = box
    @emails = emails
  end
end

emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]
mailbox = Mailbox.new("Ruby Study Group", emails)

template =  %(
  <html>
    <head>
      <style>
        table {
          border-collapse: collapse;
        }
        td, th {
          border: 1px solid black;
          padding: 1em;
        }
      </style>
    </head>
    <body>
      <h1><%=mailbox.name%></h1>
      <table>
        <thead>
          <tr>
            <th>Date</th>
            <th>From</th>
            <th>Subject</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <% mailbox.emails.each do |mail| %>
              <td><%= mail.date %></td>
              <td><%= mail.from %></td>
              <td><%= mail.subject %></td>
            <% end %>
          </tr>
        </tbody>
      </table>
    </body>
  </html>
)

html = ERB.new(template).result(binding)

puts html

# output:
# <html>
#   <head>
#     <style>
#       table {
#         border-collapse: collapse;
#       }
#       td, th {
#         border: 1px solid black;
#         padding: 1em;
#       }
#     </style>
#   </head>
#   <body>
#     <h1>Ruby Study Group</h1>
#     <table>
#       <thead>
#         <tr>
#           <th>Date</th>
#           <th>From</th>
#           <th>Subject</th>
#         </tr>
#       </thead>
#       <tbody>
#         <tr>
#           <td>2014-12-01</td>
#           <td>Ferdous</td>
#           <td>Homework this week</td>
#         </tr>
#         <tr>
#           <td>2014-12-01</td>
#           <td>Dajana</td>
#           <td>Keep on coding! :)</td>
#         </tr>
#         <tr>
#           <td>2014-12-02</td>
#           <td>Ariane</td>
#           <td>Re: Homework this week</td>
#         </tr>
#       </tbody>
#     </table>
#   </body>
# </html>

