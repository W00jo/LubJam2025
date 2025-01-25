extends CharacterBody2D

@export var speed = 400

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("DolphinLeft", "DolphinRight", "DolphinUp", "DolphinDown").normalized()
	if direction:
		velocity = direction * speed
	else:
		velocity = velocity * 0.97
	move_and_slide()
