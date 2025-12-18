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
var txtprep = "Préparation : Planifiez votre nouvel audit."
var txtinve = "Investigation : Vérifiez les documents envoyés par l'entreprise."
var txtanal = "Analyse : Analysez la situation financière de l'entreprise."
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
var phase_steps = {
	"preparation": 4,
	"investigation": 1,
	"analyse": 2,
	"restitution": 1,
	"suivi": 6
}
var phase_steps_initial_duration = {
	"preparation": 3.0,
	"investigation": 3.0,
	"analyse": 3.0,
	"restitution": 2.0,
	"suivi": 3.0
}
var phase_steps_duration = {
	"preparation": 3.0,
	"investigation": 3.0,
	"analyse": 3.0,
	"restitution": 2.0,
	"suivi": 3.0
}
var current_phase_progression
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
	current_phase_progression = 0
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
	if(timeLeft <= 30):
		if(timeLeft%2 == 0):
			$TimeDisplayer.text = "⏱️ : "
		else:
			$TimeDisplayer.text = "⏱️ : " + _printFormatedTime(timeLeft)
	if(timeLeft <= 0):
		$GameTimeCountdown.stop()
		$TimeDisplayer.visible = true
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

func _getPhaseStepDuration(phase: String):
	if(phase_steps_duration[phase]):
		return phase_steps_duration[phase]
	return 2.0

func _nextPhase(phase):
	score += 1
	if (phase == phases.PREPARATION):
		phase_steps_duration["preparation"] = phase_steps_initial_duration["preparation"]*(1.0-upgrades_level["organisation"]*0.15)
		$letterInvest.visible = true
		return phases.INVESTIGATION
	if (phase == phases.INVESTIGATION):
		phase_steps_duration["investigation"] = phase_steps_initial_duration["investigation"]*(1.0-upgrades_level["jugement"]*0.15)
		$letterInvest.visible = false
		$glass.visible = true
		return phases.ANALYSE
	if (phase == phases.ANALYSE):
		phase_steps_duration["analyse"] = phase_steps_initial_duration["analyse"]*(1.0-upgrades_level["logique"]*0.15)
		$glass.visible = false
		$pen.visible = true
		return phases.RESTITUTION
	if (phase == phases.RESTITUTION):
		phase_steps_duration["restitution"] = phase_steps_initial_duration["restitution"]*(1.0-upgrades_level["redaction"]*0.15)
		var letterstoshow = 6-upgrades_level["relation"]
		for i in range(1, letterstoshow + 1):
			var letter = get_node("letterSuivi%d" % i)
			letter.visible = true
		phase_steps["suivi"] = letterstoshow
		return phases.SUIVI
	if (phase == phases.SUIVI):
		phase_steps_duration["suivi"] = phase_steps_initial_duration["suivi"]*(1.0-upgrades_level["relation"]*0.15)
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

func _continuephase(phase: String) -> void:
	current_phase_progression += 1
	print("Progression de la phase en cours: " + str(current_phase_progression) + "/" + str(phase_steps[phase]))
	if(current_phase_progression/phase_steps[phase] == 1):
		print("Phase effectuée à 100% ... Passage à la phase suivante")
		_finishphase()
	elif(current_phase_progression/phase_steps[phase] > 1):
		print("erreur dans la progression (>1)")

func _finishphase() -> void:
	current_phase_progression = 0
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
	$ScoreDisplayer.text = "Score : " + str(score)
	$TimeDisplayer.text = "⏱️ : " + _printFormatedTime(timeLeft)
	$CreditDisplayer.text = "💰 : " + str(credits)

func _verifobject(object) -> bool:
	if object != object_to_click:
		return false
	return true


func _vendre_voiture():
	credits += 10
	get_node("car").visible = false

func _buy_car():
	get_node("car").visible = true
