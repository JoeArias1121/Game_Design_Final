extends Node2D

@onready var p1: TileMap = $platforms/plat1
@onready var p2: TileMap = $platforms/plat2
@onready var p3: TileMap = $platforms/plat3
@onready var p4: TileMap = $platforms/plat4
@onready var coin_amount: Label = $GameManager/CoinAmount


var platforms = [p1,p2,p3,p4]

func genPlat() -> void:
	var plat = platforms[0].instance()
	plat.position = Vector2(plat.position.x, -175)
	add_child(plat)
	pass
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin_amount.text = "Coins: " + str(Global.coins)
	pass # Replace with function body.

func _on_killzone_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_player_kill_zone_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
