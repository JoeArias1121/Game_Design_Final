extends Area2D

var velocity = Vector2(0, 240)

func _ready() -> void:
	print("I'm a rock")

func _on_body_entered(body: Node2D) -> void:
	body.get_node("CollisionShape2D").queue_free()
	Global.ghostDied()

func _physics_process(delta: float) -> void:
	position += velocity * delta
