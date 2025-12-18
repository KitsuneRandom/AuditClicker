extends Node2D
## Scène permettant d'afficher un menu de fin

## Variable représentant la scène principale
var main

## Fonction appelée lors de l'instanciation de la scène
##
## instancie la variable main et l'affichage du score
func _ready() -> void:
	main = get_parent()
	self_modulate = Color(0,0,0,0.5)
	print(get_parent())
	$Control/ResultsValue.text = str(get_node("/root/TheGame")._getpapers()) + " points\n" + str(get_node("/root/TheGame")._getNbAudits()) + " audits terminés\n"

## Fonction appelée pour afficher une erreur durant de la partie
##
## Modifie le texte pour afficher la scène avec un message d'erreur
func _changeText(text: String) -> void:
	$Control/ResultsTitle.text = text
	if text == "Erreur lors de l'ouverture du fichier contenant les instructions de jeu.\nFin de la partie":
		$Control/ResultsTitle.position = Vector2(-83, $Control/ResultsTitle.position.y)
	$Control/ResultsValue.text = ""

## Bouton quitter (fermer l'application)
func _on_quit_button_pressed() -> void:
	print("Sortie du jeu")
	get_viewport().gui_release_focus()
	main.get_tree().quit()
