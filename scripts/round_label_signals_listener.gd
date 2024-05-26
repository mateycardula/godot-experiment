extends SignalListener

func _ready():	
	subscribe(update_progress,
	all_signals.ROUND_PROGRESS_UPDATE)
	
	subscribe(update_goal,
	all_signals.ROUND_GOAL_UPDATE)
	pass

func update_progress(progress):
	parent.set_progress(progress)

func update_goal(goal):
	parent.set_goal(goal)
