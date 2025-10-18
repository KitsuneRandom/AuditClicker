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
	$".".queue_free()
	$"../GameTimeCountdown".start()
	print("Démarrage du jeu et lancement du timer")
