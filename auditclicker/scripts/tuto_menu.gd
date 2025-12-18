extends Node2D
## Affichage du tutoriel
##
## Lit le fichier tuto.txt et affiche le texte sur plusieurs écrans

## Étape du tuto
@export var tutoState: int

## Variable servant à savoir si le timer doit être démarré après le tuto
@export var firstTimeShown: int = 0 

## Texte affiché
var text

## Fonction appelée lors de l'instanciation de la scène
##
## Arrête le timer, met à jour le texte et l'affiche. Affiche le menu
## fin du jeu avec une erreur si il ne trouve pas le fichier
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
		queue_free()
	

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_next_button_mouse_entered() -> void:
	$Space/NextButton.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_next_button_mouse_exited() -> void:
	$Space/NextButton.self_modulate = Color(0.8, 0.8, 0.8)

## Fonction appelée lorsqu'on clique sur le bouton continuer
##
## Affiche la suite du texte si il n'est pas fini ou permet de
## commencer le jeu en relançant le timer
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
