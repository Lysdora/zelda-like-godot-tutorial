extends Node2D
# On recupere le Sprite2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	
	animer()

func animer():
	#1. On memorise la position de départ en Y
	var position_depart_y = position.y
	
	#2. On crée notre Tween magique
	var tween = create_tween()
	
	#3. La plume monte de 20 pixels
	tween.tween_property(self, "position:y", position_depart_y - 20, 0.8)
	
	#4. En Meme TEMPS, le sprite toune
	tween.parallel().tween_property(sprite_2d, "rotation_degrees", 180, 0.8)
	
	#5. Puis elle disparait en fondu
	tween.tween_property(self,"modulate:a", 0.0, 0.4)
	
	#6. On attends la fin de toutes les animations
	await  tween.finished
	
	#7. On supprime la plume de la memoire
	queue_free()
	
	
	

	
