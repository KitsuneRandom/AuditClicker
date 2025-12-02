extends AnimatedSprite2D

var tooltip
var main
var clicks
var buffed

func _ready() -> void:
	main = get_parent().get_parent()
	buffed = false
	clicks = 0
	play("normal")
	stop()
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
	if (clicks == 0):
		_oiia1()
		return
	if (clicks == 1):
		_oiia2()
		return
	if (clicks == 2):
		_oiia3()
		return
	if (clicks == 3):
		_oiia4()
		return
	if (clicks == 4):
		_oiia5()
		return
	if (clicks == 5):
		_oiia6()
		if (!buffed):
			_buff()
		clicks = -1
		return


func _oiia1() -> void:
	print("oiia oiia")
	play("oiia")
	$"../Oiia".play()
	$".".modulate = Color(1, 1, 1)
	await get_tree().create_timer(2).timeout
	play("normal")
	stop()

func _oiia2() -> void:
	print("oiia oiia")
	play("oiia", 0.75)
	$"../Oiia2".play()
	$".".modulate = Color(1, 1, 1)
	await get_tree().create_timer(2.5).timeout
	play("normal")
	stop()

func _oiia3() -> void:
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

func _oiia4() -> void:
	print("oiia oiia")
	play("oiia")
	$"../OiiaRemix".play()
	$".".modulate = Color(0, 1, 0)
	main.modulate = Color(1, 1, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 1, 0)
	main.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 0, 0)
	main.modulate = Color(1, 0, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 0, 1)
	main.modulate = Color(0, 1, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(0, 1, 1)
	main.modulate = Color(0, 0, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(0, 0, 1)
	main.modulate = Color(0, 1, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 1, 1)
	main.modulate = Color(1, 1, 1)
	play("normal")
	stop()

func _oiia5() -> void:
	print("oiia oiia")
	play("white_oiia")
	$"../OiiaRemix".play()
	$".".modulate = Color(0, 1, 0)
	main.modulate = Color(1, 1, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 1, 0)
	main.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 0, 0)
	main.modulate = Color(1, 0, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 0, 1)
	main.modulate = Color(0, 1, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(0, 1, 1)
	main.modulate = Color(0, 0, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(0, 0, 1)
	main.modulate = Color(0, 1, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 1, 1)
	main.modulate = Color(1, 1, 1)
	play("normal")
	stop()

func _oiia6() -> void:
	print("oiia oiia")
	play("white_oiia")
	$"../OiiaRemix".play()
	main.modulate = Color(0, 0, 0)
	for i in range(0, 30):
		await get_tree().create_timer(0.1).timeout
		$"..".position.x += 5.4
		$"..".position.y += 1
	main.modulate = Color(1, 1, 1)
	play("normal")
	await get_tree().create_timer(1).timeout
	$"../Oiia".play()
	play("oiia")
	await get_tree().create_timer(2).timeout
	$"../Explode".play()
	play("explode")
	await get_tree().create_timer(0.6).timeout
	stop()
	queue_free()

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
