# 🗒️ Zelda-like Godot Tutorial - Complete Series
> Série de tutoriels complets pour créer un RPG Zelda-like pixel art avec Godot 4 par **Lysdora Craft**
>
> 
> Message aux abonnées Youtube
> Apres une mauvaise manipulation, en essayant de supprimer une ancienne chaine, j'ai accidentellement aussi supprimé ma chaine LysdoraCraft le 04/04/2026 vers 13h00
> J'ai contacté  Youtube qui ne peut rien faire pour moi
> Je suis degoutée :(

![Godot 4.6](https://img.shields.io/badge/Godot-4.6+-blue?logo=godotengine)
![License MIT](https://img.shields.io/badge/license-MIT-green)
![YouTube](https://img.shields.io/badge/YouTube-Lysdora%20Craft-red?logo=youtube)

---

##  Chaîne YouTube

 **[Lysdora Craft - Tutoriels Godot](https://www.youtube.com/@LysdoraCraft)**

Apprends à créer ton propre jeu d'aventure RPG façon Zelda, étape par étape, avec des explications claires et bienveillantes ! 🎮💖

---

##  À propos de cette série

Cette série de tutoriels YouTube te guide dans la création d'un RPG pixel art complet avec Godot Engine. Tu apprendras à créer un jeu avec :

- Un personnage jouable avec animations
- Des PNJ (Personnages Non-Joueurs) avec IA
- Un système de quêtes complet
- Une carte avec tilemap et collisions
- Un système de ressources personnalisées (Custom Resources)
- Un système de minage avec minerais
- Un système de loot avec effets visuels
- Des maps avec auto-tiling (Terrains)
- Et bien plus encore ! ⚔️

---

##  Comment utiliser ce repository ?

###  Structure du projet

Ce repository contient **plusieurs parties** du tutoriel, organisées en **branches** :

- **`main`** → Code de la **partie la plus récente** (actuellement partie 12)
- **`partie-12`** → Auto-tile et nouvelle map *(branche figée)*
- **`partie-11`** → Looter le minerai ! *(branche figée)*
- **`partie-10`** → Miner en 2D ! Clic souris & animations *(branche figée)*
- **`partie-09`** → Custom Resources & Minerais *(branche figée)*
- **`partie-08`** → Journal de quêtes *(branche figée)*
- **`partie-07`** → PNJ avec intelligence artificielle *(branche figée)*
- **`partie-06`** → Animation TWEEN *(branche figée)*
- **`partie-05`** → Un PNJ dans ton jeu *(branche figée)*

Chaque branche représente l'état final du code à la fin de l'épisode correspondant.

---

##  Télécharger une partie spécifique

### Option 1 : Télécharger le ZIP via GitHub

1. Va sur **[ce repository](https://github.com/Lysdora/zelda-like-godot-tutorial)**
2. Clique sur le menu déroulant **"main"** (en haut à gauche)
3. Choisis la branche que tu veux (ex: `partie-12`)
4. Clique sur le bouton vert **"Code"** → **"Download ZIP"**
5. Décompresse le ZIP
6. Ouvre le projet dans Godot Engine

### Option 2 : Cloner avec Git

```bash
# Clone la branche de la partie 12
git clone -b partie-12 https://github.com/Lysdora/zelda-like-godot-tutorial.git

# Ou clone la partie 11
git clone -b partie-11 https://github.com/Lysdora/zelda-like-godot-tutorial.git
```

---

## 📚 Liste des parties

| Partie | Titre | Lien vidéo | Branche |
|--------|-------|------------|---------|
| 5️⃣ | **Un PNJ dans ton jeu** | [▶️ Voir la vidéo](https://www.youtube.com/watch?v=nlPhfjMJohw) | [`partie-05`](../../tree/partie-05) |
| 6️⃣ | **Animation TWEEN** | [▶️ Voir la vidéo](https://www.youtube.com/watch?v=eHGu-qMhC4c) | [`partie-06`](../../tree/partie-06) |
| 7️⃣ | **PNJ avec IA** | [▶️ Voir la vidéo](https://www.youtube.com/watch?v=CXW521WiT9k) | [`partie-07`](../../tree/partie-07) |
| 8️⃣ | **Journal de quêtes** | [▶️ Voir la vidéo](https://youtu.be/X2KOwVpLjYA) | [`partie-08`](../../tree/partie-08) |
| 9️⃣ | **Des cailloux magiques ! (Custom Resources)** | [▶️ Voir la vidéo](https://www.youtube.com/watch?v=onTXq2PL4MI) | [`partie-09`](../../tree/partie-09) |
| 🔟 | **Miner en 2D ! Clic souris & animations** | [▶️ Voir la vidéo](https://youtu.be/s92vdEEWpB8) | [`partie-10`](../../tree/partie-10) |
| 1️⃣1️⃣ | **Looter le minerai !** | [▶️ Voir la vidéo](https://youtu.be/bRgYff9D2Zw) | [`partie-11`](../../tree/partie-11) |
| 1️⃣2️⃣ | **Auto-tile et nouvelle map** | [▶️ Voir la vidéo](https://youtu.be/Nauj_m97vq0)  | [`partie-12`](../../tree/partie-12) |

---

## 🆕 Partie 12 — Auto-tile et nouvelle map 🗺️

Dans cette partie, on apprend à utiliser le système de **Terrains (auto-tiling)** de Godot 4 pour créer une toute nouvelle scène : la **Caverne** ! On agrandit le monde du jeu avec une map bien plus grande et plus travaillée.

### 🎓 Ce que tu apprends

- Comprendre le système de **Terrains** dans les TileSets de Godot 4
- Configurer un **Terrain Set** et ses **Terrains** (peering bits)
- Utiliser l'outil **Terrains** pour peindre automatiquement les bonnes tuiles
- Organiser une map avec **plusieurs TileMapLayers** (Ground, GroundDecor, Chemin, Plaine, Objects)
- Créer une **nouvelle scène** (Caverne) avec son propre tileset
- Placer des **objets décoratifs** avec collisions via TileMap
- Utiliser le **Y-Sorting** pour le bon ordre d'affichage des éléments
- Configurer une **caméra indépendante** qui suit le joueur dans la nouvelle map

### 📁 Nouveaux fichiers et modifications

```
Tiles/
├── ground_caverne.tres          # 🆕 TileSet sol de la caverne (avec terrain auto-tile)
├── plaine_caverne.tres          # 🆕 TileSet plaine/murs caverne (avec terrain + collisions)
assets/tilesets/caverne-donjon/
├── tiles.png                    # 🆕 Tileset principal caverne
├── objects.png                  # 🆕 Objets décoratifs (stalagmites, cristaux...)
├── objets/                      # 🆕 Rails, échelles, pièges, lampes...
├── objets_animé/                # 🆕 Torches, coffres, portes, entrées (pour les prochaines parties !)
scenes/
├── caverne.tscn                 # 🆕 Scène complète de la caverne
scripts/
├── camera_2d.gd                 # ✏️ Caméra qui suit le joueur (réutilisée)
```

### 🔑 Concepts clés — Terrains (Auto-tile)

Le système de Terrains dans Godot 4 permet de peindre des tuiles et le moteur choisit automatiquement la bonne variante (coin, bord, centre...) selon les tuiles voisines. Plus besoin de placer chaque tuile à la main !

**Comment ça marche :**
1. Dans le TileSet, on crée un **Terrain Set** (ex: mode "Match Corners and Sides")
2. On crée un **Terrain** dans ce set (ex: "chemin", "mur"...)
3. On assigne les **peering bits** à chaque tuile (quels côtés/coins correspondent)
4. On peint avec l'outil Terrains dans l'éditeur TileMap

### 🗺️ Structure de la scène Caverne

```
Caverne (Node2D)
├── Maps (Node2D)
│   ├── Ground (TileMapLayer)        → Sol de base
│   ├── GroundDecor (TileMapLayer)   → Décorations au sol
│   ├── Chemin (TileMapLayer)        → Chemins avec auto-tile
│   ├── Plaine (TileMapLayer)        → Murs et zones avec collisions
│   └── Plaine2 (TileMapLayer)       → Couche supplémentaire
├── Camera2D                          → Suit le joueur
└── YSorting (Node2D, y_sort)
    ├── Objects (TileMapLayer)        → Objets décoratifs (stalagmites, cristaux)
    └── Player                        → Le joueur
```

---

## 1️⃣1️⃣ Partie 11 — Looter le minerai ! ⛏️💎

Dans cette partie, on finalise le système de minage en faisant apparaître un **loot de minerai** quand la roche est détruite, avec des effets visuels et sonores !

### 🎓 Ce que tu apprends

- Créer une **Custom Resource `MineraiData`** (nom, texture, valeur)
- Lier les données de minerai à la roche via **`RocheData`**
- Implémenter `recevoir_degats()` pour que la roche prenne des **dégâts progressifs**
- Créer les effets visuels **flash** et **tremblement** avec des Tweens
- Faire **apparaître un loot** (scene `minerai_sol`) quand la roche est détruite
- Créer un effet **pop animé** (scale + fade in + rebond) pour le loot qui apparaît
- Afficher un **label flottant** "+1 Pierre" quand le joueur ramasse un minerai
- Ramasser automatiquement le minerai au **contact du joueur** (Area2D)

### 📁 Nouveaux fichiers et modifications

```
scripts/
├── minerai_data.gd         # 🆕 Custom Resource MineraiData (nom, texture, valeur)
├── minerai_sol.gd          # 🆕 Script du minerai au sol (loot, effets visuels, ramassage)
├── roche_data.gd           # ✏️ Ajout du champ minerai_data: MineraiData
├── roche.gd                # ✏️ Ajout recevoir_degats(), detruire(), flash(), trembler()
└── player.gd               # ✏️ Appel roche_proche.recevoir_degats() au clic
scenes/
└── minerai_sol.tscn        # 🆕 Scene du minerai posé au sol
```

### 🔑 Code clé — roche.gd

```gdscript
func recevoir_degats():
    vie -= 1
    son_minage.play()
    flash()
    trembler()
    if vie <= 0:
        detruire()

func detruire():
    sprite_2d.visible = false
    $CollisionShape2D.set_deferred("disabled", true)
    son_destruction.play()
    await son_destruction.finished
    var loot = minerai_sol_scene.instantiate()
    loot.minerai_data = data.minerai_data
    get_parent().add_child(loot)
    loot.global_position = global_position
    loot.effet_pop()
    queue_free()
```

### 🔑 Code clé — minerai_sol.gd

```gdscript
func _on_body_entered(body: Node2D) -> void:
    if body.is_in_group("Player"):
        son_ramassage.play()
        effet_label()
        await get_tree().create_timer(1.0).timeout
        queue_free()

func effet_label():
    label_ramassage.visible = true
    var tween = create_tween()
    tween.set_parallel(true)
    tween.tween_property(label_ramassage, "position:y", pos_depart.y - 30, 1.5)
    tween.tween_property(label_ramassage, "modulate:a", 0.0, 1.5)
```

### 💡 Exercices suggérés

1. 💎 Ajoute un **compteur de minerais** dans l'UI (ex: "Pierre : 3")
2. 🎨 Crée un **3ème type de minerai** avec sa propre texture et valeur
3. ⏱️ Fais en sorte que le minerai au sol **disparaisse tout seul** après 10 secondes si non ramassé

---

## 🔟 Partie 10 — Miner en 2D ! ⛏️

Dans cette partie, on met en place tout le système de détection et d'animation pour le minage !

### 🎓 Ce que tu apprends

- Créer une **zone de détection Area2D** (ZoneMinage) autour des roches
- Le concept de **self et null** pour la communication entre scripts
- Détecter le **clic souris** avec `_unhandled_input` et `InputEventMouseButton`
- Créer des **animations de minage** dans 4 directions (miner_down, miner_up, miner_left, miner_right)
- Le pattern **booléen est_en_train_de_miner** pour protéger le gameplay
- Connecter le signal **animation_finished** pour déverrouiller le joueur

### 📁 Nouveaux fichiers et modifications

```
audio/
├── sfx/                                    # 🆕 Dossier effets sonores
│   ├── son_minage.wav
│   └── son_destruction.wav
assets/player/
└── Char Mining.png                         # 🆕 Spritesheet animation minage
scenes/
└── roche.tscn                              # ✏️ Ajout ZoneMinage (Area2D) + SonMinage + SonDestruction
scripts/
├── player.gd                               # ✏️ Ajout roche_proche, est_en_train_de_miner, _unhandled_input
└── roche.gd                                # ✏️ Ajout signaux body_entered/exited avec self/null
```

###  Code clé — player.gd

```gdscript
var roche_proche = null
var est_en_train_de_miner: bool = false

func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            if roche_proche != null and not est_en_train_de_miner:
                est_en_train_de_miner = true
                animated_sprite_2d.play("miner_" + last_direction)
```

###  Code clé — roche.gd

```gdscript
func _on_zone_minage_body_entered(body: Node2D) -> void:
    if body.is_in_group("Player"):
        body.roche_proche = self

func _on_zone_minage_body_exited(body: Node2D) -> void:
    if body.is_in_group("Player"):
        body.roche_proche = null
```

---

## 🛠️ Prérequis

- [Godot Engine 4.4+](https://godotengine.org/download) (gratuit et open-source)
- Aucune expérience en programmation requise !
- De la bonne humeur 😄

---

## 📐 Paramètres du projet

| Paramètre | Valeur |
|-----------|--------|
| Viewport | 320×180 |
| Window override | 1920×1080 |
| Scale | 0.5 |
| Stretch mode | canvas_items |
| Texture filter | Nearest |

---

## 🐛 Problèmes courants

| Problème | Solution |
|----------|----------|
| Le joueur mine dans le vide | Vérifie que le Player est dans le **groupe "Player"** |
| L'animation de minage boucle | Décoche la **boucle** sur les animations miner_ dans SpriteFrames |
| Le joueur reste bloqué après le minage | Connecte le signal **animation_finished** au Player |
| La roche n'affiche pas de texture | Vérifie que tu as bien assigné un fichier `.tres` dans l'inspecteur |
| Le loot n'apparaît pas | Vérifie que `minerai_sol_scene` est bien assigné dans l'inspecteur de la roche |
| Le minerai ne se ramasse pas | Vérifie que le Player est dans le **groupe "Player"** et que le `body_entered` est connecté |
| Le journal ne s'affiche pas | Vérifie que `ui.tscn` est bien ajouté dans `foret.tscn` |
| L'auto-tile ne fonctionne pas | Vérifie que les **peering bits** sont bien configurés dans le TileSet |
| Les collisions ne marchent pas dans la caverne | Vérifie que le **physics_layer** est bien activé sur le TileSet |

---

##  Licence

Ce projet est sous licence **MIT** — tu es libre de l'utiliser pour apprendre et créer tes propres jeux !

---

##  Soutenir Lysdora Craft

- 🔔 **Abonne-toi** à la chaîne [Lysdora Craft](https://www.youtube.com/@LysdoraCraft)
- 👍 **Like** les vidéos si elles t'aident
- 💬 **Commente** pour partager tes créations et poser tes questions
- ⭐ **Star** ce repository si tu le trouves utile !

---

## 🔗 Liens utiles

- 📺 [Chaîne YouTube - Lysdora Craft](https://www.youtube.com/@LysdoraCraft)
- 📖 [Documentation Godot 4](https://docs.godotengine.org/)
- 🎮 [Godot Engine](https://godotengine.org/)
- 🎨 [Assets gratuits (Google Drive)](https://drive.google.com/drive/folders/1Tq4qj0n_0uN4Ocb5AJBlN8x-dYRIiSls?usp=drive_link)
- 📺 [Playlist complète](https://www.youtube.com/playlist?list=PL3AqG2_dc5U8DLDkmZCg_5xHlJmUqKds4)

---

**Créé avec ❤️ par Lysdora | Propulsé par Godot Engine 🎮**
