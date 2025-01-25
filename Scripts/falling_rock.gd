extends Node2D

@export var fall_speed: float = 100.0  #prędkość spadania obiektu

var is_falling: bool = false #jeśli aktualnie spada

@onready var killbox = $Killbox
@onready var trigger_area = $TriggerArea
@onready var self_destruct_timer = $SelfDestructTimer #żeby nie spadał nieskończoną ilość czasu

func _physics_process(delta: float) -> void:
	if is_falling:
		global_position.y += fall_speed * delta
		
func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Dolphin"):
		print("Wykryty delfin. Leciii...")
		is_falling = true
		self_destruct_timer.start()
		
func _on_killbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Dolphin"):
		print("Guzior nabity!")
		
func _on_self_destruct_timer_timeout() -> void:
	print("Kaminia nima")
	queue_free()
