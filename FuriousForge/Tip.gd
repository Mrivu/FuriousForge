extends Sprite2D

var pCol = null

func _ready():
	pCol = get_node("../CollisionShape2D")
	self.hide()

func _process(delta):
	pass

func _on_anvil_area_body_entered(pCol):
	print("wow")
	self.show()

func _on_anvil_area_body_exited(pCol):
	self.hide()
