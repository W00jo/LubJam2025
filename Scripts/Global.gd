extends Node

var has_bullet: bool = true

var has_shield: bool = true

var guy_dead: bool = false
var dolphin_dead: bool = false

var guy_speed = 350
var dolphin_speed = 350


func end_of_game():
	print("END OF GAME")
