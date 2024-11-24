extends Area2D

var velocity = Vector2(0, 16)
@onready var soul_amount: Label = $"../../GameManager/SoulAmount"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	print("I'm a soulstone")

func _physics_process(delta: float) -> void:
	position += Global.platVelo * delta

func _on_body_entered(body: Node2D) -> void:
	Global.addSoul()
	soul_amount.text = "Souls: " + str(Global.souls)
	animation_player.play("pickup")
