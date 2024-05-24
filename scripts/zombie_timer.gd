extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	wait_time = randf_range(2.0, 5.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	wait_time = randf_range(2.0, 5.0)
	pass # Replace with function body.
