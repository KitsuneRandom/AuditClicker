extends Node2D
## Menu permettant d'afficher les conditions d'utilisation du jeu
##
## Affiche le texte écrit dans un fichier legal_Informations.txt

## Texte à afficher
var text

## Fonction appelée lors de l'instanciation du noeud
##
## Initialise les variables et affiche le texte de legal_Informations.txt
func _ready() -> void:
	get_parent().visible = false
	var path = "res://datas/texts/legal_Informations.txt"
	var file = FileAccess.open(path, FileAccess.READ)
	text = ""
	if file:
		text = file.get_as_text()
		file.close()
		$Space/ScrollContainer/Content.text = (text.split("#"))[1]
	else:
		push_error("Erreur pendant l'ouverture du fichier")
		var endScreen = preload("res://scenes/game_menus/end_menu.tscn").instantiate()
		endScreen._changeText("Erreur lors de l'ouverture du fichier contenant les instructions de jeu.\nFin de la partie")
		get_parent().add_child(endScreen)
		get_viewport().gui_release_focus()
		queue_free.call_deferred()

## Retour au menu settings
func _on_next_button_pressed() -> void:
	get_parent().visible = true
	get_viewport().gui_release_focus()
	queue_free.call_deferred()

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_next_button_mouse_entered() -> void:
	$Space/NextButton.self_modulate = Color(0.8, 0.8, 0.8)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_next_button_mouse_exited() -> void:
	$Space/NextButton.self_modulate = Color(0, 0, 0)
