extends Control

@onready var game = get_tree().root.get_node('Game')
@onready var win_texture = $WinTexture


func _ready() -> void:
	if Global.dolphin_dead == true:
		#$"Bubble wins".visible = true
		#$"DolphinWins".visible = false
		win_texture.texture = load("res://Assets/Sprites/Menu/Bublin_chlop_won2.png")
	if Global.guy_dead == true:
		#$"Bubble wins".visible = false
		#$"DolphinWins".visible = true
		win_texture.texture = load("res://Assets/Sprites/Menu/dolphin_won2.png")

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	get_tree().paused = false
	Global.on_restart()
	queue_free()
