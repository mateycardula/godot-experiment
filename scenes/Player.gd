extends Node2D

@export var publish_signal : SignalPublisher

var gold : int : 
	set(value):
		gold = value
		publish_signal.all_signals.GOLD_UPDATE.emit(gold)

func _ready():
	gold = 0

func set_gold(amount : int):
	gold = amount

func d_gold(amount : int):
	gold+=amount
