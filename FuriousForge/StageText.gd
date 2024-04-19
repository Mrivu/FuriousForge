extends TextEdit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	self.text = "Stage: " + str(Global.currentLevel+1)
