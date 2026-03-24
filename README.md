# Partie 10 — Miner en 2D ! Clic souris & animations ⛏️🖱️

> Série **Zelda-like Godot** par [Lysdora Craft](https://www.youtube.com/@LysdoraCraft)

▶️ [Voir la vidéo](https://youtu.be/s92vdEEWpB8)

---

## Ce que tu apprends

- Créer une **zone de détection Area2D** (ZoneMinage) autour d'une roche
- Comprendre le concept de **`self` et `null`** pour la communication entre scripts
- Détecter un **clic souris** avec `_unhandled_input` et `InputEventMouseButton`
- Créer des **animations de minage** dans 4 directions dans SpriteFrames
- Utiliser un **booléen verrou** (`est_en_train_de_miner`) pour protéger le gameplay
- Connecter le signal **`animation_finished`** pour déverrouiller le joueur après le minage

---

## Code clé

```gdscript
# player.gd
var roche_proche = null
var est_en_train_de_miner: bool = false

func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            if roche_proche != null and not est_en_train_de_miner:
                est_en_train_de_miner = true
                animated_sprite_2d.play("miner_" + last_direction)
                roche_proche.recevoir_degats()

func _on_animated_sprite_2d_animation_finished() -> void:
    if est_en_train_de_miner:
        est_en_train_de_miner = false
```

```gdscript
# roche.gd
func _on_zone_minage_body_entered(body: Node2D) -> void:
    if body.is_in_group("Player"):
        body.roche_proche = self

func _on_zone_minage_body_exited(body: Node2D) -> void:
    if body.is_in_group("Player"):
        body.roche_proche = null
```

---

## Exercices suggérés

1. Ajoute un **curseur différent** quand le joueur survole une roche minable
2. Empêche le joueur de miner s'il est **trop loin** (distance minimum)
3. Ajoute une **barre de vie visuelle** sur la roche qui diminue à chaque coup

---

*← [Retour au projet principal](https://github.com/Lysdora/zelda-like-godot-tutorial)*
