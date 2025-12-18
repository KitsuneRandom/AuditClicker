extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_parent()
	self_modulate = Color(0,0,0,0.5)
	print(get_parent())
	$Control/ResultsValue.text = str(get_node("/root/TheGame")._getpapers()) + " points"

func _changeText(text: String) -> void:
	$Control/ResultsTitle.text = text
	if text == "Erreur lors de l'ouverture du fichier contenant les instructions de jeu.\nFin de la partie":
		$Control/ResultsTitle.position = Vector2(-83, $Control/ResultsTitle.position.y)
	$Control/ResultsValue.text = ""


func _on_quit_button_pressed() -> void:
	print("Sortie du jeu")
	get_viewport().gui_release_focus()
	main.get_tree().quit()
	pass # Replace with function body.
