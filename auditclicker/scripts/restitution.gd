extends Node2D

var main
var displayed_text
var countdown
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_parent()
	$Valider.visible = false
	displayed_text = $RestitutionText.text
	$RestitutionText.text = ""
	countdown = main._getPhaseStepDuration("restitution")
	pass # Replace with function body.


func _on_valider_pressed() -> void:
	main._continuephase("restitution")
	queue_free()

func _on_rapport_pressed() -> void:
	$Rapport.visible = false
	$RestitutionText.visible = true
	for i in range(displayed_text.length()):
		$RestitutionText.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout
	$Valider.visible = true
	pass # Replace with function body.


func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)
	$Valider.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)
	$Valider.mouse_default_cursor_shape = Control.CURSOR_ARROW


func _on_rapport_mouse_entered() -> void:
	$Rapport.self_modulate = Color(0, 0, 0)
	$Rapport.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_rapport_mouse_exited() -> void:
	$Rapport.self_modulate = Color(0.8, 0.8, 0.8)
	$Rapport.mouse_default_cursor_shape = Control.CURSOR_ARROW
