extends Node2D
## Script de la scène analyse.
##
## Cette scène met en place toutes les actions à réaliser durant la phase
## analyse de l'audit.

## Variable représentant la scène principale du jeu
var main

## Variable représentant le texte affiché
var displayed_text

## Variable représentant l'état du bouton
var state

var countdown

## Fonction appelée à l'instanciation de la scène
##
## Initialise les varibales
func _ready() -> void:
	main = get_parent()
	state = 1
	countdown = main._getPhaseStepDuration("analyse")
	print(countdown)
	displayed_text = $MagnifyingGlass/PaperText.text
	$MagnifyingGlass/PaperText.text = ""

## Fonction appelée lors du click sur le bouton valider
##
## Cache le bouton puis lance les animations de la phase dans l'état 1,
## Supprime la scène et passe à la phase suivante dans l'état 2
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

## Fonction permettant d'animer le déplacement de la loupe
func _look_with_glass(x: int, y: int) -> void:
	$MagnifyingGlass/PaperText.text = ""
	var target = Vector2(x, y)
	var tween = create_tween()
	tween.tween_property($MagnifyingGlass, "position", target, 1.0) 
	await tween.finished
	for i in range(displayed_text.length()):
		$MagnifyingGlass/PaperText.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)
