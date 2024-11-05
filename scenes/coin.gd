extends Area2D

var velocity = Vector2(0, 16)

func _ready() -> void:
	print("I'm a coin")

func _on_body_entered(body: Node2D) -> void:
	Global.addCoin()
	queue_free()

func _physics_process(delta: float) -> void:
	position += Global.platVelo * delta
	pass
