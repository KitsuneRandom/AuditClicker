extends Node2D
## Script de la scène preparation.
##
## Cette scène met en place toutes les actions à réaliser durant la phase
## préparation de l'audit.

## Variable représentant la scène principale du jeu
var main

## Variable représentant un décompte des étapes de la phase
var countdown

## Fonction appelée lors de l'instanciation de la scène
##
## Instancie les variables et l'affichage de la scène
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

## Fonction appelée lors du click sur le bouton objectifs
##
## Affiche petit à petit un texte à la place du bouton
func _on_objectifs_pressed() -> void:
	main._continuephase("preparation")
	$Objectifs.visible = false
	$ObjectifsTexte.visible = true
	var displayed_text = $ObjectifsTexte.text
	for i in range(displayed_text.length()):
		$ObjectifsTexte.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout
	$Planification.visible = true

## Fonction appelée lors du click sur le bouton planification
##
## Affiche petit à petit un texte à la place du bouton
func _on_planification_pressed() -> void:
	main._continuephase("preparation")
	$Planification.visible = false
	$PlanificationTexte.visible = true
	var displayed_text = $PlanificationTexte.text
	for i in range(displayed_text.length()):
		$PlanificationTexte.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout
	$Equipe.visible = true

## Fonction appelée lors du click sur le bouton équipe
##
## Affiche petit à petit un texte à la place du bouton
func _on_equipe_pressed() -> void:
	main._continuephase("preparation")
	$Equipe.visible = false
	$EquipeTexte.visible = true
	var displayed_text = $EquipeTexte.text
	for i in range(displayed_text.length()):
		$EquipeTexte.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout # j'ai perdu
	$Valider.visible = true

## Fonction appelée lors du click sur le bouton valider
##
## Retourne à la scène principale et passe à la phase suivante
func _on_valider_pressed() -> void:
	main._continuephase("preparation")
	get_viewport().gui_release_focus()
	queue_free.call_deferred()

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_objectifs_mouse_entered() -> void:
	$Objectifs.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_objectifs_mouse_exited() -> void:
	$Objectifs.self_modulate = Color(0.8, 0.8, 0.8)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_planification_mouse_entered() -> void:
	$Planification.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_planification_mouse_exited() -> void:
	$Planification.self_modulate = Color(0.8, 0.8, 0.8)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_equipe_mouse_entered() -> void:
	$Equipe.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_equipe_mouse_exited() -> void:
	$Equipe.self_modulate = Color(0.8, 0.8, 0.8)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)
