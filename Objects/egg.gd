extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal egg_dropped()
export var is_falling = false
export var current_position = 0
export var egg_position = 0
var position_list
var paddle_position = 1
export(NodePath) var pos0
export(NodePath) var pos1
export(NodePath) var pos2
export(NodePath) var pos3
export(NodePath) var pos4
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pos0 = get_node(pos0).get_global_position()
	pos1 = get_node(pos1).get_global_position()
	pos2 = get_node(pos2).get_global_position()
	pos3 = get_node(pos3).get_global_position()
	pos4 = get_node(pos4).get_global_position()
	position_list = [pos0, pos1, pos2, pos3, pos4]
	set_position(position_list[0])

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func Move():
	var rand = rand_range(0,100)
	var rand_reverse = true if rand_range(0,100) < (20 * current_position) else false
	if (current_position == 0): rand_reverse = true
	var will_move = true if rand > 30 else false
	if (current_position >= 3 && paddle_position == egg_position): will_move = true
	if (will_move):
		#print("Egg Position: {ep}, Paddle Position: {pp}".format({"ep":egg_position,"pp":paddle_position}))
		if (!is_falling): is_falling = rand_reverse
		if (current_position == 4 and is_falling): 
			will_move = false
			emit_signal("egg_dropped")
		if (current_position == 0 and !is_falling): will_move = false
		if (will_move):
			#var newPos = 1 if is_falling else -1
			if (is_falling):
				if(current_position >= 3 && paddle_position == egg_position):
					is_falling = !is_falling
					current_position -= 1
				else:
					current_position += 1
			else: 
				current_position -= 1
	set_position(position_list[current_position])
	
func SetPos(newPos):
	if (newPos == 0): return get_node(pos0).get_global_position()
	elif (newPos == 1): return get_node(pos1).get_global_position()
	elif (newPos == 2): return get_node(pos2).get_global_position()
	elif (newPos == 3): return get_node(pos3).get_global_position()
	elif (newPos == 4): return get_node(pos4).get_global_position()


func _on_Serin_PositionCheck(position):
	paddle_position = position
