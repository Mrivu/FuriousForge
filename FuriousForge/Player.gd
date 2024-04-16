extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = 900
var Friction = 0.1

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("A", "S")
	if Input.is_action_pressed("A"):
		if is_on_floor():
			velocity.x -= SPEED*delta*Friction
		else:
			velocity.x -= SPEED*delta
	elif Input.is_action_pressed("S"):
		if is_on_floor():
			velocity.x += SPEED*delta*Friction
		else:
			velocity.x += SPEED*delta
	else:
		velocity.x = velocity.x * 0.96
	move_and_slide()
