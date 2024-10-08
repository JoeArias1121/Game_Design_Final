extends Node

var lvl = 0
@onready var score_label: Label = $ScoreLabel
@onready var game: Node2D = $".."

var p1 = preload("res://scenes/plat1.tscn")
var p2 = preload("res://scenes/plat2.tscn")

var platforms = [p1,p2]
 
func add_lvl():
	lvl += 1
	score_label.text = "Lvl."+ str(lvl)
	var plat = platforms[0].instantiate()
	add_child(plat)
