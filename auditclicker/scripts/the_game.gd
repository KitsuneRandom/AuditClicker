extends Node2D

var clicks = 0
var ppc = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ready")
	clicks = 0
	ppc = 0
	_updatescoredisplay()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _getClicks() -> int:
	return clicks

func _increaseClicks() -> void:
	clicks += 1
	_updatescoredisplay()

func _printClicks() -> String:
	return str(clicks)


func _updatescoredisplay():
	$Label.text = "📄 " + str(clicks) + " 📈 " + str(ppc) + " ppc"
