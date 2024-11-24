extends Area2D

var velocity = Vector2(0, 16)
@onready var coin_amount: Label = $"../../GameManager/CoinAmount"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	print("I'm a coin")

func _on_body_entered(body: Node2D) -> void:
	Global.addCoin()
	coin_amount.text = "Coins: " + str(Global.coins)
	animation_player.play("pickup")

func _physics_process(delta: float) -> void:
	position += Global.platVelo * delta
	pass
