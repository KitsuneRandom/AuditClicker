extends AnimatedSprite2D

var tooltip
var main
var chance
var buffed

func _ready() -> void:
	main = get_parent().get_parent()
	buffed = false
	chance = 1
	pass # Replace with function body.

func _on_cat_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Cat click ! (chance = " + str(chance) + ")")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
		_trybuff()
		chance += 1

func _trybuff() -> void:
	if (chance >= 100):
		print("Le chat en a marre")
		queue_free()
	randomize()
	var rand = randi_range(1, 100)
	if (rand > chance):
		return
	if (chance >= 50):
		_oiiaRemix()
	else:
		_oiia()
	if (!buffed):
		_buff()

func _oiia() -> void:
	print("oiia oiia")
	play("oiia")
	$"../Oiia".play()
	await get_tree().create_timer(2).timeout
	stop()

func _oiiaRemix() -> void:
	print("oiia oiia")
	play("oiia", 0.50)
	$"../OiiaRemix".play()
	await get_tree().create_timer(2).timeout
	stop()

func _buff() -> void:
	pass

# Surbrillance des éléments
func _on_cat_mouse_entered() -> void:
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Chat :D"
	print("Affichage de la tooltip etape chat")
	main.add_child(tooltip)

func _on_cat_mouse_exited() -> void:
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
