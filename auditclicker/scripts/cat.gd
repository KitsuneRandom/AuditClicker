extends AnimatedSprite2D


func _on_cat_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Cat click !")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10


# Surbrillance des éléments
func _on_cat_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)

func _on_cat_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
