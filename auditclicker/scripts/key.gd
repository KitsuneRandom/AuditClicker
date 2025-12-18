extends TextureButton
## Script de l'objet cliquable "clé".
##
## Objet cliquable permettant de mettre pause et d'accéder au menu options

## Variable représentant l'écran principal du jeu.
var main

## Tooltip qui apparaît lorsque la souris passe sur la clé.
var tooltip

## Fonction appelée à la création du noeud.
##
## Initialise la variable main.
func _ready() -> void:
	main = get_parent().get_parent()

## Fonction appelée lorsque le joueur clique sur la clé.
##
## Déplace légèrement la clé pour créer un effet de click
## puis disparaît et ajoute la scène settings.tscn au main.
func _on_pressed() -> void:
	print("Key click !")
	position.y += 10
	await get_tree().create_timer(0.1).timeout
	position.y -= 10
	main.add_child(preload("res://scenes/submenus/settings.tscn").instantiate())


## Fonction appelée lorsque le joueur passe la souris sur la clé
##
## Change la couleur et affiche la tooltip. Permet au joueur de
## comprendre qu'il s'agit d'un élément cliquable.
func _on_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Options"
	print("Affichage de la tooltip etape clef")
	main.add_child(tooltip)

## Fonction appelée lorsque la souris quitte la clé
##
## Remet la couleur à la couleur d'origine et supprime la tooltip.
func _on_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		get_viewport().gui_release_focus()
		tooltip.queue_free.call_deferred()
		tooltip = null
