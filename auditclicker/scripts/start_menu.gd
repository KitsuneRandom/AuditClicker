extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_mouse_entered() -> void:
	$StartButton.self_modulate = Color(0.8, 0.8, 0.8)

func _on_start_button_mouse_exited() -> void:
	$StartButton.self_modulate = Color(0, 0, 0)

func _on_start_button_pressed() -> void:
	get_viewport().gui_release_focus()
	$".".queue_free.call_deferred()
	var tutoScreen = preload("res://scenes/game_menus/tuto_menu.tscn").instantiate()
	tutoScreen.tutoState = 1
	tutoScreen.firstTimeShown = 1
	print("Affichage du tuto")
	get_parent().add_child(tutoScreen)
