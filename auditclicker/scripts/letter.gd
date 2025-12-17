extends TextureButton
## Script de l'objet cliquable "lettre".
##
## Apparaît sur l'écran principal lors des phases INVESTIGATION et SUIVI.
## Permet d'exécuter la phase INVESTIGATION ou SUIVI puis disparaît.
##
## Note : un TextureButton aurait été plus approprié pour répondre
## au besoin mais nous avons eu un mauvais choix de conception au
## début du projet.

## Tooltip qui apparaît lorsque la souris passe sur la lettre.
var tooltip

## Variable représentant l'écran principal du jeu.
var main

## Variable permettant de connaître le numéro de la lettre par rapport au main.
## Note : Utile pour savoir de quelle lettre il s'agit, car cette 
## scène est instanciée plusieurs fois dans le main
var number

## Variable permettant d'associer number au nom du noeud dans le main
var letters_map = {}

## Fonction appelée à la création du noeud.
##
## Initialise les variables main et letters_map.
func _ready() -> void:
	main = get_parent().get_parent()
	letters_map = {
		4: main.get_node("letterInvest"),
		5: main.get_node("letterSuivi1"),
		6: main.get_node("letterSuivi2"),
		7: main.get_node("letterSuivi3"),
		8: main.get_node("letterSuivi4"),
		9: main.get_node("letterSuivi5"),
		10: main.get_node("letterSuivi6")
	}


## Fonction permettant d'instancier une valeur à number.
func _setnumber(newnumber) -> void:
	number = newnumber

## Fonction appelée lorsque le joueur clique sur la lettre.
##
## Déplace légèrement la lettre pour créer un effet de click
## puis disparaît et ajoute la scène investigation.tscn 
## ou suivi.tscn au main en fonction de la phase du main.
##
## @param viewport Node : noeud concerné par l'évenement
## @param event InputEvent : type d'évenement
## @param shape_idx int : index du CollisionShape concerné
func _on_pressed() -> void:
	print("Letter click !")
	position.y += 10
	await get_tree().create_timer(0.1).timeout
	position.y -= 10
	letters_map[number].hide()
	if main._verifobject("letter.tscn") == true:
		main.add_child(preload("res://scenes/phases/investigation.tscn").instantiate())
	else :
		if main._verifobject("letter2.tscn") == true:
			main.add_child(preload("res://scenes/phases/suivi.tscn").instantiate())




## Fonction appelée lorsque le joueur passe la souris sur la lettre
##
## Change la couleur et affiche la tooltip. Permet au joueur de
## comprendre qu'il s'agit d'un élément cliquable.
func _on_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Lettre"
	print("Affichage de la tooltip etape lettre")
	main.add_child(tooltip)

## Fonction appelée lorsque la souris quitte la lettre
##
## Remet la couleur à la couleur d'origine et supprime la tooltip.
func _on_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
