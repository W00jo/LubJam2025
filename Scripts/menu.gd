extends Control

@onready var anim = $AnimationPlayer
@onready var canvas = $CanvasLayer
@onready var instructions = get_tree().root.get_node('Game/InstructionLayer')
@onready var shader_canvas = get_tree().root.get_node('Game/ShaderLayer')
@onready var menu = get_tree().root.get_node('Game/MenuLayer')

func _ready() -> void:
	get_tree().paused = true
	anim.play("splashscreen_fadeout")

func _on_play_pressed() -> void:
	instructions.visible = true
	#shader_canvas.visible = true
	menu.queue_free()
	Audio.game_music = preload("res://Assets/Sounds/Banger.mp3")
	Audio.play_music()

func _on_credits_pressed() -> void:
	$Creditsy.visible = true
	$Creditsy.disabled = false
	
func _on_exit_pressed() -> void:
	get_tree().quit()

func remove_splash():
	canvas.queue_free()

func remove_conductors():
	$CanvasLayer2.queue_free()


func _on_creditsy_pressed() -> void:
	$Creditsy.visible = false
	$Creditsy.disabled = true
