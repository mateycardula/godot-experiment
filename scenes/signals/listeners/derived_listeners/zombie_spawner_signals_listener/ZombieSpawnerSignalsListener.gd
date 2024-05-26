class_name ZombieSpawnerSignalsListener extends SignalListener

func _ready():
	subscribe(start_round, 
	all_signals.NEXT_ROUND)
	pass
	
func start_round(round_number, enemies_in_round):
	parent.start_round(round_number, enemies_in_round)
	pass

