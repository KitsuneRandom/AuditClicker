extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self_modulate = Color(0,0,0,0.5)
	$ResultsValue.text = str(get_parent()._getpapers()) + " points"
