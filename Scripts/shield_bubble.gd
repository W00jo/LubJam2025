extends Node2D

func _on_collection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("BubbleGuy"):
		Global.has_shield = true
		queue_free()
		
