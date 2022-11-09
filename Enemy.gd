extends KinematicBody2D

export var health_max := 100

var health := health_max

var pushback_force := Vector2.ZERO


func take_damage(amount: int) -> void:
	health = health - amount
	

func knock_back(source_position: Vector2) -> void:
	pushback_force = -global_position.direction_to(source_position) * 300


func _physics_process(delta: float) -> void:
	pushback_force = lerp(pushback_force, Vector2.ZERO, delta * 10)
	move_and_slide(pushback_force)
	
