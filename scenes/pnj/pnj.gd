extends StaticBody2D

# =================== VARIABLES CONFIGURABLES ===================
@export var nom_pnj: String = "PNJ"
@export var texte_dialogue: String = "Bonjour aventurier !"

# =================== VARIABLES CONFIGURABLES ===================
@onready var zone_interaction: Area2D = $ZoneInteraction
@onready var icone_interaction: Sprite2D = $ZoneInteraction/IconeInteraction

# Variable pour savoir si le petit player est proche
var player_a_proximite: bool = false

func _ready() -> void:
	# je cache l'icone interaction
	icone_interaction.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if player_a_proximite and event.is_action_pressed("Interagir"):
		demarrer_dialogue()

func demarrer_dialogue():
	var dialogue_box = get_node("/root/Foret/UI/DialogueBox")
	dialogue_box.afficher_dialogue(nom_pnj, texte_dialogue)
	print("Dialogue avec ", nom_pnj, " demarré !")

func _on_zone_interaction_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_a_proximite = true
		icone_interaction.visible = true

func _on_zone_interaction_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_a_proximite = false
		icone_interaction.visible = false
