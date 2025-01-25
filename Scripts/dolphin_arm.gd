extends Node2D

@onready var bullets_node = $BulletsNode
@onready var bullet = preload("res://Scenes/bullet.tscn")


func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton && event.is_action_released("Shoot")):
		var new_bullet = bullet.instantiate()
		bullets_node.add_child(new_bullet)
