extends Node2D

var clicks
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ready")
	clicks = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _getClicks() -> int:
	return clicks

func _increaseClicks() -> void:
	clicks += 1

func _printClicks() -> String:
	return str(clicks)
