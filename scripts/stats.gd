class_name Stats
extends Resource

@export var max_hp: float
@export var current_hp: float

var is_dead: bool:
	get:
		return current_hp <= 0
		
var current_hp_percentage: float:
	get:
		return current_hp / max_hp * 100

func take_damage(damage: float) ->  void:
	current_hp -= damage
	
	if is_dead:
		current_hp = 0
