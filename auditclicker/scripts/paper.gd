extends Sprite2D

var main
var tooltip

func _ready() -> void:
	main = get_parent().get_parent()
	pass # Replace with function body.

func _on_paper_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Paper click ! (" + main._printpapers() + " papers et " + main._printPpc() + " ppc)")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
		if main._verifobject("paper.tscn") == true:
			main.add_child(preload("res://scenes/phases/preparation.tscn").instantiate())
		else :
			main.add_child(preload("res://scenes/submenus/fullscreen_paper.tscn").instantiate())
		main._increasepapers()


# Surbrillance des éléments
func _on_paper_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Papier"
	print("Affichage de la tooltip etape papier")
	main.add_child(tooltip)

func _on_paper_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
