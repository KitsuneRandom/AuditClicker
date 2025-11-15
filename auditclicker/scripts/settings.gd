extends Node2D

var main

func _ready() -> void:
	main = get_parent().get_parent()
	pass # Replace with function body.

func _on_opt_button_back_pressed() -> void:
	queue_free()

func _on_opt_button_audio_pressed() -> void:
	main.add_child(preload("res://scenes/submenus/settings_audio.tscn").instantiate())
