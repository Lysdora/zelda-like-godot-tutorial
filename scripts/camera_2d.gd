extends Camera2D

var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")


func _process(_delta: float) -> void:
	self.global_position = player.global_position
