class_name HealthController extends Node2D

@export var health : int
@export var health_bar_ui : TextureProgressBar
var parent
# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func initialize_health(_health : int):
	health = _health
	health_bar_ui.max_value = health
	health_bar_ui.value = health
	pass
	

	
