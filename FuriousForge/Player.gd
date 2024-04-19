extends CharacterBody2D


var pSprite = null
var DDTimer = null
var DText = null
var pTip = null
var BGTip = null
var global = preload("res://Global.gd")

func _ready():
	pSprite = get_node("pSprite")
	DDTimer = get_node("DrinkDuration")
	DText = get_node("../DText")
	pTip = get_node("Tip")
	BGTip = get_node("../Bgff/BGTip")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = 900
var Friction = 0.7
var right = true
var drinking = false
var drinkTime = 0
var drunk = false
var hanging = false

func _physics_process(delta):
	DText.text = "Drunk : " + str(snapped(drinkTime, 0.1))
	if drinkTime > 0:
		drinkTime -= delta
	else:
		drunk = false
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("JUMP") and hanging:
		velocity.y = JUMP_VELOCITY
		hanging = false

	if Input.is_action_just_pressed("DRINK") and is_on_floor():
		drinking = true
		DDTimer.start()

	if Input.is_action_just_pressed("USE") and is_on_floor() and pTip.atForge:
		if Global.components[Global.currentLevel] > Global.activeComponents:
			BGTip.ChangeTip("forgeOff")
		else:
			print("Victory")
			Global.currentLevel += 1
			Global.activeComponents = 0

	if Input.is_action_just_pressed("USE") and !is_on_floor() and pTip.atToggle1:
		hanging = true
		self.position = Vector2(Toggles.TogglePos1.x,Toggles.TogglePos1.y + 35)
		if !Toggles.Tog1On:
			Toggles.Tog1On = true
			Global.activeComponents += 1

	if Input.is_action_just_pressed("USE") and is_on_floor() and pTip.atToggle2:
		if !Toggles.Tog2On:
			Toggles.Tog2On = true
			Global.activeComponents += 1

	var direction = Input.get_axis("A", "S")
	if Input.is_action_pressed("A"):
		right = false
		if !hanging:
			if is_on_floor():
				if drunk:
					velocity.x -= SPEED*delta*Friction
				else:
					position.x -= SPEED*Friction*0.01
			else:
				if drunk:
					velocity.x -= SPEED*delta
				else:
					position.x -= SPEED*0.01
	elif Input.is_action_pressed("S"):
		right = true
		if !hanging:
			if is_on_floor():
				if drunk:
					velocity.x += SPEED*delta*Friction
				else:
					position.x += SPEED*Friction*0.01
			else:
				if drunk:
					velocity.x += SPEED*delta
				else:
					position.x += SPEED*0.01
	else:
		velocity.x = velocity.x * 0.97
	ChangeSprite()
	if !hanging:
		move_and_slide()

func ChangeSprite():
	if not is_on_floor():
		if (right):
			pSprite.texture = pSprite.DJR
		else:
			pSprite.texture = pSprite.DJL
	else:
		if drinking:
			if (right):
				pSprite.texture = pSprite.DDR
			else:
				pSprite.texture = pSprite.DDL
		else:
			if (right):
				pSprite.texture = pSprite.DR
			else:
				pSprite.texture = pSprite.DL


func _on_drink_duration_timeout():
	drunk = true
	drinking = false
	drinkTime = 5.0
	DDTimer.stop()
