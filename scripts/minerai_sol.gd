extends Area2D

@onready var son_ramassage: AudioStreamPlayer2D = $SonRamassage
@onready var label_ramassage: Label = $LabelRamassage

var minerai_data: MineraiData 

func _ready() -> void:
	$Sprite2D.texture = minerai_data.texture
	label_ramassage.text = "+1 " + minerai_data.nom
	label_ramassage.visible = false



func effet_pop():
	scale = Vector2.ZERO
	modulate.a = 0.0
	
	var pos = global_position
	
	var cible_x = pos.x + randf_range(-15.0, 15.0)
	var cible_y = pos.y -15.0
	
	var t1 = create_tween()
	t1.tween_property(self, "global_position:y", cible_y, 0.3)\
	.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	
	var t2 = create_tween()
	t2.tween_property(self, "global_position:x", cible_x, 0.4)\
	.set_ease(Tween.EASE_OUT)
	
	var t3 = create_tween()
	t3.tween_property(self, "modulate:a", 1.0, 0.2)
	
	var t4 = create_tween()
	t4.tween_property(self, "scale", Vector2.ONE, 0.2)\
	.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)

	
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		son_ramassage.play()
		effet_label()
		print("Ramassée : " + minerai_data.nom)
		await get_tree().create_timer(1.0).timeout
		queue_free()
		


func effet_label():
	label_ramassage.visible = true
	var pos_depart = label_ramassage.position
	
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(label_ramassage, "position:y",
	pos_depart.y - 30, 1.5).set_ease(Tween.EASE_OUT)
	
	tween.tween_property(label_ramassage, "modulate:a",
	0.0 , 1.5).set_ease(Tween.EASE_IN)
	
		
		
		
		
		
		
		
		
		
		
		
		
	
