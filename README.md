# Partie 09 — Des cailloux magiques ! Custom Resources ⛏️

> Série **Zelda-like Godot** par [Lysdora Craft](https://www.youtube.com/@LysdoraCraft)

▶️ [Voir la vidéo](https://www.youtube.com/watch?v=onTXq2PL4MI)

---

## Ce que tu apprends

- Comprendre ce qu'est une **Custom Resource** dans Godot
- Créer une ressource personnalisée avec `extends Resource` et `class_name`
- Déclarer des propriétés exportées (`@export`) pour les configurer dans l'inspecteur
- Créer des fichiers `.tres` (pierre, cuivre…) qui réutilisent le même script
- Lier une ressource à une scène via `@export var data: RocheData`
- Lire les données de la ressource dans `_ready()` pour configurer la scène

---

## Code clé

```gdscript
# roche_data.gd
extends Resource
class_name RocheData

@export var texture: Texture2D
@export var vie_max: int
@export var rarete: int
```

```gdscript
# roche.gd
@export var data: RocheData
var vie: int

func _ready() -> void:
    vie = data.vie_max
    sprite_2d.texture = data.texture
```

---

## Exercices suggérés

1. Crée une nouvelle ressource `mine_fer.tres` avec ses propres valeurs
2. Ajoute un champ `nom: String` à `RocheData` et affiche-le dans la console au démarrage
3. Fais varier la taille de la collision en fonction de la `rarete` de la roche

---

*← [Retour au projet principal](https://github.com/Lysdora/zelda-like-godot-tutorial)*
