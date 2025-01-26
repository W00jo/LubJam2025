extends Node


@onready var audio = get_tree().root.get_node('Game/AudioStreamPlayer')
@onready var game_music = preload("res://Assets/Sounds/Simple Menu Music.mp3")

func _ready() -> void:
	play_music()

func play_music():
	audio.stream = game_music
	audio.play()
