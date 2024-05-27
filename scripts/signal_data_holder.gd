class_name SignalDataHolder extends Node

##ZOMBIE RELATED SIGNALS
signal TOTAL_ZOMBIES_KILLED_UPDATE(total)
signal ZOMBIE_KILLED_SIGNAL()
signal DROP_GOLD_AT(gold : int, position : Vector2)
signal DROP_GOLD (gold : int)

##ROUND RELATED SIGNALS
signal PRE_ROUND_PHASE_START()
signal PRE_ROUND_PHASE_FINISH()
signal BEGIN_PREPARATIONS_FOR_NEW_ROUND(ticks:int)
signal ROUND_NUMBER_UPDATE(round_number : int)
signal START_ROUND()
signal ROUND_PROGRESS_UPDATE(progress : int)
signal ROUND_GOAL_UPDATE(goal : int)

##TIME RELATED SIGNALS 
signal TICK(wait_time : float)

##PLAYER RELATED SIGNALS
signal GOLD_UPDATE(gold : int)
signal SPEND_GOLD (gold : int)

##GUN RELATED SIGNALS
signal GUN_DAMAGE_UPGRADE_LIST_UPDATE(upgrades : Array[Upgrade])
signal GUN_FIRE_RATE_UPGRADE_LIST_UPDATE(upgrades : Array[Upgrade])
signal GUN_DAMAGE_LIST_CALLBACK(upgrades : Array[Upgrade])
signal GUN_FIRE_RATE_LIST_CALLBACK(upgrades : Array[Upgrade])
signal UPGRADE_GUN_DAMAGE(d_damage : int)
signal UPGRADE_FIRE_RATE(d_rate : int)
