extends Node2D

var papers
var ppc
var timeLeft

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ready")
	papers = 0
	ppc = 1
	timeLeft = 600 #10 minutes
	_updatescoredisplay()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_updatescoredisplay()
	if(timeLeft <= 0):
		$GameTimeCountdown.stop()
		add_child(preload("res://scenes/end_menu.tscn").instantiate())
	if(papers >= 50):
		_increasePpc()
	
	pass

func _getpapers() -> int:
	return papers
	
func _getPpc() -> int:
	return ppc

func _increasepapers() -> void:
	papers += 1*ppc
	
func _increasePpc() -> void:
	ppc = (papers/50)+ 1

func _printpapers() -> String:
	return str(papers)

func _printPpc() -> String:
	return str(ppc)
	
func _on_game_time_countdown_timeout() -> void:
	timeLeft -= 1

func _printFormatedTime(time) -> String:
	var minutes = time / 60
	var seconds = time % 60
	if(seconds < 10):
		seconds = "0" + str(seconds)
	return str(minutes) + ":" + str(seconds)
	pass

func _updatescoredisplay():
	$ScoreDisplayer.text = "📄 " + str(papers) + " 📑 " + str(ppc) + " ppc ⏱️ " + _printFormatedTime(timeLeft)
