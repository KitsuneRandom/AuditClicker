extends Node2D

var main

func _ready() -> void:
	main = get_parent()
	main.get_node("GameTimeCountdown").stop()
	pass # Replace with function body.

func _on_opt_button_back_pressed() -> void:
	main.get_node("GameTimeCountdown").start()
	queue_free()

func _on_opt_button_audio_pressed() -> void:
	main.add_child(preload("res://scenes/submenus/settings_audio.tscn").instantiate())

func _on_opt_button_credits_pressed() -> void:
	main.get_parent().add_child(preload("res://scenes/submenus/licenses_menu.tscn").instantiate())



# Jolis boutons :D
func _on_opt_button_back_mouse_entered() -> void:
	$OptButtonBack.self_modulate = Color(1, 0.5, 0.5)
	$OptButtonBack.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_back_mouse_exited() -> void:
	$OptButtonBack.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonBack.mouse_default_cursor_shape = Control.CURSOR_ARROW

func _on_opt_button_audio_mouse_entered() -> void:
	$OptButtonAudio.self_modulate = Color(0, 0, 0)
	$OptButtonAudio.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_audio_mouse_exited() -> void:
	$OptButtonAudio.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonAudio.mouse_default_cursor_shape = Control.CURSOR_ARROW

func _on_opt_button_credits_mouse_entered() -> void:
	$OptButtonCredits.self_modulate = Color(0, 0, 0)
	$OptButtonCredits.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_credits_mouse_exited() -> void:
	$OptButtonCredits.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonCredits.mouse_default_cursor_shape = Control.CURSOR_ARROW

func _on_opt_button_quitter_mouse_entered() -> void:
	$OptButtonQuitter.self_modulate = Color(0, 0, 0)
	$OptButtonQuitter.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_quitter_mouse_exited() -> void:
	$OptButtonQuitter.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonQuitter.mouse_default_cursor_shape = Control.CURSOR_ARROW

func _on_opt_button_quitter_pressed() -> void:
	print("Sortie du jeu")
	main.get_tree().quit()
	pass # Replace with function body.
