extends Node
# Ce script gere la quete des poulets

signal quete_changee

var quete_active: bool = false

var poulet_ramasees: int = 0
var poulet_requis: int = 5


	


# ====================================
# 🎬 FONCTION 1 : DEMARRER LA QUETE
#=====================================
func demarrer_quete(nombre_requis: int) -> void:
	# On active la quete
	quete_active = true
	# Combien de poulet il faut ramasser
	poulet_requis = nombre_requis
	# on remet le compteur a zero
	poulet_ramasees = 0
	# Avertir notre signal
	quete_changee.emit()
	print("Quete demarrée ! Objectif : " + str(poulet_requis) + " poulet")

# ====================================
# 🐔 FONCTION 2 : COLLECTER UN POULET
#=====================================
func collecter_poulet() -> void:
	# On verifie si la quete est active
	if quete_active:
		# On ajoute 1 au compteur
		poulet_ramasees += 1 
		quete_changee.emit()
		print("🐔 Poulet ramassé !")

# ====================================
# ✅ FONCTION 3 : VERIFIER SI QUETE EST TERMINEE
#=====================================
func est_quete_terminee() -> bool:
	# On retourne " true" vrai si le joueur a ramssé assez de poulet
	return poulet_ramasees >= poulet_requis

# ====================================
# ✅ FONCTION 4 : TERMINER LA QUETE
#=====================================
func terminer_quete() -> void:
	# On desative la quete
	quete_active = false		
	
