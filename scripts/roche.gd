extends StaticBody2D


@onready var sprite_2d: Sprite2D = $Sprite2D


@export var data: RocheData
var vie: int


func _ready() -> void:
	vie = data.vie_max
	sprite_2d.texture = data.texture


func _on_zone_minage_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.roche_proche = self
		print("Player peut miner !")


func _on_zone_minage_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.roche_proche = null
		print("Player ne peut plus miner !")
