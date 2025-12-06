extends Node2D

var main
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_parent()
	pass # Replace with function body.


func _on_objectifs_pressed() -> void:
	pass # Replace with function body.

func _on_planification_pressed() -> void:
	pass # Replace with function body.

func _on_equipe_pressed() -> void:
	pass # Replace with function body.

func _on_valider_pressed() -> void:
	main._continuephase("preparation")
	queue_free()


func _on_objectifs_mouse_entered() -> void:
	$Objectifs.self_modulate = Color(0, 0, 0)
	$Objectifs.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_objectifs_mouse_exited() -> void:
	$Objectifs.self_modulate = Color(0.8, 0.8, 0.8)
	$Objectifs.mouse_default_cursor_shape = Control.CURSOR_ARROW

func _on_planification_mouse_entered() -> void:
	$Planification.self_modulate = Color(0, 0, 0)
	$Planification.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_planification_mouse_exited() -> void:
	$Planification.self_modulate = Color(0.8, 0.8, 0.8)
	$Planification.mouse_default_cursor_shape = Control.CURSOR_ARROW

func _on_equipe_mouse_entered() -> void:
	$Equipe.self_modulate = Color(0, 0, 0)
	$Equipe.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_equipe_mouse_exited() -> void:
	$Equipe.self_modulate = Color(0.8, 0.8, 0.8)
	$Equipe.mouse_default_cursor_shape = Control.CURSOR_ARROW

func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)
	$Valider.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)
	$Valider.mouse_default_cursor_shape = Control.CURSOR_ARROW
