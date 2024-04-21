extends Node

var currentLevel = 0

var L1 = "res://Levels/L1.tscn"
var L2 = "res://Levels/L2.tscn"
var L3 = "res://Levels/L3.tscn"
var L4 = "res://Levels/L4.tscn"
var L5 = "res://Levels/L5.tscn"
var L6 = "res://Levels/L6.tscn"
var L7 = "res://Levels/L7.tscn"
var L8 = "res://Levels/L8.tscn"

var levels = [L1,L2,L3,L4,L5,L6,L7,L8]
var tip = load("res://Tip.gd")

var components = [0,0,1,1,1,1,1,1,1]
var activeComponents = 0

func NextScene():
	currentLevel += 1
	activeComponents = 0
	Toggles.Reset()
	tip.Reset()
	get_tree().change_scene_to_file(levels[currentLevel])
