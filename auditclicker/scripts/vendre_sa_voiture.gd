extends Node2D

var main

func _ready() -> void:
	main = get_parent()


func _on_ok_button_pressed() -> void:
	main._vendre_voiture()
	queue_free()


func _on_back_button_pressed() -> void:
	queue_free()
