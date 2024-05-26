class_name ZombieSpawnerSignalsListener extends SignalListener

func _ready():
	subscribe(update_round_number, 
	all_signals.ROUND_NUMBER_UPDATE)
	
	subscribe(update_enemies_in_round, 
	all_signals.ROUND_GOAL_UPDATE)
	
	subscribe(start_round, 
	all_signals.START_ROUND)
	
func start_round():
	parent.start_round()
	pass

func update_round_number(round_number : int):
	print("ROUND NUMBER CHANGE!!")
	parent.set_round_number(round_number)

func update_enemies_in_round (enemies_in_round : int):
	parent.set_enemies_in_round(enemies_in_round)
