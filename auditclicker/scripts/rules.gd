extends AnimatedSprite2D
## Script de l'objet cliquable "règle".
##
## Permet d'ouvrir le menu tutoriel.
##
## Note : un TextureButton aurait été plus approprié pour répondre
## au besoin mais nous avons eu un mauvais choix de conception au
## début du projet.

## Tooltip qui apparaît lorsque la souris passe sur la règle.
var tooltip

## Variable représentant l'écran principal du jeu.
var main

## Fonction appelée à la création du noeud.
##
## Initialise la variable main.
func _ready() -> void:
	main = get_parent().get_parent()

## Fonction appelée lorsque le joueur clique sur la règle.
##
## Déplace légèrement la règle pour créer un effet de click
## puis ajoute la scène tuto_menu.tscn au main.
##
## @param viewport Node : noeud concerné par l'évenement
## @param event InputEvent : type d'évenement
## @param shape_idx int : index du CollisionShape concerné
func _on_rules_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Rules click !")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
		var tutoScreen = preload("res://scenes/game_menus/tuto_menu.tscn").instantiate()
		tutoScreen.tutoState = 1
		tutoScreen.firstTimeShown = 4
		print("Affichage du tuto")
		main.add_child(tutoScreen)


## Fonction appelée lorsque le joueur passe la souris sur la règle
##
## Change la couleur et affiche la tooltip. Permet au joueur de
## comprendre qu'il s'agit d'un élément cliquable.
func _on_rules_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Règles du jeu"
	print("Affichage de la tooltip etape regles")
	main.add_child(tooltip)

## Fonction appelée lorsque la souris quitte la règle
##
## Remet la couleur à la couleur d'origine et supprime la tooltip.
func _on_rules_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
