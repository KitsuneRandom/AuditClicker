extends Node2D

var papers
var ppc
var timeLeft
var statCadre
var statRecolte
var statAnalyse
var statRedaction
var cursor = preload("res://assets/cursor.png")
var upgrades_level = {}
var credits


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ready")
	papers = 0
	ppc = 1
	statCadre = 1
	statRecolte = 1
	statAnalyse = 1
	statRedaction = 1
	timeLeft = 300 #5 minutes
	_updatescoredisplay()
	upgrades_level = {
		"redaction": 0,
		"relation": 0,
		"organisation": 0,
		"logique": 0,
		"technique": 0,
		"jugement": 0
	}
	credits = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_updatescoredisplay()
	if(timeLeft <= 0):
		$GameTimeCountdown.stop()
		add_child(preload("res://scenes/game_menus/end_menu.tscn").instantiate())
	if(papers >= 50):
		_increasePpc()
	
	pass

func _getpapers() -> int:
	return papers
	
func _getPpc() -> int:
	return ppc

func _getUpgrades_level() -> Dictionary:
	return upgrades_level

func _getCurCredits() -> int:
	return credits

func _increasepapers() -> void:
	papers += 1*ppc
	credits += 1*ppc

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

func _updatescoredisplay():
	$ScoreDisplayer.text = "📄 " + str(papers) + " 📑 " + str(ppc) + " ppc ⏱️ " + _printFormatedTime(timeLeft)
