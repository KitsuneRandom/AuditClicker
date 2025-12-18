# Wiki - AuditClicker

---

## Table des matières
1. Objectifs pédagogiques
2. Description du jeu
3. Actions du joueur
4. Informations renvoyées au joueur

---

## Objectifs pédagogiques

### Objectif principal
Ce projet a été réalisé dans le cadre de nos études (BUT Informatique).  
Il s'agit d'un serious game visant à transmettre de nouvelles connaissances au joueur concernant le concept d'audit et la gestion administrative.

### Sous-objectifs

#### 1. Découverte du concept d'audit
- Nous voulons faire découvrir au joueur ce qu'est un audit en entreprise, en lui apprenant les principes de base de l'audit.
- Cela est mis en œuvre dans le jeu en faisant incarner au joueur un auditeur qui doit réaliser des audits en suivant toutes les étapes du processus de création.

#### 2. Compréhension des étapes d'un audit
- Par l'intermédiaire du jeu, le joueur se familiarise avec les différentes phases d'un audit en entreprise.
- Elles se résument en 5 étapes : préparation, investigation, analyse, restitution et suivi.
- Chaque étape correspond à un élément cliquable sur l'interface du jeu, le joueur doit les réaliser dans le bon ordre.

#### 3. Faire comprendre l'impact de ses choix
- Réaliser des audits et optimiser ses compétences permet de faire comprendre au joueur l'importance des décisions prises sur la réalisation des différentes phases du jeu.
- Concrètement, un système d'améliorations permet au joueur d'investir ses crédits pour optimiser ses performances.

#### 4. Apprentissage par la pratique
- Notre approche cherche à permettre au joueur d'apprendre par la répétition, en l'encourageant à rejouer.
- Cela favorise la mémorisation du processus de création d'un audit.
- Le format clicker est parfaitement adapté car il encourage la répétition des actions. De plus, le temps de jeu relativement limité stimule le joueur en lui donnant envie de rejouer plusieurs fois en cherchant à optimiser ses choix en amélioration de compétences et à améliorer son score.

---

## Description du jeu

### Type de jeu
AuditClicker est un **clicker**, qui utilise les mécaniques classiques des jeux de type clicker tout en ayant en parallèle un objectif pédagogique (voir la section **Objectifs pédagogiques**).

### Vue d'ensemble
Le joueur incarne un auditeur qui travaille dans son bureau et réalise des audits.  
L'interface représente son espace de travail, avec plusieurs éléments interactifs correspondant aux étapes d'un audit.  
Le joueur doit cliquer sur ces éléments pour progresser dans la réalisation des audits, ce qui lui fait accumuler des points et des crédits, qu'il peut ensuite dépenser dans des améliorations pour devenir plus efficace.  

Le jeu se déroule sur une session de 5 minutes, durant laquelle le joueur doit réaliser un maximum d'audits pour obtenir le meilleur score possible.

### Mécaniques principales
Le jeu repose sur un système de clics où le joueur doit trouver et cliquer sur les bons éléments de l'interface pour avancer dans les différentes phases d'un audit, qui possèdent chacune leurs spécificités.  
Chaque phase complétée rapporte des crédits et augmente le score. Les crédits peuvent être dépensés dans un menu d'améliorations pour réduire le temps nécessaire à la réalisation de certaines phases, ce qui permet d'effectuer davantage d'audits durant le temps de jeu.

### Environnement
Le jeu se déroule dans un bureau d'auditeur, représenté par une interface 2D affichant un bureau en guise d'espace de travail avec différents objets et éléments cliquables.

### Objectif du jeu
D'un point de vue gameplay uniquement, l'objectif est de marquer le plus de points possible en effectuant un maximum d'audits durant les 5 minutes de jeu. D'un point de vue pédagogique, l'objectif est de comprendre les concepts d'audit et de gestion administrative.

---

## Actions du joueur

### Contrôles de base

#### Clic souris
- Clic avec la souris (ou tap sur écran pour Android).
- C'est de cette manière que se font la majorité des interactions du jeu.

#### Autres interactions
- Le jeu ne demande l'utilisation que de la souris mais exceptionnellement, le joueur, en plus de cliquer, peut être amené à faire des drag-and-drop.

