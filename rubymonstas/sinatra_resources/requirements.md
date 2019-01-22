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

## Exercise 5.3

Next add the edit and update routes:

- In the index.erb view add a link “Edit” next to each of the listed names,
  and point it to /members/:name/edit.

- Also, add the same link to the show.erb view.

- On GET to /members/:name/edit display a form that PUTs to /members/:name.
  This form has the same elements as the form on new.erb. Also, add a link
  “Back” that goes to /members.

- On PUT to /members/:name validate the given name. If the validation
  succeeds redirect the user to /members/:name and pass a success message
  by using the session. If the validation fails re-render the form and
  display an error message.

## Exercise 5.4

Finally add the delete and destroy routes:

- In the index view add a link “Delete” next to each of the “Edit” links,
  and point it to /members/:name/delete.

- Also, add the same link to the show.erb view.

- On GET to /members/:name/delete prompt the user for confirmation: “Do
  you really want to remove the member [name]?”, and add a form that sends
  a DELETE request to /members/:name, with a button “Remove Member”. Also
  add a link “Back” that goes to `/members/.

- On DELETE to /members/:name remove the name from the file names.txt, and
  redirect to /members
