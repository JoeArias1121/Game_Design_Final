extends Area2D

var velocity = Vector2(0, 16)

func _ready() -> void:
	print("I'm a soulstone")

func _physics_process(delta: float) -> void:
	position += Global.platVelo * delta

func _on_body_entered(body: Node2D) -> void:
	Global.addSoul()
	queue_free()
