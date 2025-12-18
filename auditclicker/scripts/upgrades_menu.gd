extends Node2D

@export var credits: int
@export var optCadre: int
@export var optRecolte: int
@export var optAnalyse: int
@export var optRedaction: int

var tooltip
var upgrades_level
var cur_credits

var main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_parent()
	upgrades_level = main._getUpgrades_level()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cur_credits = main._getCurCredits()
	$Credits.text = str(cur_credits) + " crédits"
	var nextlevel = upgrades_level["redaction"] + 1
	$OptButtonRedaction.text = "Redaction\n(" + str(5*(nextlevel)) + " crédits)"
	nextlevel = upgrades_level["relation"] + 1
	$OptButtonRelation.text = "Relation\n(" + str(5*(nextlevel)) + " crédits)"
	nextlevel = upgrades_level["organisation"] + 1
	$OptButtonOrganisation.text = "Organisation\n(" + str(5*(nextlevel)) + " crédits)"
	nextlevel = upgrades_level["logique"] + 1
	$OptButtonLogique.text = "Logique\n(" + str(5*(nextlevel)) + " crédits)"
	nextlevel = upgrades_level["technique"] + 1
	$OptButtonTechnique.text = "Technique\n(" + str(5*(nextlevel)) + " crédits)"
	nextlevel = upgrades_level["jugement"] + 1
	$OptButtonJugement.text = "Jugement\n(" + str(5*(nextlevel)) + " crédits)"


func _on_start_button_pressed() -> void:
	queue_free()


func _on_opt_button_redaction_pressed() -> void:
	var nextlevel = upgrades_level["redaction"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("redaction", nextlevel)
	tooltip.displayed_text = "niv " + str(upgrades_level["redaction"]) + ", + " + str(10*upgrades_level["redaction"]) + "% sur la Restitution"
	


func _on_opt_button_relation_pressed() -> void:
	var nextlevel = upgrades_level["relation"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("relation", nextlevel)
	tooltip.displayed_text = "niv " + str(upgrades_level["relation"]) + ", + " + str(10*upgrades_level["relation"]) + "% sur le Suivi"


func _on_opt_button_organisation_pressed() -> void:
	var nextlevel = upgrades_level["organisation"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("organisation", nextlevel)
	tooltip.displayed_text = "niv " + str(upgrades_level["organisation"]) + ", + " + str(10*upgrades_level["organisation"]) + "% sur la Préparation"


func _on_opt_button_logique_pressed() -> void:
	var nextlevel = upgrades_level["logique"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("logique", nextlevel)
	tooltip.displayed_text = "niv " + str(upgrades_level["logique"]) + ", + " + str(10*upgrades_level["logique"]) + "% sur l'Analyse"


func _on_opt_button_technique_pressed() -> void:
	var nextlevel = upgrades_level["technique"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("technique", nextlevel)
	tooltip.displayed_text = "niv " + str(upgrades_level["technique"]) + ", + " + str(2*upgrades_level["technique"]) + "% sur tout"


func _on_opt_button_jugement_pressed() -> void:
	var nextlevel = upgrades_level["jugement"] + 1
	if (nextlevel > 5):
		_printerror("niveau max atteint")
		return
	if (cur_credits < 5*nextlevel):
		_printerror("pas assez de crédits")
		return
	_upgrade("jugement", nextlevel)
	tooltip.displayed_text = "niv " + str(upgrades_level["jugement"]) + ", + " + str(10*upgrades_level["jugement"]) + "% sur l'Investigation"

func _printerror(error) -> void:
	print(error) # à mettre plus tard dans une vraie textbox

func _upgrade(upgrade_type, newlevel) -> void:
	upgrades_level[upgrade_type] = newlevel
	cur_credits -= 5*newlevel
	main._updateupgrades(upgrades_level, cur_credits)



# Jolis boutons :D
func _on_opt_button_retour_mouse_entered() -> void:
	$OptButtonRetour.self_modulate = Color(1, 0.5, 0.5)

func _on_opt_button_retour_mouse_exited() -> void:
	$OptButtonRetour.self_modulate = Color(0.8, 0.8, 0.8)


func _on_opt_button_relation_mouse_entered() -> void:
	$OptButtonRelation.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["relation"]) + ", + " + str(10*upgrades_level["relation"]) + "% sur le Suivi"
	main.add_child(tooltip)

func _on_opt_button_relation_mouse_exited() -> void:
	$OptButtonRelation.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		tooltip.queue_free()
		tooltip = null


func _on_opt_button_organisation_mouse_entered() -> void:
	$OptButtonOrganisation.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["organisation"]) + ", + " + str(10*upgrades_level["organisation"]) + "% sur la Préparation"
	main.add_child(tooltip)

func _on_opt_button_organisation_mouse_exited() -> void:
	$OptButtonOrganisation.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		tooltip.queue_free()
		tooltip = null


func _on_opt_button_logique_mouse_entered() -> void:
	$OptButtonLogique.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["logique"]) + ", + " + str(10*upgrades_level["logique"]) + "% sur l'Analyse"
	main.add_child(tooltip)

func _on_opt_button_logique_mouse_exited() -> void:
	$OptButtonLogique.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		tooltip.queue_free()
		tooltip = null


func _on_opt_button_technique_mouse_entered() -> void:
	$OptButtonTechnique.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["technique"]) + ", + " + str(2*upgrades_level["technique"]) + "% sur tout"
	main.add_child(tooltip)

func _on_opt_button_technique_mouse_exited() -> void:
	$OptButtonTechnique.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		tooltip.queue_free()
		tooltip = null


func _on_opt_button_jugement_mouse_entered() -> void:
	$OptButtonJugement.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["jugement"]) + ", + " + str(10*upgrades_level["jugement"]) + "% sur l'Investigation"
	main.add_child(tooltip)

func _on_opt_button_jugement_mouse_exited() -> void:
	$OptButtonJugement.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		tooltip.queue_free()
		tooltip = null


func _on_opt_button_redaction_mouse_entered() -> void:
	$OptButtonRedaction.self_modulate = Color(0, 0, 0)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "niv " + str(upgrades_level["redaction"]) + ", + " + str(10*upgrades_level["redaction"]) + "% sur la Restitution"
	main.add_child(tooltip)

func _on_opt_button_redaction_mouse_exited() -> void:
	$OptButtonRedaction.self_modulate = Color(0.8, 0.8, 0.8)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
