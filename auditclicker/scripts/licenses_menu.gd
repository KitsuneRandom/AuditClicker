extends Node2D

var text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().visible = false
	var path = "res://datas/texts/legal_Informations.txt"
	var file = FileAccess.open(path, FileAccess.READ)
	text = ""
	if file:
		text = file.get_as_text()
		file.close()
		$Space/ScrollContainer/Content.text = (text.split("#"))[1]
	else:
		push_error("Erreur pendant l'ouverture du fichier")
		var endScreen = preload("res://scenes/game_menus/end_menu.tscn").instantiate()
		endScreen._changeText("Erreur lors de l'ouverture du fichier contenant les instructions de jeu.\nFin de la partie")
		get_parent().add_child(endScreen)
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_next_button_mouse_entered() -> void:
	$Space/NextButton.self_modulate = Color(0.8, 0.8, 0.8)


func _on_next_button_mouse_exited() -> void:
	$Space/NextButton.self_modulate = Color(0, 0, 0)


func _on_next_button_pressed() -> void:
	get_parent().visible = true
	queue_free()
	
	#match 
