extends SignalListener

func _ready():
	subscribe(round_number_update, 
	all_signals.ROUND_NUMBER_UPDATE)
	subscribe(announce_new_round, 
	all_signals.BEGIN_PREPARATIONS_FOR_NEW_ROUND)

func round_number_update(round_number : int):
	print("UPDATE ROUND NUMBER")
	parent.set_round_number(round_number)

func announce_new_round(ticks:int):
	parent.announce_new_round(ticks)
	
