extends TextureButton
## Script de l'objet cliquable "stylo".
##
## Permet d'exécuter la phase RESTITUTION. [br]
## Le reste du temps, sert de décoration et peut être déplacé par le joueur.

## Tooltip qui apparaît lorsque la souris passe sur le stylo.
var tooltip

## Variable représentant l'écran principal du jeu.
var main

## Booléen qui vaut true lorsque la souris passe sur le stylo.
var is_mouse_over

## Booléen qui vaut true lorsque le stylo est en train d'être cliqué.
var isclicked = false

## Fonction appelée à la création du noeud.
##
## Initialise la variable main et déclare la fonction _input() comme 
## étant process, càd appelé toutes les frames.
func _ready() -> void:
	main = get_parent().get_parent()
	set_process_input(true)

## Fonction appelée à chaque frame.
##
## Si isclicked est à true, appelle la fonction _followmouse().
##
## @param delta float : temps écoulé entre chaque frame
func _process(delta: float) -> void:
	if isclicked:
		_followmouse()
	else:
		pass

## Permet de placer le stylo à l'emplacement du pointeur de souris
func _followmouse() -> void:
	get_parent().position = main.get_global_mouse_position()

## Fonction simulant une gravité permettant de faire tomber le stylo sur le
## bureau ou de le faire réapparaître si il tombe à côté
func _fall() -> void:
	var falltime = 20
	if get_parent().position.x < -252 or get_parent().position.x > 255 :
		falltime = 100
	if get_parent().position.y > 74 or get_parent().position.x < -252 or get_parent().position.x > 255 :
		for i in range(0, falltime):
			get_parent().position.y += 5
			await get_tree().create_timer(0.05).timeout
		get_parent().position.x = 57
		get_parent().position.y = 74
	while get_parent().position.y < 74:
		get_parent().position.y += 5
		await get_tree().create_timer(0.05).timeout

## Fonction appelée à chaque frame (voir _ready())
##
## Vérifie si une intéraction avec la souris a lieu.[br]
## Si oui et que l'intéraction est un click, met isclicked à true.[br]
## Si oui et que l'intéraction est un relachement du click, appelle
## la fonction _fall() et met isclicked à false.
##
## @param event InputEvent : type d'évenement
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and is_mouse_over:
			isclicked = true
		elif event.is_released() and isclicked:
			_fall()
			isclicked = false


## Fonction appelée lorsque le joueur passe la souris sur le stylo
##
## Change la couleur et affiche la tooltip. Permet au joueur de
## comprendre qu'il s'agit d'un élément cliquable.
func _on_pen_mouse_entered() -> void:
	is_mouse_over = true
	$".".modulate = Color(0.5, 0.7, 1)
	tooltip = preload("res://scenes/ui/tooltip.tscn").instantiate()
	tooltip.displayed_text = "Stylo"
	print("Affichage de la tooltip etape stylo")
	main.add_child(tooltip)


## Fonction appelée lorsque la souris quitte le stylo
##
## Remet la couleur à la couleur d'origine et supprime la tooltip.
func _on_pen_mouse_exited() -> void:
	is_mouse_over = false
	$".".modulate = Color(1, 1, 1)
	if tooltip:
		tooltip.queue_free()
		tooltip = null

## Fonction appelée lorsque le stylo est cliqué.
##
## Déplace légèrement le stylo pour créer un effet de click
## puis ajoute la scène restitution.tscn si c'est la bonne phase,
## ne fait rien sinon.
func _on_pressed() -> void:
	print("Pen click !")
	position.y += 10
	await get_tree().create_timer(0.1).timeout
	position.y -= 10
	if main._verifobject("pen.tscn") == true:
		main.add_child(preload("res://scenes/phases/restitution.tscn").instantiate())
	else:
		pass
