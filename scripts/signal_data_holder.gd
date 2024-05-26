class_name SignalDataHolder extends Node

##ZOMBIE RELATED SIGNALS
signal TOTAL_ZOMBIES_KILLED_UPDATE(total)
signal ZOMBIE_KILLED_SIGNAL()

##ROUND RELATED SIGNALS
signal BEGIN_PREPARATIONS_FOR_NEW_ROUND(ticks:int)
signal ROUND_NUMBER_UPDATE(round_number : int)
signal START_ROUND()
signal ROUND_PROGRESS_UPDATE(progress : int)
signal ROUND_GOAL_UPDATE(goal : int)

##TIME RELATED SIGNALS 
signal TICK(wait_time : float)
