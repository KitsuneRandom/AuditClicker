extends Node2D
## Scène permettant d'afficher les paramètres audio du jeu
##
## Note : À la place des paramètres audio, une simple image est affichée
## car nous n'avons pas eu le temps de le créer

## Fonction appelée lors du click sur le bouton retour
##
## Retourne au menu principal
func _on_opt_button_back_pressed() -> void:
	get_viewport().gui_release_focus()
	queue_free.call_deferred()

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_back_mouse_entered() -> void:
	$OptButtonBack.self_modulate = Color(1, 0.5, 0.5)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_back_mouse_exited() -> void:
	$OptButtonBack.self_modulate = Color(0.8, 0.8, 0.8)
