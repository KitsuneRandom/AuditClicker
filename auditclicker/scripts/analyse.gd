extends Node2D
## Script de la scène analyse.
##
## Cette scène met en place toutes les actions à réaliser durant la phase
## analyse de l'audit.

## Variable représentant la scène principale du jeu
var main

## Variable représentant le texte affiché
var displayed_text

## Variable représentant l'état du bouton
var state

## Décompte des étapes de la phase
var countdown

var texts = [
	"Pour éviter de \nperdre du temps, il \nest essentiel \nd'identifier les \ntâches à haut \nrendement.",
	"L'écoute et la \ncommunication permet \nd'avoir des \nopportunités \nd'innovation.",
	"Anticiper les \nbesoins, suivre de \nprès les dépenses et \nmaîtriser les recettes.",
	"Offrir une \nexpérience client \nfluide et personnalisée \npour fidéliser \nles clients.",
	"Transformer \nl’incertitude en \nune opportunité de \ncroissance.",
	"Chaque membre \nde l’entreprise \ndoit connaître ses \nobjectifs.",
	"Le crâne d'Ali \nil brille. Son \ncrâne il reflète, \nc'est un miroir",
	"Lorem ipsum \ndolor sit amet, \nconsectetur adipiscing \nelit, sed do eiusmod \ntempor"
]

## Fonction appelée à l'instanciation de la scène
##
## Initialise les varibales
func _ready() -> void:
	main = get_parent()
	state = 1
	countdown = main._getPhaseStepDuration("analyse")
	print(countdown)
	$MagnifyingGlass/PaperText.text = ""

## Fonction appelée lors du click sur le bouton valider
##
## Cache le bouton puis lance les animations de la phase dans l'état 1,
## Supprime la scène et passe à la phase suivante dans l'état 2
func _on_valider_pressed() -> void:
	if state == 1:
		$Valider.visible = false
		displayed_text = texts[randi() % 7]
		await _look_with_glass(-38, -56)
		displayed_text = texts[randi() % 7]
		await _look_with_glass(82, -56)
		displayed_text = texts[randi() % 7]
		await _look_with_glass(82, 45)
		displayed_text = texts[randi() % 7]
		await _look_with_glass(-38, 45)
		$Valider.text = "Valider"
		$MagnifyingGlass/PaperText.text = ""
		var target = Vector2(16, -12)
		var tween = create_tween()
		tween.tween_property($MagnifyingGlass, "position", target, 1.0) 
		await tween.finished
		$Valider.visible = true
	if state == 2:
		get_viewport().gui_release_focus()
		queue_free.call_deferred()
	main._continuephase("analyse")
	state += 1

## Fonction permettant d'animer le déplacement de la loupe
func _look_with_glass(x: int, y: int) -> void:
	$MagnifyingGlass/PaperText.text = ""
	var target = Vector2(x, y)
	var tween = create_tween()
	tween.tween_property($MagnifyingGlass, "position", target, 1.0) 
	await tween.finished
	for i in range(displayed_text.length()):
		$MagnifyingGlass/PaperText.text = displayed_text.substr(0, i + 1)
		await get_tree().create_timer(countdown/displayed_text.length()).timeout
	await get_tree().create_timer(0.5).timeout

## Changement de la couleur du bouton lorsqu'on passe sur le bouton
func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)

## Remise de la couleur à la couleur d'origine lorsqu'on quitte le bouton
func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)
