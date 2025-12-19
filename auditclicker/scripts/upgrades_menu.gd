extends Node2D
## Affichage du menu d'améliorations
##
## Menu permettant d'acheter des améliorations avec les crédits

## Variable représentant la tooltip
var tooltip

## Variable représentant les niveaux actuels des améliorations
var upgrades_level

## Variable représentant les crédits actuels
var cur_credits

## Variable représentant la scène principale
var main

## Fonction appelée lorsque la scène est instanciée
##
## Initialise les variables
func _ready() -> void:
	main = get_parent()
	upgrades_level = main._getUpgrades_level()


## Fonction appelée à chaque frame
##
## Met à jour les crédits et le texte des boutons
func _process(delta: float) -> void:
	cur_credits = main._getCurCredits()
	$Credits.text = str(cur_credits) + " crédits"
	var nextlevel = upgrades_level["redaction"] + 1
	if (nextlevel > 5):
		$OptButtonRedaction.text = "Redaction\n(Niveau max)"
	else:
		$OptButtonRedaction.text = "Redaction\n(" + str(5*(nextlevel)) + " crédits)"
	nextlevel = upgrades_level["relation"] + 1
	if (nextlevel > 5):
		$OptButtonRelation.text = "Relation\n(Niveau max)"
	else:
			$OptButtonRelation.text = "Relation\n(" + str(5*(nextlevel)) + " crédits)"
	nextlevel = upgrades_level["organisation"] + 1
	if (nextlevel > 5):
		$OptButtonOrganisation.text = "Organisation\n(Niveau max)"
	else:
			$OptButtonOrganisation.text = "Organisation\n(" + str(5*(nextlevel)) + " crédits)"
	nextlevel = upgrades_level["logique"] + 1
	if (nextlevel > 5):
		$OptButtonLogique.text = "Logique\n(Niveau max)"
	else:
		$OptButtonLogique.text = "Logique\n(" + str(5*(nextlevel)) + " crédits)"
	nextlevel = upgrades_level["technique"] + 1
	if (nextlevel > 5):
		$OptButtonTechnique.text = "Technique\n(Niveau max)"
	else:
			$OptButtonTechnique.text = "Technique\n(" + str(5*(nextlevel)) + " crédits)"
	nextlevel = upgrades_level["jugement"] + 1
	if (nextlevel > 5):
		$OptButtonJugement.text = "Jugement\n(Niveau max)"
	else:
			$OptButtonJugement.text = "Jugement\n(" + str(5*(nextlevel)) + " crédits)"

## Retourne sur la scène principale
func _on_start_button_pressed() -> void:
	get_viewport().gui_release_focus()
	queue_free.call_deferred()

