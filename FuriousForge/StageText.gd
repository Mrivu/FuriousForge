extends TextEdit

var global = null

func _ready():
	global = preload("res://Global.gd")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	self.text = str(global.components[global.currentLevel])
