extends MarginContainer

@onready var nom_pnj: Label = $PanelContainer/VBoxContainer/NomPNJ
@onready var texte_dialogue: RichTextLabel = $PanelContainer/VBoxContainer/TexteDialogue

func _ready() -> void:
	hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Interagir"):
		afficher_dialogue("Bilbo", "Je suis fatigué")
	
	if event.is_action_pressed("Fermer"):
		fin_de_conversation()

func afficher_dialogue(nom: String, dialogue: String):
	nom_pnj.text = nom
	texte_dialogue.text = dialogue
	show()

func fin_de_conversation():
	hide()
