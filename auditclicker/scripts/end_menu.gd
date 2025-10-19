extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self_modulate = Color(0,0,0,0.5)
	print(get_parent())
	$Control/ResultsValue.text = str(get_node("/root/TheGame")._getpapers()) + " points"

func _changeText(text: String) -> void:
	$Control/ResultsTitle.text = text
	$Control/ResultsTitle.position.x = ($Control/ResultsTitle.get_parent().size.x - $Control/ResultsTitle.size.x) / 2
	$Control/ResultsValue.text = ""
