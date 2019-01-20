Exercise 5.1

Start by writing a Sinatra application that has an index and a
show route:

- On GET to /members display a list of member names, which are
  stored in a file members.txt. The erb template name is index.erb.
- Each of the member names is a link that points to /members/:name 
  (:name being the given member’s name)
- On GET to /members/:name display a details page for this member
  (i.e. just show their name), and a link “All Members” that goes
  back to /members. The erb template name is show.erb.

