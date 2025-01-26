extends Node

@onready var win = preload("res://Scenes/win.tscn")
@onready var win_layer = get_tree().root.get_node('Game/WinLayer')
@onready var shader = get_tree().root.get_node('Game/Level/Shader')

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
	win_texture = load("res://Assets/Sprites/Menu/dolphin_won.png")
	
func guy_win():
	get_tree().paused = true
	var splash_win = win.instantiate()
	win_layer.add_child(splash_win)
	win_texture = load("res://Assets/Sprites/Menu/Bublin_chlop_won.png")
	
	
