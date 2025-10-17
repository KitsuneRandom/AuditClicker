extends Node2D

var clicks
var ppc

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ready")
	clicks = 0
	ppc = 1
	_updatescoredisplay()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(clicks >= 50):
		_increasePpc()
	pass

func _getClicks() -> int:
	return clicks
	
func _getPpc() -> int:
	return ppc

func _increaseClicks() -> void:
	clicks += 1*ppc
	_updatescoredisplay()
	
func _increasePpc() -> void:
	ppc = (clicks/50)+ 1

func _printClicks() -> String:
	return str(clicks)

func _printPpc() -> String:
	return str(ppc)

func _updatescoredisplay():
	$ScoreDisplayer.text = "📄 " + str(clicks) + " 📑 " + str(ppc) + " ppc"
