extends CanvasLayer


func _on_restart_button_pressed() -> void:
	Global.resetGame()
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
