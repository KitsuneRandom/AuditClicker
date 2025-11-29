extends Node2D

@export var credits: int
@export var optCadre: int
@export var optRecolte: int
@export var optAnalyse: int
@export var optRedaction: int

var upgrades_level = {}
var cur_credits

var main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cur_credits = main._getCurCredits()
	$Credits.text = str(cur_credits) + " crédits"
	upgrades_level = main._getUpgrades_level()


func _on_start_button_pressed() -> void:
	queue_free()


func _on_opt_button_redaction_pressed() -> void:
	pass # Replace with function body.


func _on_opt_button_relation_pressed() -> void:
	pass # Replace with function body.


func _on_opt_button_organisation_pressed() -> void:
	pass # Replace with function body.


func _on_opt_button_logique_pressed() -> void:
	pass # Replace with function body.


func _on_opt_button_technique_pressed() -> void:
	pass # Replace with function body.


func _on_opt_button_jugement_pressed() -> void:
	pass # Replace with function body.





# Jolis boutons :D
func _on_opt_button_retour_mouse_entered() -> void:
	$OptButtonRetour.self_modulate = Color(1, 0.5, 0.5)
	$OptButtonRetour.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_retour_mouse_exited() -> void:
	$OptButtonRetour.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonRetour.mouse_default_cursor_shape = Control.CURSOR_ARROW


func _on_opt_button_relation_mouse_entered() -> void:
	$OptButtonRelation.self_modulate = Color(0, 0, 0)
	$OptButtonRelation.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_relation_mouse_exited() -> void:
	$OptButtonRelation.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonRelation.mouse_default_cursor_shape = Control.CURSOR_ARROW


func _on_opt_button_organisation_mouse_entered() -> void:
	$OptButtonOrganisation.self_modulate = Color(0, 0, 0)
	$OptButtonOrganisation.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_organisation_mouse_exited() -> void:
	$OptButtonOrganisation.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonOrganisation.mouse_default_cursor_shape = Control.CURSOR_ARROW


func _on_opt_button_logique_mouse_entered() -> void:
	$OptButtonLogique.self_modulate = Color(0, 0, 0)
	$OptButtonLogique.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_logique_mouse_exited() -> void:
	$OptButtonLogique.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonLogique.mouse_default_cursor_shape = Control.CURSOR_ARROW


func _on_opt_button_technique_mouse_entered() -> void:
	$OptButtonTechnique.self_modulate = Color(0, 0, 0)
	$OptButtonTechnique.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_technique_mouse_exited() -> void:
	$OptButtonTechnique.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonTechnique.mouse_default_cursor_shape = Control.CURSOR_ARROW


func _on_opt_button_jugement_mouse_entered() -> void:
	$OptButtonJugement.self_modulate = Color(0, 0, 0)
	$OptButtonJugement.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_jugement_mouse_exited() -> void:
	$OptButtonJugement.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonJugement.mouse_default_cursor_shape = Control.CURSOR_ARROW


func _on_opt_button_redaction_mouse_entered() -> void:
	$OptButtonRedaction.self_modulate = Color(0, 0, 0)
	$OptButtonRedaction.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_opt_button_redaction_mouse_exited() -> void:
	$OptButtonRedaction.self_modulate = Color(0.8, 0.8, 0.8)
	$OptButtonRedaction.mouse_default_cursor_shape = Control.CURSOR_ARROW
