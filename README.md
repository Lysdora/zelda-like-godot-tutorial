# 🗒️ Zelda-like Godot Tutorial - Complete Series

> Série de tutoriels complets pour créer un RPG Zelda-like pixel art avec Godot 4 par **Lysdora Craft**

![Godot 4.5](https://img.shields.io/badge/Godot-4.5+-blue?logo=godotengine)
![License MIT](https://img.shields.io/badge/license-MIT-green)
![YouTube](https://img.shields.io/badge/YouTube-Lysdora%20Craft-red?logo=youtube)

---

## 📺 Chaîne YouTube

🎬 **[Lysdora Craft - Tutoriels Godot](https://www.youtube.com/@LysdoraCraft)**

Apprends à créer ton propre jeu d'aventure RPG façon Zelda, étape par étape, avec des explications claires et bienveillantes ! 🎮💖

---

## 🎯 À propos de cette série

Cette série de tutoriels YouTube te guide dans la création d'un RPG pixel art complet avec Godot Engine. Tu apprendras à créer un jeu avec :
- Un personnage jouable avec animations
- Des PNJ (Personnages Non-Joueurs) avec IA
- Un système de quêtes complet
- Une carte avec tilemap et collisions
- Et bien plus encore ! ⚔️

---

## 🗂️ Comment utiliser ce repository ?

### 📦 Structure du projet

Ce repository contient **plusieurs parties** du tutoriel, organisées en **branches** :

- **`main`** → Code de la **partie la plus récente** (actuellement partie 8)
- **`partie-08`** → Journal de quêtes *(branche figée)*
- **`partie-07`** → PNJ avec intelligence artificielle *(branche figée)*
- **`partie-06`** → *(branche figée)*
- **`partie-05`** → *(branche figée)*

Chaque branche représente l'état final du code à la fin de l'épisode correspondant.

---

## 🚀 Télécharger une partie spécifique

### Option 1 : Télécharger le ZIP via GitHub

1. Va sur **[ce repository](https://github.com/Lysdora/zelda-like-godot-tutorial)**
2. Clique sur le menu déroulant **"main"** (en haut à gauche)
3. Choisis la branche que tu veux (ex: `partie-08`)
4. Clique sur le bouton vert **"Code"** → **"Download ZIP"**
5. Décompresse le ZIP
6. Ouvre le projet dans Godot Engine

### Option 2 : Cloner avec Git
```bash
# Clone la branche de la partie 8
git clone -b partie-08 https://github.com/Lysdora/zelda-like-godot-tutorial.git

# Ou clone la partie 7
git clone -b partie-07 https://github.com/Lysdora/zelda-like-godot-tutorial.git
```

## 📚 Liste des parties

| Partie | Titre | Lien vidéo | Branche |
|--------|-------|------------|---------|
| 5️⃣ | **Un PNJ dans ton jeu** | [▶️ Voir la vidéo](https://www.youtube.com/watch?v=nlPhfjMJohw) | [`partie-05`](../../tree/partie-05) |
| 6️⃣ | **Animation TWEEN** | [▶️ Voir la vidéo](https://www.youtube.com/watch?v=eHGu-qMhC4c) | [`partie-06`](../../tree/partie-06) |
| 7️⃣ | **PNJ avec IA** | [▶️ Voir la vidéo](https://www.youtube.com/watch?v=CXW521WiT9k) | [`partie-07`](../../tree/partie-07) |
| 8️⃣ | **Journal de quêtes** | [▶️ Voir la vidéo](#) | [`partie-08`](../../tree/partie-08) |

> 💡 **Note :** Le lien de la partie 8 sera ajouté une fois la vidéo publiée sur YouTube !

## 🎮 Partie 8 : Journal de quêtes (VERSION ACTUELLE)

### ✨ Ce que tu vas apprendre

Dans cette partie, tu vas créer un **système complet de journal de quêtes** avec :

#### 🗒️ **Interface de journal**
- Une liste cliquable de quêtes avec icônes
- Un panneau de détails pour chaque quête
- Navigation entre liste et détails
- Interface pixel art stylée

#### 🔧 **GestionnaireQuete (Autoload)**
- Un script global pour gérer les quêtes
- Système de signaux pour communiquer les changements
- Fonctions pour démarrer, suivre et terminer les quêtes
- Compteur de progression (ex: 3/5 poulets ramassés)

#### 🐔 **Interaction avec les poulets**
- Les poulets ne peuvent être ramassés QUE si la quête est active
- Message si tu essaies de ramasser avant de parler à Bilbo
- Icône "E" qui apparaît au survol
- Système de collecte avec feedback visuel

#### 🎨 **UI avancée**
- Utilisation d'`ItemList` pour afficher les quêtes
- `RichTextLabel` pour les descriptions
- `TextureRect` pour les icônes
- Boutons avec états hover/normal
- Thèmes personnalisés avec NinePatch

### 🎯 Concepts clés

**Autoload (Singleton) :**
```gdscript
# GestionnaireQuete.gd est accessible partout via :
GestionnaireQuete.demarrer_quete(5)
GestionnaireQuete.collecter_poulet()
```

**Signaux globaux :**
```gdscript
signal quete_changee
# Émis quand une quête change → l'UI se met à jour automatiquement
```

**ItemList avec données :**
```gdscript
var quetes = [
    {
        "titre": "Les Poulets de Bilbo",
        "description": "Bilbo a perdu ses poulets...",
        "icone": preload("res://ui/assets/icone_quete_poulet.png")
    }
]
```

---

## 🛠️ Installation

### Prérequis
- **Godot Engine 4.4+** ([Télécharger ici](https://godotengine.org/))
- Connaissances de base en GDScript (ou suis les tutos depuis le début !)

### Étapes

1. **Télécharge ou clone** une branche spécifique (voir plus haut)
2. **Ouvre Godot Engine**
3. Clique sur **"Importer"**
4. Sélectionne le fichier **`project.godot`**
5. Clique sur **"Importer et éditer"**
6. Appuie sur **`F5`** ou clique sur Play ▶️

---

## 📂 Structure du projet (Partie 8)
```
📦 zelda-like-godot-tutorial/
├── 📁 assets/              # Sprites et ressources visuelles
│   ├── 🐔 Poulet.png
│   ├── 🪶 Plume.png
│   ├── 🧙 Bilbo_idle.png
│   └── ...
├── 📁 fonts/               # Polices pixel art
│   ├── Minecraftia-Regular.ttf
│   └── monogram-extended.ttf
├── 📁 scenes/              # Scènes Godot
│   ├── foret.tscn          # Scène principale
│   ├── player.tscn         # Personnage joueur
│   ├── poulet.tscn         # Poulet interactif
│   └── bilbo.tscn          # PNJ Bilbo
├── 📁 scripts/             # Scripts GDScript
│   ├── ⭐ GestionnaireQuete.gd  # AUTOLOAD - Gestion des quêtes
│   ├── player.gd
│   ├── poulet.gd
│   └── bilbo.gd
├── 📁 ui/                  # Interface utilisateur
│   ├── 📁 assets/          # Assets UI (icônes, boutons)
│   ├── 📁 scenes/
│   │   └── ui.tscn         # Interface complète
│   ├── 📁 scripts/
│   │   └── ⭐ journal_de_quete.gd  # Logique du journal
│   └── 📁 themes/          # Thèmes visuels
└── 📄 project.godot        # Configuration Godot
```

---

## 🐛 Problèmes courants

| Problème | Solution |
|----------|----------|
| Le journal ne s'affiche pas | Vérifie que `ui.tscn` est bien ajouté dans la scène `foret.tscn` |
| Les poulets se ramassent sans la quête | Vérifie que tu appelles bien `GestionnaireQuete.quete_active` |
| L'icône "E" ne s'affiche pas | Vérifie que `icone_interaction.visible = true` est bien dans le script |
| Erreur "Invalid call" | Assure-toi que `GestionnaireQuete.gd` est bien dans les AutoLoad |
| La police ne s'affiche pas | Vérifie que la police Minecraftia est bien importée |

---

## 💡 Pour aller plus loin

**Exercices suggérés :**
- Ajoute d'autres quêtes dans le tableau `quetes`
- Crée un système de quêtes terminées vs actives
- Ajoute un son quand on ouvre/ferme le journal
- Crée un badge "!" sur l'icône du journal quand une quête est terminée
- Sauvegarde la progression des quêtes

---

## 🌟 Fonctionnalités de la série complète

### ✅ Déjà implémentées
- [x] Déplacement du personnage (8 directions)
- [x] Système d'animations complètes
- [x] Collisions et tilemaps
- [x] PNJ avec IA autonome (poulets)
- [x] Système de collecte d'objets
- [x] Zone d'interaction avec icône
- [x] Gestionnaire de quêtes (Autoload)
- [x] Interface de journal de quêtes

### 🚧 À venir
- [ ] Dialogues avec PNJ
- [ ] Système d'inventaire
- [ ] Combat
- [ ] Sauvegarde/Chargement

---

## 📜 Licence

Ce projet est sous licence **MIT** - tu es libre de l'utiliser pour apprendre et créer tes propres jeux !

---

## 💖 Remerciements

Merci de suivre cette série ! Si ce projet t'aide :
- ⭐ **Star** ce repository
- 👍 **Like** les vidéos YouTube
- 🔔 **Abonne-toi** à [Lysdora Craft](https://www.youtube.com/@LysdoraCraft)
- 💬 **Partage** tes créations dans les commentaires !

---

## 🔗 Liens utiles

- 📺 [Chaîne YouTube - Lysdora Craft](https://www.youtube.com/@LysdoraCraft)
- 📖 [Documentation Godot 4](https://docs.godotengine.org/)
- 🎮 [Godot Engine](https://godotengine.org/)
- 🐔 [Partie 7 - PNJ avec IA](https://www.youtube.com/watch?v=CXW521WiT9k)

---

**Créé avec ❤️ par Lysdora | Propulsé par Godot Engine 🎮**

---

## 🎓 Apprends en t'amusant !

N'oublie pas : la programmation de jeux vidéo, c'est avant tout **du plaisir** ! Prends ton temps, expérimente, et surtout, **amuse-toi** ! 🚀✨
