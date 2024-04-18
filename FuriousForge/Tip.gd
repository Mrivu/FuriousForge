extends Sprite2D

var pCol = null
var atForge = false
var atToggle = false
var player = null

func _ready():
	pCol = get_node("../CollisionShape2D")
	player = get_node("../../Player")
	self.hide()

func _process(delta):
	if atToggle and player.is_on_floor():
		self.hide()
	elif atToggle:
		self.show()


func _on_anvil_area_body_entered(pCol):
	atForge = true
	print("wow")
	self.show()

func _on_anvil_area_body_exited(pCol):
	atForge = false
	self.hide()


func _on_toggle_area_body_entered(body):
	if !player.is_on_floor():
		atToggle = true
		self.show()

func _on_toggle_area_body_exited(body):
	atToggle = false
	self.hide()
