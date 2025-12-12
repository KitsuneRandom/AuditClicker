extends TextureButton

var tooltip
var main
var is_mouse_over
var isclicked = false

func _ready() -> void:
	main = get_parent().get_parent()
	set_process_input(true)
	pass # Replace with function body.

func _process(delta: float) -> void:
	if isclicked:
		_followmouse()
	else:
		pass

func _followmouse() -> void:
	get_parent().position = main.get_global_mouse_position()

func _fall() -> void:
	var falltime = 20
	if get_parent().position.x < -252 or get_parent().position.x > 255 :
		falltime = 100
	if get_parent().position.y > 74 or get_parent().position.x < -252 or get_parent().position.x > 255 :
		for i in range(0, falltime):
			get_parent().position.y += 5
			await get_tree().create_timer(0.05).timeout
		get_parent().position.x = 57
		get_parent().position.y = 74
	while get_parent().position.y < 74:
		get_parent().position.y += 5
		await get_tree().create_timer(0.05).timeout


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and is_mouse_over:
			isclicked = true
		elif event.is_released() and isclicked:
			_fall()
			isclicked = false


# Surbrillance des éléments
func _on_pen_mouse_entered() -> void:
	is_mouse_over = true
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Stylo"
	print("Affichage de la tooltip etape stylo")
	main.add_child(tooltip)

func _on_pen_mouse_exited() -> void:
	is_mouse_over = false
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null


func _on_pressed() -> void:
	print("Pen click !")
	position.y += 10
	await get_tree().create_timer(0.1).timeout
	position.y -= 10
	if main._verifobject("pen.tscn") == true:
		main.add_child(preload("res://scenes/phases/restitution.tscn").instantiate())
	else:
		pass
