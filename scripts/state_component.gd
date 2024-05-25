class_name StateListener extends Node


var state_controller
var parent 
signal state_callback_signal(state)
func _ready():
	parent = get_parent()
	find_state_controller()
	state_controller.change_state.connect(_change_parent_state)
	state_callback_signal.connect(state_controller.emit_change_state)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func find_state_controller():
	var parent = get_parent()
	while(parent.get_parent() != null):
		parent = parent.get_parent()
	state_controller = parent.get_child(0).find_child("StateController")

func _change_parent_state(state):
	parent.change_state(state)
	pass

func state_change_callback(state):
	state_callback_signal.emit(state)
	pass
