extends Node2D

@onready var bullet_spawn = $BulletSpawn
@onready var aim_line = $Line2D
@onready var bullet = preload("res://Scenes/bullet.tscn")
@onready var anim_tree = get_parent().get_node("AnimationTree")


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
		if Global.has_bullet == true:
			var new_bullet = bullet.instantiate()
			get_tree().root.add_child(new_bullet)
			new_bullet.global_position = bullet_spawn.global_position
			new_bullet.rotation = rotation
			Global.has_bullet = false
			anim_tree["parameters/conditions/Stop_AIM"] = true
			await get_tree().create_timer(0.1).timeout
			anim_tree["parameters/conditions/Stop_AIM"] = false
			
	
	if event.is_action_pressed("Shoot"):
		if Global.has_bullet == true:
			anim_tree["parameters/conditions/Start_AIM"] = true
			await get_tree().create_timer(0.1).timeout
			anim_tree["parameters/conditions/Start_AIM"] = false
			aim_line.add_point(aim_line.position, 0)
			var end_aim = Vector2(aim_line.position.x + 200, aim_line.position.y)
			aim_line.add_point(end_aim, 1)
