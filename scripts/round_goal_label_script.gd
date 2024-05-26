extends Label

var progress = 0: 
	set(value):
		progress = value
		draw_update()
		
var goal  = 0: 
	set(value):
		goal = value
		draw_update()
		
func draw_update():
	text = "ROUND GOAL: %d / %d " % [progress, goal]

func set_progress(value):
	progress = value

func set_goal(value):
	print("UPDATE GOAL")
	goal = value
