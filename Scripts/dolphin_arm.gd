extends Node2D

@onready var bullet_spawn = $BulletSpawn
@onready var bullet = preload("res://Scenes/bullet.tscn")


func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0 ,360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton && event.is_action_released("Shoot")):
		var new_bullet = bullet.instantiate()
		get_tree().root.add_child(new_bullet)
		new_bullet.global_position = bullet_spawn.global_position
		new_bullet.rotation = rotation
