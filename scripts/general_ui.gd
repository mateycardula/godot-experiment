extends Control

@export var time_controller : TimeControl

func display_gold_drop(amount : int, position : Vector2):
	var label = Label.new()
	label.global_position = position
	label.text = "+ %d gold" % [amount]
	label.modulate = Color.GOLD
	label.top_level = true
	add_child(label)
	await time_controller.wait_for(10)
	label.queue_free()
	pass
