extends TextureButton
## Script de l'objet cliquable "voiture".
##
## La voiture sert principalement de décoration. [br]
## Lorsqu'on clique dessus, un son est joué.
##
## Note : un TextureButton aurait été plus approprié pour répondre
## au besoin mais nous avons eu un mauvais choix de conception au
## début du projet.

## Tooltip qui apparaît lorsque la souris passe sur la voiture.
var tooltip

## Variable représentant l'écran principal du jeu.
var main

## Fonction appelée à la création du noeud.
##
## Initialise la variable main.
func _ready() -> void:
	main = get_parent().get_parent()

## Fonction appelée lorsque le joueur clique sur la voiture.
##
## Joue le son CarSound puis déplace légèrement la voiture pour créer
## un effet de click
##
## @param viewport Node : noeud concerné par l'évenement
## @param event InputEvent : type d'évenement
## @param shape_idx int : index du CollisionShape concerné
func _on_pressed() -> void:
	print("Car click !")
	$"../CarSound".play()
	position.y += 10
	await get_tree().create_timer(0.1).timeout
	position.y -= 10
	main.credits += 10
	main.get_node("car").hide()



## Fonction appelée lorsque le joueur passe la souris sur la voiture
##
## Change la couleur et affiche la tooltip. Permet au joueur de
## comprendre qu'il s'agit d'un élément cliquable.
func _on_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "vendezvotrevoiture.fr"
	print("Affichage de la tooltip etape Frank Leboeuf")
	main.add_child(tooltip)

## Fonction appelée lorsque la souris quitte la voiture
##
## Remet la couleur à la couleur d'origine et supprime la tooltip.
func _on_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
