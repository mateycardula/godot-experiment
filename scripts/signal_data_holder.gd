class_name SignalDataHolder extends Node

##ZOMBIE RELATED SIGNALS
signal TOTAL_ZOMBIES_KILLED_CHANGE(total)
signal ZOMBIE_KILLED_SIGNAL()

##ROUND RELATED SIGNALS
signal BEGIN_PREPARATIONS_FOR_NEW_ROUND(ticks:int)
signal NEXT_ROUND(round_number : int, enemies_in_round : int)
signal ROUND_NUMBER_CHANGE(round_number : int)
signal ROUND_GOAL_UPDATE(progress : int, goal : int)

##TIME RELATED SIGNALS 

signal TICK(wait_time : float)
