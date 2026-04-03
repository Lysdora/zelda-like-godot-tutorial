extends StaticBody2D

@onready var zone_interaction: Area2D = $ZoneInteraction
@onready var icone_interaction: Sprite2D = $ZoneInteraction/IconeInteraction

# Variable pour savoir si le petit player est proche
var player_a_proximite: bool = false


func _ready() -> void:
	icone_interaction.visible = false


func _on_zone_interaction_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Le Player est dans la zone")
		player_a_proximite = true
		icone_interaction.visible = true



func _on_zone_interaction_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		print("Le Player sort de la zone")
		player_a_proximite = false
		icone_interaction.visible = false
