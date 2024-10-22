extends Area2D

@onready var game_manager: Node = $"../GameManager"

func _on_body_entered(body: Node2D) -> void:
	body.get_node("CollisionShape2D").queue_free()
	print("Player deleted")
	get_tree().change_scene_to_file("res://scenes/DeathScreen.tscn")
