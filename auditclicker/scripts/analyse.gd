extends Node2D

var main
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_parent()
	pass # Replace with function body.


func _on_valider_pressed() -> void:
	main._continuephase("analyse")
	queue_free()


func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)
	$Valider.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)
	$Valider.mouse_default_cursor_shape = Control.CURSOR_ARROW
