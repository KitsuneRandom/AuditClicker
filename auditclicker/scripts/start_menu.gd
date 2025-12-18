extends Node2D
## Menu affiché au lancement du jeu

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_start_button_mouse_entered() -> void:
	$StartButton.self_modulate = Color(0.8, 0.8, 0.8)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_start_button_mouse_exited() -> void:
	$StartButton.self_modulate = Color(0, 0, 0)

## Fonction appelée lors du click sur le bouton continuer
##
## Lance le tutoriel
func _on_start_button_pressed() -> void:
	$".".queue_free()
	var tutoScreen = preload("res://scenes/game_menus/tuto_menu.tscn").instantiate()
	tutoScreen.tutoState = 1
	tutoScreen.firstTimeShown = 1
	print("Affichage du tuto")
	get_parent().add_child(tutoScreen)
