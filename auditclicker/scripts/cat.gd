extends AnimatedSprite2D
## Script de l'objet cliquable "chat".
##
## Le chat sert principalement de décoration. [/br]
## Lorsqu'on clique dessus, un son est joué et une animation se lance.
## Après quelques clicks dessus, un bonus est gagné.
##
## Note : un TextureButton aurait été plus approprié pour répondre
## au besoin mais nous avons eu un mauvais choix de conception au
## début du projet.

## Tooltip qui apparaît lorsque la souris passe sur le chat.
var tooltip

## Variable représentant l'écran principal du jeu.
var main

## Compteur de clicks.
var clicks

## Booléen servant à savoir si le bonus a déjà été donné.
var buffed

## Fonction appelée à la création du noeud.
##
## Initialise les variables main, buffed et clicks. Joue l'animation
## "normal" pour s'assurer que le chat ait l'apparence souhaitée
func _ready() -> void:
	main = get_parent().get_parent()
	buffed = false
	clicks = 0
	play("normal")
	stop()

## Fonction appelée lorsque le joueur clique sur le chat.
##
## Si une animation est en cours, ne fait rien.[br]
## Sinon, déplace légèrement le chat pour créer
## un effet de click puis appelle la fonction _trybuff().
##
## @param viewport Node : noeud concerné par l'évenement
## @param event InputEvent : type d'évenement
## @param shape_idx int : index du CollisionShape concerné
func _on_cat_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (is_playing()):
		return
	if event is InputEventMouseButton and event.pressed:
		print("Cat click ! (clicks = " + str(clicks) + ")")
		position.y += 10
		await get_tree().create_timer(0.1).timeout
		position.y -= 10
		_trybuff()
		clicks += 1

## Détermine l'action à réaliser en fonction du nombre de clicks sur le chat.
##
## Appelle une fonction _oiia<i>() en fonction du nombre de clicks.
## Au bout du 6e click, appelle la fonction _buff().
func _trybuff() -> void:
	if (clicks == 0):
		_oiia1()
		return
	if (clicks == 1):
		_oiia2()
		return
	if (clicks == 2):
		_oiia3()
		return
	if (clicks == 3):
		_oiia4()
		return
	if (clicks == 4):
		_oiia5()
		return
	if (clicks == 5):
		_oiia6()
		if (!buffed):
			_buff()
		clicks = -1
		return

## Joue l'animation "oiia" et le son Oiia.
func _oiia1() -> void:
	print("oiia oiia")
	play("oiia")
	$"../Oiia".play()
	$".".modulate = Color(1, 1, 1)
	await get_tree().create_timer(2).timeout
	play("normal")
	stop()

## Joue l'animation "oiia" et le son Oiia2.
func _oiia2() -> void:
	print("oiia oiia")
	play("oiia", 0.75)
	$"../Oiia2".play()
	$".".modulate = Color(1, 1, 1)
	await get_tree().create_timer(2.5).timeout
	play("normal")
	stop()

## Joue l'animation "oiia" et le son OiiaRemix, et change le chat de couleur.
func _oiia3() -> void:
	print("oiia oiia")
	play("oiia")
	$"../OiiaRemix".play()
	$".".modulate = Color(0, 1, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 1, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 0, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(0, 1, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(0, 0, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 1, 1)
	play("normal")
	stop()

## Joue l'animation "oiia" et le son OiiaRemix,
## et change le chat et le main de couleur.
func _oiia4() -> void:
	print("oiia oiia")
	play("oiia")
	$"../OiiaRemix".play()
	$".".modulate = Color(0, 1, 0)
	main.modulate = Color(1, 1, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 1, 0)
	main.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 0, 0)
	main.modulate = Color(1, 0, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 0, 1)
	main.modulate = Color(0, 1, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(0, 1, 1)
	main.modulate = Color(0, 0, 1)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(0, 0, 1)
	main.modulate = Color(0, 1, 0)
	await get_tree().create_timer(0.5).timeout
	$".".modulate = Color(1, 1, 1)
	main.modulate = Color(1, 1, 1)
	play("normal")
	stop()

## Joue l'animation "white_oiia" et le son OiiaRemix,
## et change le main de couleur en faisant monter légèrement le chat.
func _oiia5() -> void:
	print("oiia oiia")
	$".".modulate = Color(1, 1, 1)
	play("white_oiia")
	$"../OiiaRemix".play()
	main.modulate = Color(1, 1, 0)
	for i in range(0, 5):
		await get_tree().create_timer(0.1).timeout
		$"..".position.y -= 2
	main.modulate = Color(1, 0, 0)
	for i in range(0, 5):
		await get_tree().create_timer(0.1).timeout
		$"..".position.y -= 2
	main.modulate = Color(1, 0, 1)
	for i in range(0, 5):
		await get_tree().create_timer(0.1).timeout
		$"..".position.y -= 2
	main.modulate = Color(0, 1, 1)
	for i in range(0, 5):
		await get_tree().create_timer(0.1).timeout
		$"..".position.y -= 2
	main.modulate = Color(0, 0, 1)
	for i in range(0, 5):
		await get_tree().create_timer(0.1).timeout
		$"..".position.y -= 2
	main.modulate = Color(0, 1, 0)
	for i in range(0, 5):
		await get_tree().create_timer(0.1).timeout
		$"..".position.y -= 2
	$".".modulate = Color(1, 1, 1)
	main.modulate = Color(1, 1, 1)
	play("normal")
	$"..".position.y = -24
	stop()

## Joue l'animation "white_oiia" et le son OiiaRemix, change le main de couleur,
## Déplace le chat au centre de l'écran puis le fait exploser.
func _oiia6() -> void:
	$"..".z_index += 10
	print("oiia oiia")
	$".".modulate = Color(1, 1, 1)
	play("white_oiia")
	$"../OiiaRemix".play()
	var nuancegris: float
	for i in range(0, 30):
		await get_tree().create_timer(0.1).timeout
		$"..".position.x += 5.4
		$"..".position.y += 1
		nuancegris = 1 - float(i)/30
		main.modulate = Color(nuancegris, nuancegris, nuancegris)
	main.modulate = Color(1, 1, 1)
	play("normal")
	await get_tree().create_timer(1).timeout
	$"../Oiia".play()
	play("oiia")
	await get_tree().create_timer(2).timeout
	$"../Explode".play()
	play("explode")
	await get_tree().create_timer(0.6).timeout
	stop()
	$"..".z_index -= 10
	queue_free()

## Met buffed à true
func _buff() -> void:
	buffed = true

## Fonction appelée lorsque le joueur passe la souris sur le chat
##
## Change la couleur et affiche la tooltip. Permet au joueur de
## comprendre qu'il s'agit d'un élément cliquable.
func _on_cat_mouse_entered() -> void:
	if (is_playing()):
		return
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Chat :D"
	print("Affichage de la tooltip etape chat")
	main.add_child(tooltip)

## Fonction appelée lorsque la souris quitte le chat
##
## Remet la couleur à la couleur d'origine et supprime la tooltip.
func _on_cat_mouse_exited() -> void:
	if (is_playing()):
		if tooltip:
			tooltip.queue_free()
			tooltip = null
		return
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null
