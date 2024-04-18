extends Sprite2D

var on = preload("res://Forges/ForgeOn.png")
var off = preload("res://Forges/ForgeOff.png")

func _ready():
	self.texture = off

func _physics_process(delta):
	if Global.components[Global.currentLevel] <= 0:
		self.texture = on
	else:
		self.texture = off
