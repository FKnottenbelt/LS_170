# HTTP
see /170/lesson_02/01_http/http_notes.md

# server in application building context
see /170/lesson_03/background.md

> 3 ways to get data into the params hash

- parameters that are extracted from the URL
```ruby
get "/chapter/:number" do
  number = params[:number]
```
- Using query parameters in the URL
`myapp/chapter/?number=2`
- By submitting a form using a POST request
The value of any input elements in the form will be sent as
parameters. The keys of these parameters will be determined by
the name attribute of the corresponding input element.
```
<input type="text" name="name">
```

> how forms work:

- When a form is submitted, the browser makes a HTTP request.

- This request is made to the path or URL specified in the action
attribute of the form element.

- The method attribute of the form determines if the request made will
use GET or POST.
```html
<h2 class="content-subhead">Search</h2>

<form action="/search" method="get">
  <input name="query" value="<%= params[:query] %>">
  <button type="submit">Search</button>
</form>
```
- The value of any input elements in the form will be sent as parameters.
The keys of these parameters will be determined by the name attribute
of the corresponding input element.


> using yaml and it's hash:

see 04-17 (user interests)

> coding and linking in erb

redo book_viewer search form

> todo?

add notes on making basic sinatra app?