extends Sprite2D

var On = preload("res://Togglers/ChainOn.png")
var Off = preload("res://Togglers/ChainOff.png")

func Ready():
	self.texture = Off

func _physics_process(delta):
	if Toggles.Tog1On:
		self.texture = On
