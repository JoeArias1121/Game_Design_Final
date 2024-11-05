extends Area2D

@onready var game_manager: Node = $"../GameManager"

func _on_area_entered(area: Area2D) -> void:
	area.get_node("CollisionShape2D").get_parent().queue_free()
	print("Pickup deleted")
