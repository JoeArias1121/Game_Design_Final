extends Node

@onready var score_label: Label = $ScoreLabel
@onready var game: Node2D = $".."

var p1 = preload("res://scenes/plat1.tscn")
var p2 = preload("res://scenes/plat2.tscn")
var p3 = preload("res://scenes/plat3.tscn")
var p4 = preload("res://scenes/plat4.tscn")
var p5 = preload("res://scenes/plat5.tscn")
var p6 = preload("res://scenes/plat6.tscn")
var p7 = preload("res://scenes/plat7.tscn")
var p8 = preload("res://scenes/plat8.tscn")
var p9 = preload("res://scenes/plat9.tscn")
var p10 = preload("res://scenes/plat10.tscn")
var p11 = preload("res://scenes/plat11.tscn")
var p12 = preload("res://scenes/plat12.tscn")
var ro = preload("res://scenes/rock.tscn")
var so = preload("res://scenes/soul_stone.tscn")

var platforms = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]
 
func add_lvl():
	score_label.text = "Lvl." + str(Global.ghostAddLevel())
	var plat = platforms[randi() % 12].instantiate()
	if 75 > randi() % 100:
		var soul = so.instantiate()
		soul.position = Vector2(getX(),-382)
		add_child(soul)
	plat.position = Vector2(plat.position.x, -352)
	add_child(plat)

func _physics_process(delta: float) -> void:
	Global.rockTimer += delta
	if Global.rockTimer >= Global.rockFreq:
		var rock = ro.instantiate()
		rock.position = Vector2(getX(),-382)
		add_child(rock)
		Global.rockTimer = 0
	
func getX():
	var x = 256 - randi() % 512
	return x
