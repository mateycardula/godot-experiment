extends SignalListener

func _ready():
	subscribe(round_number_update, all_signals.ROUND_NUMBER_UPDATE)

func round_number_change(round_number : int):
	parent.round_number_change(round_number)
	pass

func round_number_update(round_number : int):
	parent.set_round_number(round_number)
