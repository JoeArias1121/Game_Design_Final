extends CanvasLayer

func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
