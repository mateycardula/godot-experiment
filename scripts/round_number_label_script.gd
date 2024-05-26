extends Label

var round_number : 
	set(value):
		round_number = value
		draw_update()

func draw_update():
	text = "Round number: %d " % [round_number]
	
func set_round_number(value):
	round_number = value
