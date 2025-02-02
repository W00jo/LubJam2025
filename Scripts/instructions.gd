extends Control

@onready var game = get_tree().root.get_node('Game')
@onready var instr_canvas = get_tree().root.get_node('Game/InstructionLayer')

func _input(event: InputEvent) -> void:
	var keyboard_mouse_texture = load("res://Assets/Sprites/Background/meunu5.png")
	var gamepad_texture = load("res://Assets/Sprites/Background/instrukcje_pad.png")
	if game.INPUT_SCHEME == game.INPUT_SCHEMES.KEYBOARD_AND_MOUSE:
		$ColorRect.set_texture(keyboard_mouse_texture)
		$Ok.position.x = -334
	if game.INPUT_SCHEME == game.INPUT_SCHEMES.GAMEPAD:
		$ColorRect.set_texture(gamepad_texture)
		$Ok.position.x = 275

func _on_ok_pressed() -> void:
	get_tree().paused = false
	instr_canvas.queue_free()
