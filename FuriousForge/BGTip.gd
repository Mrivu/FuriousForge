extends RichTextLabel

var forgeOff = "TIP: The FORGE isn't on yet, activate all components"
var tutorialWalk = "TIP: Walk with A and S. Jump with space."
var TipTimer = null

func _ready():
	self.text = ""
	TipTimer = get_node("TipTimer")

func ChangeTip(tip):
	if tip == "forgeOff":
		self.text = forgeOff
		TipTimer.start()

func _on_tip_timer_timeout():
	TipTimer.stop()
	self.text = ""
