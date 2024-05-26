class_name RoundSignalPublisher extends SignalPublisher
	
func update_total_zombies_killed(total):
	all_signals.TOTAL_ZOMBIES_KILLED_CHANGE.emit(total)

func emit_next_round(round_number : int, enemies_in_round : int):
	all_signals.BEGIN_PREPARATIONS_FOR_NEW_ROUND.emit(Tick.new().number_of_ticks(6))
	all_signals.NEXT_ROUND.emit(round_number, enemies_in_round)
	all_signals.ROUND_NUMBER_CHANGE.emit(round_number)

func goal_update(progress : int, goal : int):
	all_signals.ROUND_GOAL_UPDATE.emit(progress, goal)
