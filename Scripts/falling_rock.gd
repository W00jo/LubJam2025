extends Node2D

@export var fall_speed: float = 350.0  #prędkość spadania obiektu

var is_falling: bool = false # Jeśli aktualnie spada

@onready var killbox = $Killbox
@onready var trigger_area = $TriggerArea
@onready var self_destruct_timer = $SelfDestructTimer # Żeby nie spadał nieskończoną ilość czasu

func _physics_process(delta: float) -> void:
	if is_falling:
		global_position.y += fall_speed * delta
		
# Funkcja wykrywająca ziutka w bąblu
func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("BubbleGuy"):
		print("Wykryty chłop. Leciii...")
		is_falling = true
		self_destruct_timer.start()
		
# Funkcja wykrywająca delfina i nabijająca mu guza
func _on_killbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Dolphin"):
		Global.dolphin_speed = 300
		print("Guzior nabity!")
		
# Funkcja znikająca kamień, po jego upadku
func _on_self_destruct_timer_timeout() -> void:
	print("Kaminia nima")
	Global.dolphin_speed = 370
	queue_free()
