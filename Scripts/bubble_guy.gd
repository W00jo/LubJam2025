extends CharacterBody2D

@export var speed = 400

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("BubbleLeft", "BubbleRight", "BubbleUp", "BubbleDown").normalized()
	if direction:
		velocity = direction * speed
	else:
		velocity = velocity * 0.97
	move_and_slide()
	
func _on_shield_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		print("Wykryty chłop. KŁUJ")
		Global.has_shield = false
		
