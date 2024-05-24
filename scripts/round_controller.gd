class_name Round extends Node

signal next_round(round_number : int, enemies_in_round : int)

var round_number : int
var enemies_in_round : int

# Called when the node enters the scene tree for the first time.
func _ready():
	round_number = 2
	enemies_in_round = 7
	next_round.emit(round_number, enemies_in_round)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _zombie_killed():
	pass
