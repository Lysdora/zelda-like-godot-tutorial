extends CharacterBody2D

@export var speed = 80.0
var last_direction = "down"
# Valeur pour limiter la marge de notre map
var offset = 20

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera: Camera2D = $Camera2D



func _physics_process(_delta: float) -> void:
	var move_input = Vector2.ZERO
	
	if Input.is_action_pressed("move_down"):
		move_input.y = 1
		last_direction = "down"
	elif Input.is_action_pressed("move_up"):
		move_input.y = -1
		last_direction = "up"
	elif Input.is_action_pressed("move_left"):
		move_input.x = -1
		last_direction = "left"
	elif Input.is_action_pressed("move_right"):
		move_input.x = 1
		last_direction = "right"
	
	velocity = move_input * speed
	
	if move_input != Vector2.ZERO:
		# Si le personnage bouge
		animated_sprite_2d.play("walk_" + last_direction)
	else:
		$AnimatedSprite2D.play("idle_" + last_direction)
	
	player_clamp()
	
	move_and_slide()
	
func player_clamp():
	position.x = clampf(
		position.x,
		camera.limit_left + offset, #valeur min
		camera.limit_right - offset #valeur max
	)
	position.y = clampf(
		position.y,
		camera.limit_top + offset,
		camera.limit_bottom - offset
	)
	

	
	
