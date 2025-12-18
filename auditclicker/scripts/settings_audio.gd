extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_opt_button_back_pressed() -> void:
	get_viewport().gui_release_focus()
	queue_free.call_deferred()

# Jolis boutons
func _on_opt_button_back_mouse_entered() -> void:
	$OptButtonBack.self_modulate = Color(1, 0.5, 0.5)
	$OptButtonBack.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_back_mouse_exited() -> void:
	$OptButtonBack.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonBack.mouse_default_cursor_shape = Control.CURSOR_ARROW
