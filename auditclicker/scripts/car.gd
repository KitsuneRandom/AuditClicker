extends Sprite2D



func _on_car_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Car click !")
		$"../CarSound".play()
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
