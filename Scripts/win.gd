extends Control

@onready var game = get_tree().root.get_node('Game')


func _on_exit_button_pressed() -> void:
	get_tree().quit()
