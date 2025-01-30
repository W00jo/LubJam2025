extends Node

@onready var win = preload("res://Scenes/win.tscn")
@onready var win_layer = get_tree().root.get_node('Game/WinLayer')
@onready var game = get_tree().root.get_node('Game')
@onready var level = preload("res://Scenes/level.tscn")

var win_texture

var has_bullet: bool = true

var has_shield: bool = true

var guy_dead: bool = false
var dolphin_dead: bool = false

var guy_speed = 380
var dolphin_speed = 370


func end_of_game():
	print("END OF GAME")

func dolphin_win():
	get_tree().paused = true
	var splash_win = win.instantiate()
	win_layer.add_child(splash_win)
	
func guy_win():
	get_tree().paused = true
	var splash_win = win.instantiate()
	win_layer.add_child(splash_win)
	
func on_restart():
	get_tree().get_first_node_in_group("Level").queue_free()
	var reloaded_level = level.instantiate()
	reloaded_level.add_to_group("Level")
	game.add_child(reloaded_level)
	
