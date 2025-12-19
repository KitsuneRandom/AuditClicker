extends Node2D
## Scène représentant un papier en plein écran 
##
## S'affiche lorssqu'on clique sur le papier à un autre moment que pendant
## la phase préparation.

## Variable représentant la scène principale
var main

## Fonction appelée lors de l'instanciation de la scène
##
## Initialise la variable main
func _ready() -> void:
	main = get_parent().get_parent()

## Fonction appelée lors du click sur le bouton retour
##
## Retour à la scène principale
func _on_opt_button_retour_pressed() -> void:
	get_viewport().gui_release_focus()
	queue_free.call_deferred()

## Modifie la couleur du bouton retour lors du passage de la souris
func _on_opt_button_retour_mouse_entered() -> void:
	$OptButtonRetour.self_modulate = Color(1, 0.5, 0.5)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_retour_mouse_exited() -> void:
	$OptButtonRetour.self_modulate = Color(0.8, 0.8, 0.8)
