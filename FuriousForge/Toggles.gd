extends Node

var TogglePos1 = Vector2.ZERO
var Tog1On = false
var TogglePos2 = Vector2.ZERO
var Tog2Off = false

func _ready():
	TogglePos1 = get_node("/root/Main/Toggle1Area").position
	# +35 y for on pos