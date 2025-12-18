extends Node2D

var main
var countdown
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_parent()
	$Objectifs.visible = true
	$Planification.visible = false
	$Equipe.visible = false
	$Valider.visible = false
	$StepsCountdown.wait_time = 2.0
	$StepsCountdown.one_shot = true
	countdown = main._getPhaseStepDuration("preparation")
	print(countdown)
	pass # Replace with function body.

func _on_objectifs_pressed() -> void:
	main._continuephase("preparation")
	$Objectifs.visible = false
	$ObjectifsTexte.visible = true
	var displayed_text = $ObjectifsTexte.text
	for i in range(displayed_text.length()):
		$ObjectifsTexte.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout
	$Planification.visible = true
	pass # Replace with function body.

func _on_planification_pressed() -> void:
	main._continuephase("preparation")
	$Planification.visible = false
	$PlanificationTexte.visible = true
	var displayed_text = $PlanificationTexte.text
	for i in range(displayed_text.length()):
		$PlanificationTexte.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout
	$Equipe.visible = true
	pass # Replace with function body.

func _on_equipe_pressed() -> void:
	main._continuephase("preparation")
	$Equipe.visible = false
	$EquipeTexte.visible = true
	var displayed_text = $EquipeTexte.text
	for i in range(displayed_text.length()):
		$EquipeTexte.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout # j'ai perdu
	$Valider.visible = true
	pass # Replace with function body.

func _on_valider_pressed() -> void:
	main._continuephase("preparation")
	get_viewport().gui_release_focus()
	queue_free.call_deferred()


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
