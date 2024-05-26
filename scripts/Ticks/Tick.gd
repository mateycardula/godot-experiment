class_name Tick extends Node

var ticks : int : 
	get: 
		return ticks
	set (value):
		ticks = value

func number_of_ticks(value) -> int:
	ticks = value
	return ticks
	
