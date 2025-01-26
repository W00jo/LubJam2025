extends Node2D

signal got_shield

func _on_collection_area_body_entered(body: Node2D) -> void:
	if (body.is_in_group("BubbleGuy") && Global.has_shield == false):
		print("URATOWANY")
		got_shield.emit()
		Global.has_shield = true
		Global.guy_speed = 380
		queue_free()
		
