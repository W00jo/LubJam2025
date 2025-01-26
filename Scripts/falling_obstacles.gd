extends Node2D

@export var fall_speed: float = 500  #prędkość spadania obiektu

var is_falling: bool = false # Jeśli aktualnie spada

@onready var killbox = $Killbox
@onready var trigger_area = $TriggerArea

func _physics_process(delta: float) -> void:
	if is_falling:
		global_position.y += fall_speed * delta
		
# Funkcja wykrywająca graczy; triggeruje spadanie głazu
func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("BubbleGuy") and body.is_in_group("Dolphin"):
		print("Wykryty gracza/czy")
		is_falling = true
		
# Funkcja wykrywająca body graczy i zadająca im obrażenia
func _on_killbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("BubbleGuy") and body.is_in_group("Dolphin"):
		Global.dolphin_speed = 300
		print("AUĆ")
		
