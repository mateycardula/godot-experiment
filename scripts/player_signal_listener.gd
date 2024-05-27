extends SignalListener

func _ready():
	subscribe(collect_gold,
	all_signals.DROP_GOLD)
	subscribe(spend_gold,
	all_signals.SPEND_GOLD)

func collect_gold(amount):
	parent.d_gold(amount)
	
func spend_gold(amount):
	parent.d_gold(-amount)
