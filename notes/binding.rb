# Looking at the Kernel#binding object as enountered in lesson 3
# "growing your framework with Rack part 4":
#
# see /170/notes/binding_and_erb.md for conlusions
#
###############################################################
# Kernel#binding scope: its method, passed in vars and self
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    my_speak_binding = binding
    puts my_speak_binding.local_variables
  end

  def talk
    vocabulare = ['Miauw', 'Prrrr', 'Miaouuuuuuw!!!']
    my_talk_binding = binding
    favorite = 'Prrr'
    puts my_talk_binding.local_variables
    angry = 'Miaouuuuuuw!!!'
  end

end

cat = Animal.new('Kitty')
cat.speak # my_speak_binding
puts
cat.talk
# vocabulare
# my_talk_binding
# favorite
# angry

puts ("####################################################")

# Kernel#binding scope:  but no access to other methods

class SmartAnimal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def name=(new_name)
    @name = new_name
  end

  def speak
    speak_var = "my scope should be the speak method"
    my_speak_binding = binding
    puts my_speak_binding.local_variables
  end

  def talk
    talk_var = "my scope should be the talk method"
    my_talk_binding = binding
    puts my_talk_binding.local_variables
    puts eval("@name", my_talk_binding)
    puts eval("talk_var", my_talk_binding)
   # p eval("speak_var", my_talk_binding) # => undefined 'speak_var'
  end
end

kittycat = SmartAnimal.new('SmartKitty')
kittycat.speak
# speak_var
# my_speak_binding
puts
kittycat.talk
# talk_var
# my_talk_binding
# "SmartKitty"
# "my scope should be the talk method"
kittycat.name = 'ChangedKitty'
puts
kittycat.talk
# talk_var
# my_talk_binding
# ChangedKitty
# my scope should be the talk method

puts ("####################################################")

require 'erb'

weekday = Time.now.strftime('%A')
simple_template = "Today is <%= weekday %>."

renderer = ERB.new(simple_template)
puts output = renderer.result()

# => Today is Saturday.

# ERB only processes the template when result is called. This means that
# the output will show the values of variables as they are at the moment
# when the result is rendered, not when the ERB object was defined.

weekday = Time.now.strftime('%A')
simple_template = "Today is <%= weekday %>."

renderer = ERB.new(simple_template)
weekday = "FirstDay"
puts output = renderer.result()

# => Today is FirstDay.
puts ("####################################################")

# ERB gets variables from a Binding, an object that provides access to
# the instance methods and variables that are owned by another object.
# If you do not specify a Binding, the result() method gets a Binding from
# the top-level object, which will probably own very little. Fortunately,
# every Ruby class has a private binding() instance method to provide
# Bindings that points to itself, so we can easily extend any object to
# provide ERB with a Binding.

# To enable ERB to use the variables from a separate object, we must first
# ensure that it has a public method to provide a Binding. We can then get
# a Binding at any later point:

class ShoppingList
  attr_accessor :items

  def initialize(items)
    @items = items
  end

  # Expose private binding() method.
  def get_binding
    binding()
  end

end

items = ['bread', 'milk']

template = %(
  <html>
    <body>
      <h2>Shopping List</h2>
      <p><em><%= items.join(", ") %></em></p>
    </body>
  </html>
  )

list = ShoppingList.new(items)
renderer = ERB.new(template)

puts eval("items", list.get_binding)

puts output = renderer.result(list.get_binding)

# =>
# bread
# milk

#   <html>
#     <body>
#       <h2>Shopping List</h2>
#       <p><em>bread, milk</em></p>
#     </body>
#   </html>

puts ("####################################################")

# If the ERB object is enclosed in a method, and we want it to use the
# variables of the host object, we get a Binding for the host like this:

erb_template = %(
  <html>
    <body>
      <h2 style="color: red"><%= message %></h2>
    </body>
  </html>
)

def erb(filename, local = {}, template)
  b = binding

  puts eval("message", b) # nil, since message is assigned anything

  message = local[:message]

  puts eval("message", b) # Hello World!

  content = template
  ERB.new(content).result(b)
end

puts erb('index', {message: 'Hello World!'}, erb_template)

# =>
  # <html>
  #   <body>
  #     <h2 style="color: red">Hello World!</h2>
  #   </body>
  # </html>

