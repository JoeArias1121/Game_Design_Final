extends Node
#Global
var lvl = 0
var coins = 0
var souls = 0

func addLevel():
	lvl += 1
	return lvl

func addCoin():
	coins += 1

func addSoul():
	souls += 1
	
func playerDied():
	if coins >= 5:
		coins -= 5
		print("Player turned to ghost")
		print(coins)
		get_tree().change_scene_to_file("res://scenes/DeathScreen.tscn")
	else:
		print("Player failed")
		print(coins)
		get_tree().change_scene_to_file("res://scenes/FailedScreen.tscn")
		
func resetGame():
	lvl = 0
	coins = 0
	souls = 0
