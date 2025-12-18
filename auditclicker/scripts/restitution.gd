extends Node2D
## Script de la scène restitution.
##
## Cette scène met en place toutes les actions à réaliser durant la phase
## restitution de l'audit.

## Variable représentant la scène principale
var main

## Texte affiché
var displayed_text

## Variable représentant un décompte des étapes de la phase
var countdown

## Fonction appelée lorsqu'on instancie le noeud
func _ready() -> void:
	main = get_parent()
	$Valider.visible = false
	displayed_text = $RestitutionText.text
	$RestitutionText.text = ""
	countdown = main._getPhaseStepDuration("restitution")
	print(countdown)

## Fonction appelée lors du click sur le bouton valider
##
## Retourne à la scène principale et passe à la phase suivante
func _on_valider_pressed() -> void:
	main._continuephase("restitution")
	get_viewport().gui_release_focus()
	queue_free.call_deferred()

## Fonction appelée lors du click sur le bouton rapport
##
## Affiche petit à petit un texte à la place du bouton
func _on_rapport_pressed() -> void:
	$Rapport.visible = false
	$RestitutionText.visible = true
	for i in range(displayed_text.length()):
		$RestitutionText.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout
	$Valider.visible = true

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_rapport_mouse_entered() -> void:
	$Rapport.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_rapport_mouse_exited() -> void:
	$Rapport.self_modulate = Color(0.8, 0.8, 0.8)
