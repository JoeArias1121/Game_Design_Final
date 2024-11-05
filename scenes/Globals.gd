extends Node
#Global
var difficulty = 0
var lvl = 0
var ghostLvl = 0
var rockFreq = 1.5
var rockTimer = 0.0
var coins = 0
var souls = 0
var platVelo =  Vector2(0, 16)
var veloConst = 16

func addLevel():
	lvl += 1
	difficulty += 1
	platVelo.y = veloConst + 2 * difficulty
	return lvl

func addCoin():
	coins += 1

func ghostAddLevel():
	ghostLvl += 1
	platVelo.y = veloConst + 1.5 * ghostLvl
	return ghostLvl

func addSoul():
	souls += 1
	
func playerDied():
	if coins >= 5:
		coins -= 5
		print("Player turned to ghost")
		print(coins)
		get_tree().change_scene_to_file("res://scenes/DeathScreen.tscn")
		veloConst = 32
		platVelo.y = veloConst
	else:
		print("Player failed")
		print(coins)
		get_tree().change_scene_to_file("res://scenes/FailedScreen.tscn")
		
func ghostDied():
	if souls >= 0:
		print("You have enough souls")
		lvl += 5
		difficulty = 5
		get_tree().change_scene_to_file("res://scenes/RetryInfo.tscn")
	else:
		print("Player deleted")
		get_tree().change_scene_to_file("res://scenes/FailedScreen.tscn")
	souls = 0
	ghostLvl = 0
	veloConst = 16
	platVelo.y = veloConst + 2 * difficulty
		
func resetGame():
	difficulty = 0
	lvl = 0
	coins = 0
	platVelo.y = 16
