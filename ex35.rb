def prompt()
	print "> "
end

def gold_room()
	map(4)

	puts "This room is full of gold. How much do you take?"

	prompt; next_move = gets.chomp()
	if not how_much = next_move.to_i()
		dead("Man, learn to type a number.")
	end

	if how_much < 50
		puts "Nice, you're not greedy, you win!"
		Process.exit(0)
	else
		dead("You greedy bastard!")
	end
end


def bear_room()
	map(2)

	puts "There is a bear here."
	puts "The bear has a bunch of honey."
	puts "The fat bear is in front of another door."
	puts "How are you going to move the bear?"
	bear_moved = false

	while true
		prompt; next_move = gets.chomp;

		if next_move == "take honey"
			dead("The bear looks at you then slaps you face off.")
		elsif next_move == "taunt bear" and not bear_moved
			map(3)
			puts "The bear has moved from the door. You can go through it now."
			bear_moved = true
		elsif next_move == "taunt bear" and bear_moved
			dead("The bear gets pissed off and chews your legs off.")
		elsif next_move == "open door" and bear_moved
			gold_room()
		else
			puts "I got no idea what that means."
		end
	end
end

def cthulhu_room()
	map(5)
	puts "Here you see the great evil Cthulhu."
	puts "He, it, whatever stares at you and you go insane."
	puts "Do you flee for your life or eat your head?"

	prompt; next_move = gets.chomp

	if next_move.include? "flee"
	start()
	elsif next_move.include? "head"
		dead("Well that was tasty!")
	else
		cthulhu_room()
	end
end

def dead(why)
	puts "#{why} Good job!"
	Process.exit(0)
end

def start()
	map(1)

	puts "You are in a dark room."
	puts "There is a door to your rigth and left."
	puts "Which one do you take?"

	prompt; next_move = gets.chomp

	if next_move == "left"
		bear_room()
	elsif next_move == "right"
		cthulhu_room()
	else
		dead("You strumble around the room until you starve.")
	end
end



def map(where)

	# start
	if where == 1
		mp = <<EOL
Minimap:
		|_ _|_ _|
		|       |
		|___x___|

EOL
		puts mp

	# enters bear_room
	elsif where == 2
		mp = <<EOL
Minimap:
  B = Bear
  h = honey
		|___ ___|
		|h  B  h|
		|h     h|
		|___x___|__
		|

EOL
		puts mp

		#taunted the bear
	elsif where == 3
		mp = <<EOL
Minimap:
  B = Bear
  h = honey
		|___ ___|
		|h    Bh|
		|h  x  h|
		|___ ___|__
		|

EOL
		puts mp
	
	# enters gold_room
	elsif where == 4
		mp = <<EOL
Minimap:
  g = gold
		_________
		|ggggggg|
		|ggggggg|
		|gg   gg|
		|___x___|
		|       |

EOL
		puts mp

	# enters Cthulhu_room
	elsif where == 5
		mp = <<EOL
Minimap:
  C = Cthulhu
		  _________
		  |   C   |
		  |       |
		__|___x___|
		          |

EOL
		puts mp
	end
		
end

start()								