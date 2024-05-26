class_name Round extends Node

signal next_round(round_number : int, enemies_in_round : int)

var round_number : int
var enemies_in_round : int
var zombies_killed_in_round : int
var total_zombies_killed : int 

@export var publish_signal : RoundSignalPublisher
@export var time_controller : TimeControl

# Called when the node enters the scene tree for the first time.
func _ready():
	round_number = 0
	enemies_in_round = 3
	total_zombies_killed = 0
	start_next_round()
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("ZOMBIES KILLED ", zombies_killed_in_round, " ZOMBIES GOAL ", enemies_in_round)
	pass

func zombie_killed():
	total_zombies_killed += 1
	zombies_killed_in_round += 1
	publish_signal.update_total_zombies_killed(total_zombies_killed)
	publish_signal.goal_update(zombies_killed_in_round, enemies_in_round)
	
	if (zombies_killed_in_round == enemies_in_round):
		start_next_round()

func start_next_round():
	publish_signal.all_signals.ROUND_NUMBER_CHANGE.emit(round_number)
	zombies_killed_in_round = 0
	round_number+=1
	enemies_in_round = (enemies_in_round * 2) - (enemies_in_round/2)
	publish_signal.goal_update(zombies_killed_in_round, enemies_in_round)
	publish_signal.all_signals.BEGIN_PREPARATIONS_FOR_NEW_ROUND.emit(6)
	await time_controller.wait_for(6)
	publish_signal.all_signals.NEXT_ROUND.emit(round_number, enemies_in_round)

	
func change_state(state, state_controller):
	match state:
		States.state.ZOMBIE_KILLED:
			state_controller.update_ui()
	pass
	
