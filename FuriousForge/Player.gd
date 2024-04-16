extends CharacterBody2D


var pSprite = null
var DDTimer = null
var DText = null

func _ready():
	pSprite = get_node("pSprite")
	DDTimer = get_node("DrinkDuration")
	DText = get_node("../DText")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = 900
var Friction = 0.7
var right = true
var drinking = false
var drinkTime = 0
var drunk = false

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
	
	if Input.is_action_just_pressed("DRINK") and is_on_floor():
		drinking = true
		DDTimer.start()
		

	var direction = Input.get_axis("A", "S")
	if Input.is_action_pressed("A"):
		right = false
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
