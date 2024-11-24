extends Node

@onready var score_label: Label = $ScoreLabel
@onready var coin_amount: Label = $CoinAmount

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
var co = preload("res://scenes/coin.tscn")

var platforms = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]

func _ready() -> void:
	score_label.text = "Lvl." + str(Global.lvl)
	coin_amount.text = "Coins: " + str(Global.coins)
	
func add_lvl():
	score_label.text = "Lvl." + str(Global.addLevel())
	var plat = platforms[randi() % 12].instantiate()
	if 50 > randi() % 100:
		var coin = co.instantiate()
		coin.position = Vector2(getX(),-382)
		add_child(coin)
	plat.position = Vector2(plat.position.x, -352)
	add_child(plat)
	
func getX():
	var x = 256 - randi() % 512
	return x
