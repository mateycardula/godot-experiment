class_name SignalMiddleware extends Node

func find_signal_controller(node, controller_name):
	var parent = node.get_parent()
	while(parent.get_parent() != null):
		parent = parent.get_parent()
	return parent.get_child(0).find_child(controller_name)

func subscribe(callable : Callable, signal_to : Signal):
	signal_to.connect(callable)
	pass
