extends Control

@onready var game = get_tree().root.get_node('Game')

func _ready() -> void:
	if Global.dolphin_dead == true:
		$"Bubble wins".visible = true
		$"DolphinWins".visible = false
	if Global.guy_dead == true:
		$"Bubble wins".visible = false
		$"DolphinWins".visible = true

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
