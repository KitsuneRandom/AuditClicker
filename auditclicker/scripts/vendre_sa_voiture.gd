extends Node2D
## Scène affichée au moment de vendre la voiture
##
## Permet de choisir si on vend la voiture ou non

## Variable représentant la scène principale
var main

## Fonction appelée lorsque la scène est instanciée
##
## Instancie la variable main
func _ready() -> void:
	main = get_parent()

## Vendre la voiture
func _on_ok_button_pressed() -> void:
	main._vendre_voiture()
	queue_free()

## Retour à la scène principale
func _on_back_button_pressed() -> void:
	queue_free()
