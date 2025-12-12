extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_opt_button_retour_pressed() -> void:
	queue_free()


func _on_opt_button_retour_mouse_entered() -> void:
	$OptButtonRetour.self_modulate = Color(1, 0.5, 0.5)
	$OptButtonRetour.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND


func _on_opt_button_retour_mouse_exited() -> void:
	$OptButtonRetour.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonRetour.mouse_default_cursor_shape = Control.CURSOR_ARROW
