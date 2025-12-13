extends Sprite2D

var tooltip
var main

func _ready() -> void:
	main = get_parent().get_parent()

func _on_glass_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Glass click !")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
		main.get_child(17).hide()
		if main._verifobject("glass.tscn") == true:
			main.add_child(preload("res://scenes/phases/analyse.tscn").instantiate())




# Surbrillance des éléments
func _on_glass_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Loupe"
	print("Affichage de la tooltip etape loupe")
	main.add_child(tooltip)

func _on_glass_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
