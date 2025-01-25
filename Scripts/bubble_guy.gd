extends CharacterBody2D


func _physics_process(delta: float) -> void:
	var speed = Global.guy_speed
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
		Global.guy_speed = 250
