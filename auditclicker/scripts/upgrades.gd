extends AnimatedSprite2D

var main

func _ready() -> void:
	main = get_parent().get_parent()
	pass # Replace with function body.

func _on_upgrades_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Upgrades click !")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
		main.add_child(preload("res://scenes/submenus/upgrades_menu.tscn").instantiate())



# Surbrillance des éléments
func _on_upgrades_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)

func _on_upgrades_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
