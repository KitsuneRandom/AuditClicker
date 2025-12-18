extends Node2D
## Scène représentant le menu options du jeu

## Variable représentant la scène principale du jeu
var main

## Fonction appelée lors de l'instanciation du noeud
##
## Instancie la variable main et met en pause le timer du jeu
func _ready() -> void:
	main = get_parent()
	main.get_node("GameTimeCountdown").stop()

## Retour à la scène principale et remise en route du timer du jeu
func _on_opt_button_back_pressed() -> void:
	main.get_node("GameTimeCountdown").start()
	get_viewport().gui_release_focus()
	queue_free.call_deferred()

## Fonction appelée lorsqu'on appuie sur le bouton audio
##
## Instancie la scène settings_audio
func _on_opt_button_audio_pressed() -> void:
	main.add_child(preload("res://scenes/submenus/settings_audio.tscn").instantiate())

## Fonction appelée lorsqu'on appuie sur le bouton crédits
##
## Instancie la scène licenses_menu
func _on_opt_button_credits_pressed() -> void:
	main.get_parent().add_child(preload("res://scenes/submenus/licenses_menu.tscn").instantiate())

## Quitter le jeu
func _on_opt_button_quitter_pressed() -> void:
	print("Sortie du jeu")
	main.get_tree().quit()

## Fonction appelée lorsqu'on appuie sur le bouton voiture
##
## Réaffiche la voiture sur la scène principale et retourne sur la scène principale
func _on_opt_button_voiture_pressed() -> void:
	main._buy_car()
	main.get_node("GameTimeCountdown").start()
	get_viewport().gui_release_focus()
	queue_free.call_deferred()

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_back_mouse_entered() -> void:
	$OptButtonBack.self_modulate = Color(1, 0.5, 0.5)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_back_mouse_exited() -> void:
	$OptButtonBack.self_modulate = Color(0.8, 0.8, 0.8)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_audio_mouse_entered() -> void:
	$OptButtonAudio.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_audio_mouse_exited() -> void:
	$OptButtonAudio.self_modulate = Color(0.8, 0.8, 0.8)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_credits_mouse_entered() -> void:
	$OptButtonCredits.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_credits_mouse_exited() -> void:
	$OptButtonCredits.self_modulate = Color(0.8, 0.8, 0.8)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_quitter_mouse_entered() -> void:
	$OptButtonQuitter.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_quitter_mouse_exited() -> void:
	$OptButtonQuitter.self_modulate = Color(0.8, 0.8, 0.8)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_voiture_mouse_entered() -> void:
	$OptButtonVoiture.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_voiture_mouse_exited() -> void:
	$OptButtonVoiture.self_modulate = Color(0.8, 0.8, 0.8)
