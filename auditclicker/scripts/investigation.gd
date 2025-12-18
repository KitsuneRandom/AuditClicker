extends Node2D
## Script de la scène investigation.
##
## Cette scène met en place toutes les actions à réaliser durant la phase
## investigation de l'audit.

## Variable représentant la scène principale
var main

## Booléen mis à true lorsque le papier est en cours d'animation
var paper_animation

## Fonction appelée lors de l'instanciation de la scène
##
## Initialise la variable main et joue une animation sur le papier
## permettant de faire comprendre au joueur qu'il doit intéragir avec
func _ready() -> void:
	main = get_parent()
	$paper.input_event.connect(_on_paper_input_event)
	await get_tree().create_timer(1.0).timeout
	paper_animation = true
	for i in range (0, 10):
		$paper.position.y -=1
		await get_tree().create_timer(0.025).timeout
	for i in range (0, 10):
		$paper.position.y +=1
		await get_tree().create_timer(0.025).timeout
	paper_animation = false

## Fonction appelée à chaque frame.
##
## Si isclicked est à true, appelle la fonction _followmouse().
##
## @param delta float : temps écoulé entre chaque frame
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if(!paper_animation):
			_followmouse()
	if($paper.position.y < -100):
		main._continuephase("investigation")
		get_viewport().gui_release_focus()
		queue_free.call_deferred()

## Fonction permettant d'enregistrer le click sur le papier
##
## @viewport : Objet concerné
## @event : Évennement
## @shape_idx : Collision shape concerné par l'évennement
func _on_paper_input_event(viewport, event, shape_idx):
	pass # LAISSER CA !!   <- ok

## Fonction permettant au papier de suivre la souris sur l'axe y
func _followmouse() -> void:
	var mouse_pos = get_global_mouse_position()
	if(mouse_pos.y < 0):
		$paper.position = Vector2($paper.position.x, mouse_pos.y)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)
