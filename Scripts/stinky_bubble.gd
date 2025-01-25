extends Node2D

@onready var trigger_area = $CollectArea

func _on_collect_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("BubbleGuy"):
		print("Ewww :<")
	elif body.is_in_group("Dolphin"):
		print("Mniam :3")
