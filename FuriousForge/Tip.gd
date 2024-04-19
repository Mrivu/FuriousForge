extends Sprite2D

var pCol = null
var atForge = false
var atToggle1 = false
var atToggle2 = false
var player = null

var atLoc = null

func _ready():
	pCol = get_node("../CollisionShape2D")
	player = get_node("../../Player")
	self.hide()

func _process(delta):
	if atToggle1 and player.is_on_floor():
		self.hide()
	elif atToggle1:
		self.show()


func _on_anvil_area_body_entered(pCol):
	atForge = true
	self.show()

func _on_anvil_area_body_exited(pCol):
	atForge = false
	self.hide()


func _on_toggle_1_area_body_entered(pCol):
	if !player.is_on_floor():
		atToggle1 = true
		self.show()

func _on_toggle_1_area_body_exited(pCol):
	atToggle1 = false
	self.hide()


func _on_toggle_2_area_body_entered(pCol):
	atToggle2 = true
	self.show()

func _on_toggle_2_area_body_exited(pCol):
	atToggle2 = false
	self.hide()
