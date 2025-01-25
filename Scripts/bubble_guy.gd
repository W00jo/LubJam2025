extends CharacterBody2D


@export var speed = 400

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("BubbleLeft", "BubbleRight", "BubbleUp", "BubbleDown").normalized()
	velocity = direction * speed
	move_and_slide()
