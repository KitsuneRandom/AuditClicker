extends Node2D

# Récupération des paramètres passés 
@export var tutoState: int # Etape du tuto
@export var firstTimeShown: int = 0 # Définit si le timer doit être démarré après le tuto
var text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !$"../GameTimeCountdown".is_stopped():
		$"../GameTimeCountdown".stop()
	var path = "res://datas/texts/tuto.txt"
	var file = FileAccess.open(path, FileAccess.READ)
	text = "ptyCode"
	if file:
		text = file.get_as_text()
		file.close()
		print((text.split("#"))[tutoState])
		$Space/Content.text = (text.split("#"))[tutoState]
		if tutoState == int(text[0]):
			$Space/NextButton.text = "Commencer à jouer"
			$Space/NextButton.position.x = 230.5
			var viewport_size = get_viewport_rect().size
			$Space/NextButton.position.x = ($Space/NextButton.get_parent().size.x - $Space/NextButton.size.x) / 2
	else:
		push_error("Erreur pendant l'ouverture du fichier")
		#$GameTimeCountdown.stop()
		var endScreen = preload("res://scenes/game_menus/end_menu.tscn").instantiate()
		endScreen._changeText("Erreur lors de l'ouverture du fichier contenant les instructions de jeu.\nFin de la partie")
		get_parent().add_child(endScreen)
		get_viewport().gui_release_focus()
		queue_free.call_deferred()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_next_button_mouse_entered() -> void:
	$Space/NextButton.self_modulate = Color(0.8, 0.8, 0.8)


func _on_next_button_mouse_exited() -> void:
	$Space/NextButton.self_modulate = Color(0, 0, 0)


func _on_next_button_pressed() -> void:
	if tutoState < int(text[0]):
		var nextStep = preload("res://scenes/game_menus/tuto_menu.tscn").instantiate()
		nextStep.tutoState = tutoState+1
		nextStep.firstTimeShown = firstTimeShown
		get_parent().add_child(nextStep)
	get_viewport().gui_release_focus()
	queue_free.call_deferred()
	if tutoState == int(text[0]):
		if firstTimeShown == 1:
			print("Démarrage du jeu et lancement du timer")
		else:
			print("Reprise du jeu et reprise du timer")
		$"../GameTimeCountdown".start()
	
	#match 
