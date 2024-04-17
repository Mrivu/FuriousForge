extends Sprite2D

var pCol = null
var atForge = false

func _ready():
	pCol = get_node("../CollisionShape2D")
	self.hide()

func _process(delta):
	pass

func _on_anvil_area_body_entered(pCol):
	atForge = true
	print("wow")
	self.show()

func _on_anvil_area_body_exited(pCol):
	atForge = false
	self.hide()
