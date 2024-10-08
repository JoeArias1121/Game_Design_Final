extends Area2D

@onready var game_manager: Node = $"../GameManager"


func dummy(body: Node2D) -> void:
	body.get_node("CollisionShape2D").queue_free()
	print("Platform delated")
	game_manager.add_lvl()


func _on_body_entered(body: Node2D) -> void:
	body.get_node("CollisionShape2D").queue_free()
	print("Player deleted")
	game_manager.add_lvl()


func _on_area_entered(area: Area2D) -> void:
	area.get_node("CollisionShape2D").get_parent().get_parent().queue_free()
	print("Platform deleted")
	game_manager.add_lvl() 
