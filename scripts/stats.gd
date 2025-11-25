class_name Stats
extends Resource

@export var max_hp: float
@export var current_hp: float

var is_dead: bool:
	get:
		return current_hp <= 0

func take_damage(damage: float) ->  void:
	current_hp -= damage
	
	if is_dead:
		current_hp = 0
