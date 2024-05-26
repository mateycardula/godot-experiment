extends SignalListener

func _ready():
	subscribe(round_number_change, all_signals.ROUND_NUMBER_CHANGE)
	pass

func round_number_change(round_number : int):
	parent.round_number_change(round_number)
	pass
