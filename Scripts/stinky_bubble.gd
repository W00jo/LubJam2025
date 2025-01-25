extends Node2D

@onready var collection_area = $CollectionArea

func _on_collection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("BubbleGuy"):
		print("Wykryty chłop. Ewww :<")
	elif body.is_in_group("Dolphin"):
		print("Wykryty delfin. Mniam :3")
	queue_free()
