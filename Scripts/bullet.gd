extends Node2D

var speed = 400

func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_life_time_timeout() -> void:
	queue_free()
