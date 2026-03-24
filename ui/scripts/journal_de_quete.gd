extends NinePatchRect


@onready var journal_de_quete: NinePatchRect = $"."

#=============================================
# LES DEUX BOITES CONTAINER DU JOURNAL DE QUETES
#=============================================
@onready var panel_liste_quete: PanelContainer = $PanelListeQuete
@onready var panel_detail_quete: PanelContainer = $PanelDetailQuete

# LISTE DES QUETES
@onready var item_list: ItemList = $PanelListeQuete/VBoxContainer/ItemList
# TITRE DE LA QUETE
@onready var label_titre_quete: Label = $PanelDetailQuete/VBoxContainer/LabelTitreQuete
# DESCRIPTION + ICONE QUETE
@onready var texte_quete: RichTextLabel = $PanelDetailQuete/VBoxContainer/Description/HBoxContainer/TexteQuete
@onready var icone_quete: TextureRect = $PanelDetailQuete/VBoxContainer/Description/HBoxContainer/IconeQuete
# BUTTON QUITTER JOURNAL
@onready var bouton_quitter_journal: TextureButton = $BoutonQuitterJournal
# BUTTON QUITTER DETAIL QUETE
@onready var bouton_quitter_quete: TextureButton = $BoutonQuitterQuete


var quetes = []

func _ready() -> void:
	#journal_de_quete.visible = false
	#visible = false
	print("Le journal de quete est pret")
	quetes = [
		{
			"titre": "Les Poulets de Bilbo",
			"description": "Bilbo a perdu ses adorables poulets ! Il faut aller les sauver...",
			"icone": preload("res://ui/assets/icone_quete_poulet.png"),

		},
		{
			"titre": "L'Ombre Maléfique",
			"description": "Une ombre rôde la nuit. Va parler au maire, il a aperçu l'icône dans le cimetière.",
			"icone": preload("res://ui/assets/icone_ombre_malefique.png"),
		},
		{
			"titre": "Le Donjon",
			"description": "On raconte qu'il existe un donjon hanté. Trouve la clé du donjon.",
			"icone": preload("res://ui/assets/cle_donjon_tuto.png"),
		},
		{
			"titre": "La Pêche",
			"description": "Tu aimes pêcher ? Si oui, va voir le maître de pêche à HaricotBourg.",
			"icone": preload("res://ui/assets/canne_peche_tuto.png"),
		},
		{
			"titre": "Un Ami pour la Vie",
			"description": "Apprendre à créer un jeu peut paraître compliqué. En récompense, tu peux adopter un petit chaton.",
			"icone": preload("res://ui/assets/godot_ami_tuto.png"),
		},
		{
			"titre": "Le Donjon",
			"description": "On raconte qu'il existe un donjon hanté. Trouve la clé du donjon.",
			"icone": preload("res://ui/assets/cle_donjon_tuto.png"),
		},
		{
			"titre": "Le Donjon",
			"description": "On raconte qu'il existe un donjon hanté. Trouve la clé du donjon.",
			"icone": preload("res://ui/assets/cle_donjon_tuto.png"),
		},
		{
			"titre": "Le Donjon",
			"description": "On raconte qu'il existe un donjon hanté. Trouve la clé du donjon.",
			"icone": preload("res://ui/assets/cle_donjon_tuto.png"),
		},
		
		
		
	]
	# On vide la liste visuelle ( celle faite à la main dans l'editeur)
	item_list.clear()
	
	# on remplit la liste avec les données de script
	for quete in quetes:
		item_list.add_item(quete["titre"], quete["icone"])
	
	
	afficher_liste_quete()
	
func _on_item_list_item_selected(index: int) -> void:
	var quete_courante = quetes[index]
	

	label_titre_quete.text = quete_courante["titre"]
	icone_quete.texture = quete_courante["icone"]
	texte_quete.text = quete_courante["description"]
	
	afficher_detail_quete()

func _on_bouton_quitter_journal_pressed() -> void:
	visible = false

func _on_bouton_quitter_quete_pressed() -> void:
	afficher_liste_quete()

# =============================================================
#	FONCTIONS DE GESTION DE L'AFFICHAGE
# =============================================================
func afficher_liste_quete():
	panel_liste_quete.visible = true
	panel_detail_quete.visible = false
	bouton_quitter_journal.visible = true
	bouton_quitter_quete.visible = false


func afficher_detail_quete():
	panel_liste_quete.visible = false
	panel_detail_quete.visible = true
	bouton_quitter_journal.visible = false
	bouton_quitter_quete.visible = true
