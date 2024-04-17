extends Sprite2D

var onComponents = 0
var on = preload("res://Forges/ForgeOn.png")
var off = preload("res://Forges/ForgeOff.png")

func _ready():
	self.texture = off

func _process(delta):
	if onComponents <= 0:
		self.texture = on
