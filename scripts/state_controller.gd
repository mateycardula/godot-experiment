class_name StateController extends Node2D

signal change_state(state)

func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func emit_change_state(state):
	change_state.emit(state)

func _on_pause_pressed():
	emit_change_state(States.state.PAUSE)
	pass # Replace with function body.

func _on_resume_pressed():
	emit_change_state(States.state.RESUME)
	pass # Replace with function body.
