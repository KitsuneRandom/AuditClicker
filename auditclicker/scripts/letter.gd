extends AnimatedSprite2D

var tooltip
var main
var number
var letters_map = {}

func _ready() -> void:
	main = get_parent().get_parent()
	letters_map = {
		4: main.get_node("letterInvest"),
		5: main.get_node("letterSuivi1"),
		6: main.get_node("letterSuivi2"),
		7: main.get_node("letterSuivi3"),
		8: main.get_node("letterSuivi4"),
		9: main.get_node("letterSuivi5"),
		10: main.get_node("letterSuivi6")
	}
	pass # Replace with function body.
	
func _setnumber(newnumber) -> void:
	number = newnumber

func _on_letter_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Letter click !")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
		letters_map[number].hide()
		if main._verifobject("letter.tscn") == true:
			main.add_child(preload("res://scenes/phases/investigation.tscn").instantiate())
		else :
			if main._verifobject("letter2.tscn") == true:
				main.add_child(preload("res://scenes/phases/suivi.tscn").instantiate())




# Surbrillance des éléments
func _on_letter_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Lettre"
	print("Affichage de la tooltip etape lettre")
	main.add_child(tooltip)

func _on_letter_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