### Interactions possibles

#### Réalisation des étapes d'audit
Le joueur doit cliquer sur les éléments de l'interface correspondant aux 5 étapes d'un audit :

1. **Préparation** : Cliquer sur le papier puis lancer la rédaction en cliquant sur les boutons s'affichant à tour de rôle.
2. **Investigation** : Cliquer sur la lettre puis sortir le papier pour récupérer les informations et passer à l'analyse.
3. **Analyse** : Cliquer sur la loupe pour chercher les indices.
4. **Restitution** : Cliquer sur le stylo qui permet de rédiger le rapport de l'audit.
5. **Suivi** : Cliquer sur les lettres, représentant les retours sur l'audit effectué pour prendre en compte les derniers éléments.

Le joueur doit identifier le bon élément à cliquer grâce à des indices visuels présents sur l'interface, comme l'apparition de certains objets ou encore un petit texte en bas de l'écran.

#### Accès au menu d'améliorations et achat d'améliorations
- Le joueur y accède en cliquant sur le dossier d'améliorations.
- Une nouvelle interface apparait permettant de dépenser les crédits accumulés pour améliorer les compétences de l'auditeur.
- Les améliorations réduisent la durée nécessaire à la réalisation des différentes phases.

#### Easter eggs
Le jeu contient deux easter eggs :

- **Le Chat** : Cliquer sur le chat le fait danser et chanter "OIIA".

- **La Voiture** : Cliquer sur la petite voiture déclenche la réplique "Salut c'est Frank Leboeuf, vous voulez savoir combien vaut votre voiture ?" (note : il est réellement possible de vendre la voiture en échange de crédits).

---

## Informations renvoyées au joueur

### Interface utilisateur

#### Score, crédits et temps restant
- Ces informations sont affichées en permanence sur l'écran principal.
- Ce sont les indicateurs principaux du jeu, c'est pour cette raison qu'ils sont présents en continu.

### Retours visuels

#### Indices visuels pour les phases
Le jeu affiche des indices visuels sur l'interface pour aider le joueur à identifier quel élément cliquer pour progresser dans l'audit.  Ces indices peuvent être de nouveau objets ou des textes qui guident le joueur vers l'action à effectuer.

#### Menu d'améliorations
L'interface d'améliorations affiche les options disponibles, avec leur coût en crédits et leur effet sur le gameplay.

#### Écrans tutoriels
Au démarrage, plusieurs écrans de tutoriel expliquent le concept et le fonctionnement du jeu, afin d'assurer au joueur une bonne compréhension du jeu et de ses mécaniques avant de commencer.

### Messages

#### Écran de démarrage
- Il affiche le nom du jeu (AuditClicker) et un bouton pour démarrer.

#### Écrans tutoriels
- Cette série d'écrans explique le concept d'audit, les objectifs pédagogiques et les mécaniques de jeu.
- Ils préparent le joueur avant le début de la partie.

#### Écran de fin de partie
- Le dernier élément auquel fait face le joueur. Il s'affiche automatiquement lorsque le compte à rebours atteint 0 (après 5 minutes de jeu).
- Il affiche le score final du joueur, calculé en fonction du nombre d'audits réalisés.

### Feedback pédagogique

#### Progression dans l'audit et dans le jeu
À chaque étape complétée, le joueur reçoit des crédits et voit son score augmenter. Le joueur comprend alors qu'il effectue les bonnes actions.

#### Système de récompenses et d'améliorations
Le système de crédits et d'améliorations simule les choix en gestion administrative. Le joueur apprend grâce à cette mécanique de jeu que l'investissement dans les compétences améliore l'efficacité globale.

#### Apprentissage par répétition
Le format clicker encourage le joueur à répéter les mêmes actions de nombreuses fois durant les 5 minutes de jeu et à rejouer pour améliorer son score, afin de favoriser la mémorisation des 5 étapes d'un audit et leur enchaînement.

---

## Technologies utilisées

Le jeu est développé avec **Godot Engine** et est disponible sur plusieurs plateformes :
- Windows (via .exe)
- Linux (via .x86_64)
- Android (via .apk)

---

Pour plus d'informations sur l'installation et l'utilisation, consultez le [README du projet](README.md).