extends TextureButton
## Script de l'objet cliquable "papier".
##
## Permet d'exécuter la phase PREPARATION.

## Variable représentant l'écran principal du jeu.
var main

## Tooltip qui apparaît lorsque la souris passe sur le papier.
var tooltip

## Fonction appelée à la création du noeud.
##
## Initialise la variable main.
func _ready() -> void:
	main = get_parent().get_parent()
	pass # Replace with function body.

## Fonction appelée lorsque le joueur clique sur le papier.
##
## Déplace légèrement le papier pour créer un effet de click
## puis ajoute la scène preparation.tscn si c'est la bonne phase,
## fullscreen_paper.tscn sinon.
func _on_pressed() -> void:
	print("Paper click !")
	position.y += 10
	await get_tree().create_timer(0.1).timeout
	position.y -= 10
	if main._verifobject("paper.tscn") == true:
		main.add_child(preload("res://scenes/phases/preparation.tscn").instantiate())
	else :
		main.add_child(preload("res://scenes/submenus/fullscreen_paper.tscn").instantiate())

## Fonction appelée lorsque le joueur passe la souris sur le papier
##
## Change la couleur et affiche la tooltip. Permet au joueur de
## comprendre qu'il s'agit d'un élément cliquable.
func _on_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Papier"
	print("Affichage de la tooltip etape papier")
	main.add_child(tooltip)

## Fonction appelée lorsque la souris quitte le papier
##
## Remet la couleur à la couleur d'origine et supprime la tooltip.
func _on_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		get_viewport().gui_release_focus()
		tooltip.queue_free.call_deferred()
		tooltip = null
