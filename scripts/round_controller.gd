class_name Round extends Node

signal next_round(round_number : int, enemies_in_round : int)

var round_number : int :
	set(value):
		round_number = value
		print("SHOULD EMIT round number change")
		publish_signal.all_signals.ROUND_NUMBER_UPDATE.emit(round_number)
		
var enemies_in_round : int :
	set(value):
		enemies_in_round = value
		publish_signal.all_signals.ROUND_GOAL_UPDATE.emit(enemies_in_round)
		
var zombies_killed_in_round : int:
	set(value):
		zombies_killed_in_round = value
		publish_signal.all_signals.ROUND_PROGRESS_UPDATE.emit(zombies_killed_in_round)

var total_zombies_killed : int:
	set(value):
		total_zombies_killed = value
		publish_signal.all_signals.TOTAL_ZOMBIES_KILLED_UPDATE.emit(total_zombies_killed)

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
	if (zombies_killed_in_round == enemies_in_round):
		start_next_round()

func start_next_round():
	set_round_data()
	
	publish_signal.all_signals.BEGIN_PREPARATIONS_FOR_NEW_ROUND.emit(6)
	await time_controller.wait_for(6)
	publish_signal.all_signals.START_ROUND.emit()

	
func change_state(state, state_controller):
	match state:
		States.state.ZOMBIE_KILLED:
			state_controller.update_ui()
	pass

func set_round_data():
	zombies_killed_in_round = 0
	round_number = round_number+1
	enemies_in_round = (enemies_in_round * 2) - (enemies_in_round/2)
