extends Node2D
## Scène principale
##
## La scène principale gère les variables globales du jeu :
## Temps restant, crédits, score, niveau d'améliorations, phases, fin du jeu [/br]
## On y retrouve tout le déroulement du jeu

## Temps restant
var timeLeft

## Niveau des améliorations, dictionnaire {String : int}
var upgrades_level

## Score actuel
var score

## Nombre de crédits possédés
var credits

# Textes par défaut à afficher sur la scène principale
var txtprep = "Préparation : Planifiez votre nouvel audit."
var txtinve = "Investigation : Vérifiez les documents envoyés par l'entreprise."
var txtanal = "Analyse : Analysez la situation financière de l'entreprise."
var txtrest = "Restitution : Rédigez le rapport de votre audit."
var txtsuiv = "Suivi : L'entreprise vous fait part de quelques problèmes persistants."

## Liste des tâches
enum phases {PREPARATION, INVESTIGATION, ANALYSE, RESTITUTION, SUIVI}
#Description des phases : [0: "nom", 1: "objet à cliquer", 2: "amélioration associée", 3: "message à afficher"]

## Description des phases, dictionnaire {enum phases : tableau [String]}
var phases_desc = {
	phases.PREPARATION: ["Préparation", "paper.tscn", "organisation", txtprep],
	phases.INVESTIGATION: ["Investigation", "letter.tscn", "jugement", txtinve],
	phases.ANALYSE: ["Analyse", "glass.tscn", "logique", txtanal],
	phases.RESTITUTION: ["Restitution", "pen.tscn", "redaction", txtrest],
	phases.SUIVI: ["Suivi", "letter2.tscn", "relation", txtsuiv]
}

## Phase actuelle, enum phases
var current_phase

## Nombre d'étape par phase, dictionnaire {String : int}
var phase_steps = {
	"preparation": 4,
	"investigation": 1,
	"analyse": 2,
	"restitution": 1,
	"suivi": 6
}

## Durée totale des phases au départ
var phase_steps_initial_duration = {
	"preparation": 3.0,
	"investigation": 3.0,
	"analyse": 3.0,
	"restitution": 2.0,
	"suivi": 3.0
}

## Durée des phases après application du niveau d'amélioration
var phase_steps_duration = {
	"preparation": 3.0,
	"investigation": 3.0,
	"analyse": 3.0,
	"restitution": 2.0,
	"suivi": 3.0
}

## Étape actuelle de la phase
var current_phase_progression

## Objet à cliquer pour passer la phase actuelle
var object_to_click : String

## Nombre d'audits réalisés
var nbaudits

## Booléen permettant de savoir si la partie est déjà finie ou non
var finished = false

## Fonction appelée lorsque la scène est instanciée
##
## Initialise toutes les variables
func _ready() -> void:
	print("Ready")
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
	$messages.text = str(phases_desc[current_phase][3])
	current_phase_progression = 0
	object_to_click = phases_desc[current_phase][1]
	$letterInvest.get_node("AnimatedSprite2D")._setnumber(4)
	$letterSuivi1.get_node("AnimatedSprite2D")._setnumber(5)
	$letterSuivi2.get_node("AnimatedSprite2D")._setnumber(6)
	$letterSuivi3.get_node("AnimatedSprite2D")._setnumber(7)
	$letterSuivi4.get_node("AnimatedSprite2D")._setnumber(8)
	$letterSuivi5.get_node("AnimatedSprite2D")._setnumber(9)
	$letterSuivi6.get_node("AnimatedSprite2D")._setnumber(10)
	nbaudits = 0

## Fonction appelée à chaque frame
##
## Vérifie la fin du jeu
func _process(delta: float) -> void:
	_updatescoredisplay()
	if(timeLeft <= 30):
		if(timeLeft%2 == 0):
			$TimeDisplayer.text = "⏱️ : "
		else:
			$TimeDisplayer.text = "⏱️ : " + _printFormatedTime(timeLeft)
	if(timeLeft <= 0 and !finished):
		$GameTimeCountdown.stop()
		$TimeDisplayer.visible = true
		add_child(preload("res://scenes/game_menus/end_menu.tscn").instantiate())
		finished = true

func _getUpgrades_level() -> Dictionary:
	return upgrades_level

func _getCurCredits() -> int:
	return credits

func _getCurrentPhase() -> phases:
	return current_phase

func _getPhaseMessage(phase):
	return phases_desc[phase][3]

func _getNbAudits():
	return nbaudits

func _getscore():
	return score

func _getPhaseStepDuration(phase: String):
	if(phase_steps_duration[phase]):
		return phase_steps_duration[phase]
	return 2.0

## Fonction permettant de passer à la phase suivante et d'afficher
## les informations nécessaires sur la scène principale et appelle 
## _finishaudit() si c'était la dernière phase
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

## Met à jour l'objet qu'il faut cliquer
func _updateobjecttoclick() -> void:
		object_to_click = phases_desc[current_phase][1]

## Met à jour les niveaux d'amélioration (appelé dans upgrades_menu)
func _updateupgrades(newupgrades, newcredits) -> void:
	upgrades_level = newupgrades
	credits = newcredits

## Mise à jour des variables après la fin d'un audit
func _finishaudit():
	credits += 10
	score += 10
	nbaudits += 1

## Réalise une étape de la phase et appelle _finishphase() si c'était la dernière
func _continuephase(phase: String) -> void:
	current_phase_progression += 1
	print("Progression de la phase en cours: " + str(current_phase_progression) + "/" + str(phase_steps[phase]))
	if(current_phase_progression/phase_steps[phase] == 1):
		print("Phase effectuée à 100% ... Passage à la phase suivante")
		_finishphase()
	elif(current_phase_progression/phase_steps[phase] > 1):
		print("erreur dans la progression (>1)")

## Passe à la phase suivante
func _finishphase() -> void:
	current_phase_progression = 0
	current_phase = _nextPhase(current_phase)
	$messages.text = str(phases_desc[current_phase][3])
	_updateobjecttoclick()

## Mise à jour du temps restant
func _on_game_time_countdown_timeout() -> void:
	timeLeft -= 1

## Affiche le temps de façon compréhensible par l'utilisateur
func _printFormatedTime(time) -> String:
	var minutes = time / 60
	var seconds = time % 60
	if(seconds < 10):
		seconds = "0" + str(seconds)
	return str(minutes) + ":" + str(seconds)

## Met à jour l'affichage du score, des crédits et du temps restant
## (appelé à chaque frame)
func _updatescoredisplay():
	$ScoreDisplayer.text = "Score : " + str(score)
	$TimeDisplayer.text = "⏱️ : " + _printFormatedTime(timeLeft)
	$CreditDisplayer.text = "💰 : " + str(credits)

## Vérifie si l'objet cliqué correspond à celui qui doit être cliqué
func _verifobject(object) -> bool:
	if object != object_to_click:
		return false
	return true

## Cache la voiture et ajoute des crédits
func _vendre_voiture():
	credits += 10
	get_node("car").visible = false

## Réaffiche la voiture
func _buy_car():
	get_node("car").visible = true
