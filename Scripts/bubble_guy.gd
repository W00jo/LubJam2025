extends CharacterBody2D

@onready var anim_tree = $AnimationTree
@onready var shield_bubble = get_tree().get_first_node_in_group("ShieldBubble")
@onready var short_on_air = $ShortOnAir
@onready var die_no_air = $DieNoAir

func _ready() -> void:
	shield_bubble.connect("got_shield", on_got_shield)
	anim_tree["parameters/conditions/Idle"] = true


func _physics_process(delta: float) -> void:
	var speed = Global.guy_speed
	var direction = Input.get_vector("BubbleLeft", "BubbleRight", "BubbleUp", "BubbleDown").normalized()
	if direction:
		anim_tree["parameters/conditions/Idle"] = false
		anim_tree["parameters/conditions/Swim"] = true
		velocity = direction * speed
	else:
		anim_tree["parameters/conditions/Swim"] = false
		anim_tree["parameters/conditions/Idle"] = true
		velocity = velocity * 0.97
	move_and_slide()
	
func _on_shield_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		anim_tree["parameters/conditions/Break_Bubble"] = true
		await get_tree().create_timer(1).timeout
		short_on_air.start()
		print("Wykryty chłop. KŁUJ")
		Global.has_shield = false
		Global.guy_speed = 250
		await get_tree().create_timer(0.5).timeout
		anim_tree["parameters/conditions/Break_Bubble"] = false

func on_got_shield():
	anim_tree["parameters/conditions/Get_Bubble"] = true
	await get_tree().create_timer(0.5).timeout

func _on_short_on_air_timeout() -> void:
	Global.guy_speed = 420
	anim_tree["parameters/conditions/Close_To_Death"] = true
	die_no_air.start()

func _on_die_no_air_timeout() -> void:
	anim_tree["parameters/conditions/Death_NoAir"] = true
	await anim_tree.animation_finished
	Global.guy_dead = true

func _on_body_area_area_entered(area: Area2D) -> void:
	if Global.has_shield == false:
		if area.is_in_group("Bullet"):
			anim_tree["parameters/conditions/Death"] = true
			await anim_tree.animation_finished
			Global.guy_dead = true
