extends SignalListener

func _ready():
	subscribe(goal_update,
	all_signals.ROUND_GOAL_UPDATE)
	pass

func goal_update(progress, goal):
	parent.round_goal_update(progress, goal)
	pass
