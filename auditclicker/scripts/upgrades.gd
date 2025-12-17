extends TextureButton
## Script de l'objet cliquable "améliorations".
##
## Permet d'ouvrir le menu améliorations.
##
## Note : un TextureButton aurait été plus approprié pour répondre
## au besoin mais nous avons eu un mauvais choix de conception au
## début du projet.

## Variable représentant l'écran principal du jeu.
var main

## Tooltip qui apparaît lorsque la souris passe sur les améliorations.
var tooltip

## Fonction appelée à la création du noeud.
##
## Initialise la variable main.
func _ready() -> void:
	main = get_parent().get_parent()

## Fonction appelée lorsque le joueur clique sur les améliorations.
##
## Déplace légèrement les améliorations pour créer un effet de click
## puis ajoute la scène upgrades_menu.tscn au main.
##
## @param viewport Node : noeud concerné par l'évenement
## @param event InputEvent : type d'évenement
## @param shape_idx int : index du CollisionShape concerné
func _on_pressed() -> void:
	print("Upgrades click !")
	position.y += 10
	await get_tree().create_timer(0.1).timeout
	position.y -= 10
	main.add_child(preload("res://scenes/submenus/upgrades_menu.tscn").instantiate())



## Fonction appelée lorsque le joueur passe la souris sur les améliorations
##
## Change la couleur et affiche la tooltip. Permet au joueur de
## comprendre qu'il s'agit d'un élément cliquable.
func _on_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Ameliorations"
	print("Affichage de la tooltip etape ameliorations")
	main.add_child(tooltip)

## Fonction appelée lorsque la souris quitte les améliorations
##
## Remet la couleur à la couleur d'origine et supprime la tooltip.
func _on_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
