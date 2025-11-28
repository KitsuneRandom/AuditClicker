extends Node2D

@export var displayed_text: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background.size = Vector2(10, 35)
	$Background/Label.visible_ratio = 0
	$Background/Label.text = displayed_text
	for i in range(displayed_text.length()):
		$Background.size += Vector2(10, 0)
		$Background/Label.visible_ratio = i / 100.0
		await get_tree().create_timer(0.025).timeout 
	$Background/Label.visible_ratio = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var end_pos = get_global_mouse_position()
	end_pos -= Vector2(0, -30)
	position = end_pos
	pass
