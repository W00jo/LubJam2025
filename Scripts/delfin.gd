extends CharacterBody2D


func _process(delta):
	var mouse_position = get_global_mouse_position()

	if mouse_position.x > position.x:
		$Sprite2D.set_flip_h(false)
	elif mouse_position.x < position.x:
		$Sprite2D.set_flip_h(true)

func _physics_process(delta: float) -> void:
	var speed = Global.dolphin_speed
	var direction = Input.get_vector("DolphinLeft", "DolphinRight", "DolphinUp", "DolphinDown").normalized()
	if direction:
		velocity = direction * speed
	else:
		velocity = velocity * 0.97

	move_and_slide()
