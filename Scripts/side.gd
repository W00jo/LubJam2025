extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Dolphin"):
		Global.dolphin_dead = true
		Global.guy_win()
		print("Dolphin dead")
	if body.is_in_group("BubbleGuy"):
		Global.guy_dead = true
		Global.dolphin_win()
		print("Guy dead")
