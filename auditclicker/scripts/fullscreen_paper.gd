extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_parent().get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_opt_button_retour_pressed() -> void:
	get_viewport().gui_release_focus()
	queue_free.call_deferred()


func _on_opt_button_retour_mouse_entered() -> void:
	$OptButtonRetour.self_modulate = Color(1, 0.5, 0.5)


func _on_opt_button_retour_mouse_exited() -> void:
	$OptButtonRetour.self_modulate = Color(0.8, 0.8, 0.8)
