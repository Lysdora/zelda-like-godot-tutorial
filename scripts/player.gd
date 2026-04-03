extends CharacterBody2D

@export var speed = 80.0
var last_direction = "down"
# Valeur pour limiter la marge de notre map


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



# Variable pour miner
var roche_proche = null
var est_en_train_de_miner: bool = false

func _physics_process(_delta: float) -> void:

	if  est_en_train_de_miner:
		#Arrete toi de marcher si le Player mine !
		return
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
	

	move_and_slide()


	
# Fonction pour detection du clic pour miner

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if roche_proche != null and not est_en_train_de_miner:
				est_en_train_de_miner = true
				# on jour l'animation de minage
				animated_sprite_2d.play("miner_" + last_direction)
				roche_proche.recevoir_degats()
	
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if est_en_train_de_miner:
		est_en_train_de_miner = false
