extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal PositionCheck(position)

export(NodePath) var pos1
export(NodePath) var pos2
export(NodePath) var pos3
var current_position
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	current_position = 1
	checkPosition()
	

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if (Input.is_action_just_released("move_left")and current_position < 2):
		current_position += 1
		checkPosition()
		
	if (Input.is_action_just_released("move_right") and current_position > 0):
		current_position -= 1
		checkPosition()
		
	set_position(setPos(current_position))

func checkPosition():
	emit_signal("PositionCheck",current_position)

func setPos(newPos):
	if (newPos == 0):
		return get_node(pos1).get_position()
	elif (newPos == 1):
		return get_node(pos2).get_position()
	elif (newPos == 2):
		return get_node(pos3).get_position()