my_name = 'SeuRAUL L. e Silva'
my_age = 23 # not a lie
my_height = 163 # cms
my_weight = 54 # kgs
my_eyes = 'Brown'
my_teeth = 'White'
my_hair = 'Brown'

puts "Let's talk about %s" % my_name
puts "He's %d cm tall." % my_height
puts "He's %d kgs" % my_weight
puts "Actually that's not too heavy."
puts "He's got %s eyes and %s hair." % [my_eyes, my_hair]
puts "His teeth are usually %s depending on the coffe." %my_teeth

# this line is tricky, try to get ir exactly right
puts "If I add %d, %d, and %d I get %d." % [my_age, my_height, my_weight, my_age + my_height + my_weight]