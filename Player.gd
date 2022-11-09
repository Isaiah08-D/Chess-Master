extends KinematicBody2D

onready var sprite = get_node("/root/Map/Player/Sprite")
onready var camera = get_node("/root/Map/Camera")
var speed = 2000

var movement = {"up": false, "down": false, "left": false, "right": false}
var moved = false

var player_collision

var vel = Vector2(0,0)

func _ready():
	pass
	
	
func _process(delta):
	
	if Input.is_action_pressed("up"):
		movement["up"] = true
	else: movement["up"] = false
	if Input.is_action_pressed("down"):
		movement["down"] = true
	else: movement["down"] = false
	if Input.is_action_pressed("left"):
		movement["left"] = true
	else: movement["left"] = false
	if Input.is_action_pressed("right"):
		movement["right"] = true
	else: movement["right"] = false
	
	if movement["left"] and movement["up"] == true:
		sprite.set_animation("walk-upleft")
		vel.x -= delta * speed/2
		vel.y -= delta * speed/2
		moved = true
	elif movement["left"] and movement["down"] == true and !moved:
		sprite.set_animation("walk-downleft")
		vel.x -= delta * speed/2
		vel.y += delta * speed/2
		moved = true
	elif movement["right"] and movement["up"] == true and !moved:
		sprite.set_animation("walk-upright")
		vel.x += delta * speed/2
		vel.y -= delta * speed/2
		moved = true
	elif movement["right"] and movement["down"] == true and !moved:
		sprite.set_animation("walk-downright")
		vel.x += delta * speed/2
		vel.y += delta * speed/2
		moved = true
	elif movement["up"] == true and !moved:
		sprite.set_animation("walk-up")
		vel.y -= delta * speed
		moved = true
	elif movement["down"] == true and !moved:
		sprite.set_animation("walk-down")
		vel.y += delta * speed
		moved = true
	elif movement["left"] == true and !moved:
		sprite.set_animation("walk-left")
		vel.x -= delta * speed
		moved = true
	elif movement["right"] == true and !moved:
		sprite.set_animation("walk-right")
		vel.x += delta * speed
		moved = true

	player_collision = move_and_collide(vel)
	
	if player_collision:
		print(player_collision.collider.name)
		
	moved = false
		
	camera.position = position
	
	vel = Vector2(0,0)
	

		

		
