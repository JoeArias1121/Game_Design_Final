extends CanvasLayer

func _on_go_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Retry.tscn")
