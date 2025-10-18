extends Sprite2D

var main

func _ready() -> void:
	main = get_parent().get_parent()
	pass # Replace with function body.

func _on_paper_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Paper click ! (" + main._printpapers() + " papers et " + main._printPpc() + " ppc)")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
		main._increasepapers()
