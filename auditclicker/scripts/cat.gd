extends AnimatedSprite2D

var tooltip
var main
var clicks
var buffed

func _ready() -> void:
	main = get_parent().get_parent()
	buffed = false
	clicks = 1
	pass # Replace with function body.

func _on_cat_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (is_playing()):
		return
	if event is InputEventMouseButton and event.pressed:
		print("Cat click ! (clicks = " + str(clicks) + ")")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
		_trybuff()
		clicks += 1

func _trybuff() -> void:
	if (clicks >= 5):
		clicks = 0
	if (clicks >= 2):
		_oiiaRemix()
		if (!buffed):
			_buff()
	else:
		_oiia()


func _oiia() -> void:
	print("oiia oiia")
	play("oiia")
	$"../Oiia".play()
	$".".modulate = Color(1, 1, 1)
	await get_tree().create_timer(2).timeout
	play("normal")
	stop()

func _oiiaRemix() -> void:
	print("oiia oiia")
	play("oiia")
	$"../OiiaRemix".play()
	$".".modulate = Color(0, 1, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 1, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 0, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(0, 1, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(0, 0, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 1, 1)
	play("normal")
	stop()

func _buff() -> void:
	buffed = true

# Surbrillance des éléments
func _on_cat_mouse_entered() -> void:
	if (is_playing()):
		return
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Chat :D"
	print("Affichage de la tooltip etape chat")
	main.add_child(tooltip)

func _on_cat_mouse_exited() -> void:
	if (is_playing()):
		if tooltip:
			tooltip.queue_free()
			tooltip = null
		return
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
