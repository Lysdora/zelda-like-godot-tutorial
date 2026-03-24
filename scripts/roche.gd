extends StaticBody2D

@onready var son_minage: AudioStreamPlayer2D = $SonMinage
@onready var son_destruction: AudioStreamPlayer2D = $SonDestruction
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var data: RocheData
@export var minerai_sol_scene: PackedScene

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

func recevoir_degats():
	vie -= 1
	son_minage.play()
	flash()
	trembler()
	if vie <= 0:
		detruire()

func detruire():
	# 1. Prévenir le player que la roche n'existe plus
	for body in $ZoneMinage.get_overlapping_bodies():
		if body.is_in_group("Player"):
			body.roche_proche = null
			
	# 2. Cacher le sprite
	sprite_2d.visible = false
	
	# 3. Désactiver la collision (set_deferred)
	$CollisionShape2D.set_deferred("disabled", true)
	
	# 4. Son de destruction + attendre
	son_destruction.play()
	await son_destruction.finished
	
	# 5. Creer le loot de minerai
	var loot = minerai_sol_scene.instantiate()
	loot.minerai_data = data.minerai_data
	get_parent().add_child(loot)
	loot.global_position = global_position
	loot.effet_pop()
	
	# 6. Supprimer la roche
	queue_free()
	

func flash():
	sprite_2d.modulate = Color(3,3,3)
	var t = create_tween()
	t.tween_property(sprite_2d, "modulate", Color(1,1,1), 0.1)
	

func trembler():
	var t = create_tween()
	t.tween_property(sprite_2d, "position:x", 2.0, 0.03)
	t.tween_property(sprite_2d, "position:x", -2.0, 0.03)
	t.tween_property(sprite_2d, "position:x", 1.0, 0.03)
	t.tween_property(sprite_2d, "position:x", -1.0, 0.03)
	t.tween_property(sprite_2d, "position:x", 0.0, 0.03)
















	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
