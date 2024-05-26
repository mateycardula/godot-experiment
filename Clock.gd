class_name Clock extends Timer
	
@export var tick_publisher : SignalPublisher

func _on_timeout():
	tick_publisher.publish_tick(wait_time)
	pass # Replace with function body.

