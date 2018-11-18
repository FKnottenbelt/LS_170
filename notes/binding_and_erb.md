# A closer look at Kernel#binding in the context of ERB templating
Looking at the Kernel#binding object as enountered in lesson 3
"growing your framework with Rack part 4":

```ruby
# updated erb method

def erb(filename, local = {})
  b = binding
  message = local[:message]
  content = File.read("views/#{filename}.erb")
  ERB.new(content).result(b)
end
```
# conclusion:

`Kernel#binding` here has a contex of the erb method. It 'sees'
all the variables in the method and in the method parameter list.
(and self, but that is not an issue here).

ERB only processes the template when result is called. This means that
the output will show the values of variables as they are at the moment
when the result is rendered, not when the ERB object was defined.

The .result method accepts a binding as an argument

If the .result happens `in main` (not in a method or object)
it has all variabels in scope and you do not need to give it a
specific binding

If the .result happens `in a method` you have to get a binding to
the method scope (`b = binding, ERB.new(content).result(b)`)
But just defining the binding at the last possible moment works at well:
`ERB.new(content).result(binding)`

if the .result needs to use the variables from `a separate object`,
you need to specify a binding method in the class:
```ruby
  def get_binding
    binding()
  end
```
so you can get to it later:
```ruby
  list = ShoppingList.new(items)
  renderer = ERB.new(template)
  puts output = renderer.result(list.get_binding)
```
see /170/notes/binding.rb for full examples.



