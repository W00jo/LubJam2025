extends Node2D

@onready var bullet_spawn = $BulletSpawn
@onready var aim_line = $Line2D
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
		aim_line.clear_points()
		var new_bullet = bullet.instantiate()
		get_tree().root.add_child(new_bullet)
		new_bullet.global_position = bullet_spawn.global_position
		new_bullet.rotation = rotation
	
	if event.is_action_pressed("Shoot"):
		aim_line.add_point(aim_line.position, 0)
		aim_line.add_point(get_global_mouse_position()*10, 1)
