extends Node2D

var main # Ecran principal du jeu 
var displayed_text
var state
var countdown

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_parent()
	state = 1
	countdown = main._getPhaseStepDuration("analyse")
	print(countdown)
	displayed_text = $MagnifyingGlass/PaperText.text
	$MagnifyingGlass/PaperText.text = ""
	pass # Replace with function body.


func _on_valider_pressed() -> void:
	if state == 1:
		$Valider.visible = false
		await _look_with_glass(-38, -56)
		await _look_with_glass(82, -56)
		await _look_with_glass(82, 45)
		await _look_with_glass(-38, 45)
		$Valider.text = "Valider"
		$Valider.visible = true
		$MagnifyingGlass/PaperText.text = ""
		var target = Vector2(16, -12)
		var tween = create_tween()
		tween.tween_property($MagnifyingGlass, "position", target, 1.0) 
		await tween.finished
	if state == 2:
		get_viewport().gui_release_focus()
		queue_free.call_deferred()
	main._continuephase("analyse")
	state += 1

func _look_with_glass(x: int, y: int) -> void:
	$MagnifyingGlass/PaperText.text = ""
	var target = Vector2(x, y)
	var tween = create_tween()
	tween.tween_property($MagnifyingGlass, "position", target, 1.0) 
	await tween.finished
	for i in range(displayed_text.length()):
		$MagnifyingGlass/PaperText.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout

func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)

func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)
