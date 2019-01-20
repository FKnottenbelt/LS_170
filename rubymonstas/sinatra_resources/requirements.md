## Exercise 5.1

Start by writing a Sinatra application that has an index and a
show route:

- On GET to /members display a list of member names, which are
  stored in a file members.txt. The erb template name is index.erb.
- Each of the member names is a link that points to /members/:name
  (:name being the given member’s name)
- On GET to /members/:name display a details page for this member
  (i.e. just show their name), and a link “All Members” that goes
  back to /members. The erb template name is show.erb.

## Exercise 5.2

Now add the new and create routes:

- Add a link “New member” to the index.erb view, and point it to /members/new.
- On GET to /members/new display a form that POSTs to /members. This form has
  one input element called name and a submit button. Also, add a link “Back”
  that goes to /members.

- On POST to /members validate that the given name is not empty, and not
  already in our list. If the validation succeeds, redirect the user to
  /members/:name and pass a success message by using the session. If the
  validation fails re-render the form and display an error message.

- Make sure the success message is displayed in the show.erb view.

