extends Area2D


func _ready() -> void:
	print("I'm a coin")


func _on_body_entered(body: Node2D) -> void:
	Global.addCoin()

func _physics_process(delta: float) -> void:
	#position += velocity * delta
	pass
