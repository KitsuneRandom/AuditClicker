extends Area2D


func _on_paper_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Chat cliqué !")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
