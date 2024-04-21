extends Sprite2D

var OnC = preload("res://Togglers/ChainOn.png")
var OffC = preload("res://Togglers/ChainOff.png")
var OnL = preload("res://Togglers/LeverOn.png")
var OffL = preload("res://Togglers/LeverOff.png")

func Ready():
	if self.name == "Toggle1":
		self.texture = OffC
	elif self.name == "Toggle2":
		self.texture = OffL

func _physics_process(delta):
	if self.name == "Toggle1":
		if Toggles.Tog1On:
			self.texture = OnC
		else:
			self.texture = OffC
	elif self.name == "Toggle2":
		if Toggles.Tog2On:
			self.texture = OnL
		else:
			self.texture = OffL
