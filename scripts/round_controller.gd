class_name Round extends Node

signal next_round(round_number : int, enemies_in_round : int)

var round_number : int
var enemies_in_round : int
var zombies_killed_in_round : int

# Called when the node enters the scene tree for the first time.
func _ready():
	round_number = 0
	enemies_in_round = 3
	start_next_round()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("ZOMBIES KILLED ", zombies_killed_in_round, " ZOMBIES GOAL ", enemies_in_round)
	pass

func zombie_killed():
	zombies_killed_in_round += 1
	if (zombies_killed_in_round == enemies_in_round):
		start_next_round()

func start_next_round():
	zombies_killed_in_round = 0
	round_number+=1
	enemies_in_round = (enemies_in_round * 2) - (enemies_in_round/2)
	next_round.emit(round_number, enemies_in_round)
	
