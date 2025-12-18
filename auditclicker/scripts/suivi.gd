extends Node2D
## Script de la scène suivi.
##
## Cette scène met en place toutes les actions à réaliser durant la phase
## suivi de l'audit.

## Variable représentant la scène principale
var main

## Fonction appelée lorsque la scène est instanciée
##
## Initialise la variable main
func _ready() -> void:
	main = get_parent()

## Fonction appelée lorsqu'on clique sur le bouton valider
##
## Retourne à la scène principale et passe à la phase suivante
func _on_valider_pressed() -> void:
	main._continuephase("suivi")
	get_viewport().gui_release_focus()
	queue_free.call_deferred()

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)
