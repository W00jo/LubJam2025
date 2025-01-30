extends Control

@onready var instr_canvas = get_tree().root.get_node('Game/InstructionLayer')



func _on_ok_pressed() -> void:
	get_tree().paused = false
	instr_canvas.queue_free()
