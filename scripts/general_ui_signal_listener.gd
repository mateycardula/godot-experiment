extends SignalListener


func _ready():
	subscribe(display_gold_drop,
	all_signals.DROP_GOLD_AT)

func display_gold_drop(amount : int, position : Vector2):
	parent.display_gold_drop(amount, position)
