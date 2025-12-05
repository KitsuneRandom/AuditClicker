extends Node2D

var papers
var ppc
var timeLeft
var statCadre
var statRecolte
var statAnalyse
var statRedaction
var upgrades_level
var score
var credits
var txtprep = "Préparation : Organisez votre audit d'entreprise."
var txtinve = "Investigation : L'entreprise vous a envoyé ses documents."
var txtanal = "Analyse : Concentrez vous sur les documents que vous avez récupéré."
var txtrest = "Restitution : Rédigez le rapport de votre audit."
var txtsuiv = "Suivi : L'entreprise vous fait part de quelques problèmes persistants."
enum phases {PREPARATION, INVESTIGATION, ANALYSE, RESTITUTION, SUIVI}
#Description des phases : [0: "nom", 1: "objet à cliquer", 2: "amélioration associée", 3: "message à afficher"]
var phases_desc = {
	phases.PREPARATION: ["Préparation", "paper.tscn", "organisation", txtprep],
	phases.INVESTIGATION: ["Investigation", "letter.tscn", "jugement", txtinve],
	phases.ANALYSE: ["Analyse", "glass.tscn", "logique", txtanal],
	phases.RESTITUTION: ["Restitution", "pen.tscn", "redaction", txtrest],
	phases.SUIVI: ["Suivi", "letter2.tscn", "relation", txtsuiv]
}
var current_phase
var object_to_click : String


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
	score = 0
	credits = 0
	current_phase = phases.PREPARATION
	object_to_click = phases_desc[current_phase][1]
	$letterInvest.get_node("AnimatedSprite2D")._setnumber(4)
	$letterSuivi1.get_node("AnimatedSprite2D")._setnumber(5)
	$letterSuivi2.get_node("AnimatedSprite2D")._setnumber(6)
	$letterSuivi3.get_node("AnimatedSprite2D")._setnumber(7)
	$letterSuivi4.get_node("AnimatedSprite2D")._setnumber(8)
	$letterSuivi5.get_node("AnimatedSprite2D")._setnumber(9)
	$letterSuivi6.get_node("AnimatedSprite2D")._setnumber(10)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_updatescoredisplay()
	if(timeLeft <= 0):
		$GameTimeCountdown.stop()
		add_child(preload("res://scenes/game_menus/end_menu.tscn").instantiate())
	if(papers >= 50):
		_increasePpc()
	$messages.text = _getPhaseMessage(_getCurrentPhase())
	pass

func _getpapers() -> int:
	return papers
	
func _getPpc() -> int:
	return ppc

func _getUpgrades_level() -> Dictionary:
	return upgrades_level

func _getCurCredits() -> int:
	return credits

func _getCurrentPhase() -> phases:
	return current_phase

func _getPhaseMessage(phase):
	return phases_desc[phase][3]

func _nextPhase(phase):
	score += 1
	if (phase == phases.PREPARATION):
		$letterInvest.visible = true
		return phases.INVESTIGATION
	if (phase == phases.INVESTIGATION):
		$letterInvest.visible = false
		$glass.visible = true
		return phases.ANALYSE
	if (phase == phases.ANALYSE):
		$glass.visible = false
		return phases.RESTITUTION
	if (phase == phases.RESTITUTION):
		$letterSuivi1.visible = true
		$letterSuivi2.visible = true
		$letterSuivi3.visible = true
		$letterSuivi4.visible = true
		$letterSuivi5.visible = true
		$letterSuivi6.visible = true
		return phases.SUIVI
	if (phase == phases.SUIVI):
		$letterSuivi1.visible = false
		$letterSuivi2.visible = false
		$letterSuivi3.visible = false
		$letterSuivi4.visible = false
		$letterSuivi5.visible = false
		$letterSuivi6.visible = false
		_finishaudit()
		return phases.PREPARATION
	return phase

func _updateobjecttoclick() -> void:
		object_to_click = phases_desc[current_phase][1]


func _updateupgrades(newupgrades, newcredits) -> void:
	upgrades_level = newupgrades
	credits = newcredits

func _finishaudit():
	credits += 10
	score += 10

func _increasepapers() -> void:
	papers += 1*ppc
	
func _finishphase() -> void:
	current_phase = _nextPhase(current_phase)
	_updateobjecttoclick()

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
	$ScoreDisplayer.text = object_to_click + " / Score : " + str(score) + " 📄 " + str(papers) + " 📑 " + str(ppc) + " ppc ⏱️ " + _printFormatedTime(timeLeft)

func _verifobject(object) -> bool:
	if object != object_to_click:
		return false
	return true