## Fonction appelée lorsqu'on clique sur le bouton redaction
##
## Augmente le niveau de redaction
func _on_opt_button_redaction_pressed() -> void:
	var nextlevel = upgrades_level["redaction"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("redaction", nextlevel)
	tooltip._set_text("niv " + str(upgrades_level["redaction"]) + ", + " + str(10*upgrades_level["redaction"]) + "% sur la Restitution")
	
## Fonction appelée lorsqu'on clique sur le bouton relation
##
## Augmente le niveau de relation
func _on_opt_button_relation_pressed() -> void:
	var nextlevel = upgrades_level["relation"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("relation", nextlevel)
	tooltip._set_text("niv " + str(upgrades_level["relation"]) + ", + " + str(10*upgrades_level["relation"]) + "% sur le Suivi")

## Fonction appelée lorsqu'on clique sur le bouton organisation
##
## Augmente le niveau de organisation
func _on_opt_button_organisation_pressed() -> void:
	var nextlevel = upgrades_level["organisation"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("organisation", nextlevel)
	tooltip._set_text("niv " + str(upgrades_level["organisation"]) + ", + " + str(10*upgrades_level["organisation"]) + "% sur la Préparation")

## Fonction appelée lorsqu'on clique sur le bouton logique
##
## Augmente le niveau de logique
func _on_opt_button_logique_pressed() -> void:
	var nextlevel = upgrades_level["logique"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("logique", nextlevel)
	tooltip._set_text("niv " + str(upgrades_level["logique"]) + ", + " + str(10*upgrades_level["logique"]) + "% sur l'Analyse")

## Fonction appelée lorsqu'on clique sur le bouton technique
##
## Augmente le niveau de technique
func _on_opt_button_technique_pressed() -> void:
	var nextlevel = upgrades_level["technique"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("technique", nextlevel)
	tooltip._set_text("niv " + str(upgrades_level["technique"]) + ", + " + str(2*upgrades_level["technique"]) + "% sur tout")

## Fonction appelée lorsqu'on clique sur le bouton jugement
##
## Augmente le niveau de jugement
func _on_opt_button_jugement_pressed() -> void:
	var nextlevel = upgrades_level["jugement"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("jugement", nextlevel)
	tooltip._set_text("niv " + str(upgrades_level["jugement"]) + ", + " + str(10*upgrades_level["jugement"]) + "% sur l'Investigation")

## Affiche une erreur
func _printerror(error) -> void:
	print(error) # à mettre plus tard dans une vraie textbox

## Augmente le niveau de l'amélioration choisie
func _upgrade(upgrade_type, newlevel) -> void:
	upgrades_level[upgrade_type] = newlevel
	cur_credits -= 5*newlevel
	main._updateupgrades(upgrades_level, cur_credits)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_retour_mouse_entered() -> void:
	$OptButtonRetour.self_modulate = Color(1, 0.5, 0.5)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_retour_mouse_exited() -> void:
	$OptButtonRetour.self_modulate = Color(0.8, 0.8, 0.8)

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_relation_mouse_entered() -> void:
	$OptButtonRelation.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["relation"]) + ", + " + str(10*upgrades_level["relation"]) + "% sur le Suivi"
	main.add_child(tooltip)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_relation_mouse_exited() -> void:
	$OptButtonRelation.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		get_viewport().gui_release_focus()
		tooltip.queue_free.call_deferred()
		tooltip = null

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_organisation_mouse_entered() -> void:
	$OptButtonOrganisation.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["organisation"]) + ", + " + str(10*upgrades_level["organisation"]) + "% sur la Préparation"
	main.add_child(tooltip)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_organisation_mouse_exited() -> void:
	$OptButtonOrganisation.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		get_viewport().gui_release_focus()
		tooltip.queue_free.call_deferred()
		tooltip = null

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_logique_mouse_entered() -> void:
	$OptButtonLogique.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["logique"]) + ", + " + str(10*upgrades_level["logique"]) + "% sur l'Analyse"
	main.add_child(tooltip)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_logique_mouse_exited() -> void:
	$OptButtonLogique.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		get_viewport().gui_release_focus()
		tooltip.queue_free.call_deferred()
		tooltip = null

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_technique_mouse_entered() -> void:
	$OptButtonTechnique.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["technique"]) + ", + " + str(2*upgrades_level["technique"]) + "% sur tout"
	main.add_child(tooltip)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_technique_mouse_exited() -> void:
	$OptButtonTechnique.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		get_viewport().gui_release_focus()
		tooltip.queue_free.call_deferred()
		tooltip = null

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_jugement_mouse_entered() -> void:
	$OptButtonJugement.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["jugement"]) + ", + " + str(10*upgrades_level["jugement"]) + "% sur l'Investigation"
	main.add_child(tooltip)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_jugement_mouse_exited() -> void:
	$OptButtonJugement.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		get_viewport().gui_release_focus()
		tooltip.queue_free.call_deferred()
		tooltip = null

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_opt_button_redaction_mouse_entered() -> void:
	$OptButtonRedaction.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["redaction"]) + ", + " + str(10*upgrades_level["redaction"]) + "% sur la Restitution"
	main.add_child(tooltip)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_opt_button_redaction_mouse_exited() -> void:
	$OptButtonRedaction.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		get_viewport().gui_release_focus()
		tooltip.queue_free.call_deferred()
		tooltip = null
