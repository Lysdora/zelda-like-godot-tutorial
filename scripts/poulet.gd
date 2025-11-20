extends CharacterBody2D

signal poulet_collecte

# Préchargement de la scene plume
var plume_scene = preload("res://scenes/plume.tscn")


@onready var zone_collecte: Area2D = $ZoneCollecte
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var icone_interaction: Sprite2D = $IconeInteraction



# Vitesse de déplacement du poulet
@export var vitesse: float = 30.0

# Direction actuelle du poulet
var direction: Vector2 = Vector2.RIGHT

# Est-ce que le poulet peut encore etre ramassé ?
var peut_etre_ramasse:bool = true
# Est-ce que le poulet est en train de marcher ?
var est_en_train_de_marcher: bool = true
# Est-ce que le player est proche du poulet ?
var player_a_proximite: bool = false



func _ready() -> void:
	icone_interaction.visible = false
	choisir_nouvelle_direction()
	
	

func _physics_process(_delta: float) -> void:
	# On bouge SEULEMENT si le poulet marche
	if est_en_train_de_marcher:
		velocity = direction * vitesse
	else:
		velocity = Vector2.ZERO # Le poulet s'arrete
		
	move_and_slide()
	
	# Si le poulet touche un mur, il change de direction
	if is_on_wall():
		choisir_nouvelle_direction()



func _on_zone_collecte_body_entered(body: Node2D) -> void:
	if body.name == "Player" and peut_etre_ramasse:
		player_a_proximite = true
		icone_interaction.visible = true


func _on_zone_collecte_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_a_proximite = false
		icone_interaction.visible = false		

func _unhandled_input(event: InputEvent) -> void:
	# On verifie si le player est proche et 
	# que le poulet peut etre ramassé
	if player_a_proximite and peut_etre_ramasse:
		if event.is_action_pressed("Interagir"):
			# On verifie si la quete est active
			if GestionnaireQuete.quete_active:
				ramasser()
			else:
				print("Tu dois parler avec Bilbo")

func ramasser():
	peut_etre_ramasse = false
	icone_interaction.visible = false
	
	# On previent le GestionnaireQuete
	GestionnaireQuete.collecter_poulet()
	
	
	var position_depart_y = position.y
	
	var tween = create_tween()
	
	# Le saut vers le haut
	tween.tween_property(self,"position:y", position_depart_y - 15,0.25)
	
	# faire tourner le poulet
	tween.tween_property(self, "rotation_degrees", 360, 0.5)
	
	# le retour au sol
	tween.tween_property(self, "position:y", position_depart_y, 0.25)
	
	# la disparition
	tween.tween_property(self, "modulate:a", 0.0, 0.3)
	
	# Attendre la fin
	await tween.finished
	
	faire_apparaitre_plume()
	
	# Emettre le signal
	poulet_collecte.emit()
	
	# Supprime le poulet
	queue_free()
	
func faire_apparaitre_plume():
	#1.  On instancie (crée) une copie de la scene
	var plume = plume_scene.instantiate()
	
	#2. On positionne la plume à l'endroit du poulrt
	plume.global_position = global_position
	
	#3. On ajoute la plume dans le jeu
	get_parent().add_child(plume)
			

func _on_timer_changement_direction_timeout() -> void:
	# Toutes les 2 seconces, on change de direction !
	choisir_nouvelle_direction()


func choisir_nouvelle_direction():
	# On tire un nombre au hasard entre 0 et 4
	var choix = randi() % 5 
	
	# Si c'est 0, le poulet fait une pause
	if choix == 0: # 20% de chance de s'arreter
		est_en_train_de_marcher = false
		animated_sprite_2d.play("idle")
		
	else:
		# Sinon, il change de direction et continue de marcher
		est_en_train_de_marcher = true
		animated_sprite_2d.play("walk")
	
	# Liste des directions possibles
	var directions_possibles = [
		Vector2.RIGHT,
		Vector2.LEFT
	]
	
	# On choisit une direction au HASARD dans la liste
	direction = directions_possibles.pick_random()
	
	if direction == Vector2.LEFT:
		animated_sprite_2d.flip_h = true # Retourne le sprite
	else:
		animated_sprite_2d.flip_h = false # en mode normal a droite
	
	
