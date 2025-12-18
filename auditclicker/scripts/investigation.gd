extends Node2D


var main
var paper_clicked
var paper_animation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_parent()
	$paper.input_event.connect(_on_paper_input_event)
	await get_tree().create_timer(1.0).timeout
	paper_animation = true
	for i in range (0, 10):
		$paper.position.y -=1
		await get_tree().create_timer(0.025).timeout
	for i in range (0, 10):
		$paper.position.y +=1
		await get_tree().create_timer(0.025).timeout
	paper_animation = false
	pass # Replace with function body.

## Fonction appelée à chaque frame.
##
## Si isclicked est à true, appelle la fonction _followmouse().
##
## @param delta float : temps écoulé entre chaque frame
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if(!paper_animation):
			_followmouse()
	if($paper.position.y < -100):
		main._continuephase("investigation")
		queue_free()

func _on_paper_input_event(viewport, event, shape_idx):
	pass # LAISSER CA !!


func _followmouse() -> void:
	var mouse_pos = get_global_mouse_position()
	if(mouse_pos.y < 0):
		$paper.position = Vector2($paper.position.x, mouse_pos.y)

func _on_valider_mouse_entered() -> void:
	$Valider.self_modulate = Color(0, 0, 0)

func _on_valider_mouse_exited() -> void:
	$Valider.self_modulate = Color(0.8, 0.8, 0.8)
