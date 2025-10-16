extends Sprite2D


func _on_paper_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Paper click ! (" + get_parent().get_parent()._printClicks() + " clicks)")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
		get_parent().get_parent()._increaseClicks()
