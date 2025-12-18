extends Node2D
## Scène permettant de créer des tooltips personnalisées

## Texte affiché
@export var displayed_text: String

## police
var font

## Fonction appelée lorsque la scène est instanciée
##
## Initialise une tooltip sous la souris, de la taille du texte à afficher
func _ready() -> void:
	$".".z_index = 100
	$Background.size = Vector2(10 * 2, 10 * 2)
	$Background/Label.text = ""
	font = $Background/Label.get_theme_font("font")
	for i in range(displayed_text.length()):
		$Background/Label.text = displayed_text.substr(0, i + 1)
		var text_size = font.get_string_size($Background/Label.text)
		$Background.size.x = text_size.x + 10 * 2
		$Background.size.y = text_size.y + 10
		await get_tree().create_timer(0.125/displayed_text.length()).timeout
	$Background/Label.text = displayed_text


## Fonction appelée à chaque frame
##
## Déplace la tooltip à l'emplacement de la souris
##
## @param delta float : temps entre chaque frame
func _process(delta: float) -> void:
	var end_pos = get_global_mouse_position()
	end_pos -= Vector2(0, -30)
	position = end_pos

## Met le texte à la valeur passée en paramètre
##
## @param new_text String : nouveau texte
func _set_text(new_text: String) -> void:
	$Background/Label.text = new_text
	var text_size = font.get_string_size($Background/Label.text)
	$Background.size.x = text_size.x + 10 * 2
	$Background.size.y = text_size.y + 10
