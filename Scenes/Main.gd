extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(NodePath) var egg1
export(NodePath) var egg2
export(NodePath) var egg3
export(NodePath) var scoreLabel
export var dropDelay = 100

var eggs = [egg1, egg2, egg3]
var dropDelayCounter = dropDelay
var score = 0
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var eggs = [egg1, egg2, egg3]
	scoreLabel = get_node(scoreLabel)

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if (dropDelayCounter <= 0): 
		#for egg in eggs:
		#	eggMove(egg)
		eggMove(egg1)
		eggMove(egg2)
		eggMove(egg3)
		score += 1
		updateScore()
		dropDelayCounter = dropDelay
	dropDelayCounter = dropDelayCounter - 1

func eggMove(egg):
	var e = get_node(egg)
	e.Move()

func _on_Serin_PositionCheck(position):
	pass # replace with function body

func updateScore():
	scoreLabel.text = "Score: {s}".format({"s":score})

func _on_egg_dropped():
	print("Oh No! You dropped an egg. Your high score was {s}".format({"s":score}))
	get_tree().reload_current_scene()
