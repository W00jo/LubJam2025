extends CharacterBody2D

@onready var falling_rock = get_tree().get_first_node_in_group("FallingRock")
@onready var anim_tree = $AnimationTree

func _ready() -> void:
	falling_rock.connect("bump_kill", on_bump_kill)

func _process(delta):
	var mouse_position = get_global_mouse_position()

	if mouse_position.x > position.x:
		$Sprite2D.set_flip_h(false)
	elif mouse_position.x < position.x:
		$Sprite2D.set_flip_h(true)

func _physics_process(delta: float) -> void:
	var speed = Global.dolphin_speed
	var direction = Input.get_vector("DolphinLeft", "DolphinRight", "DolphinUp", "DolphinDown").normalized()
	if direction:
		velocity = direction * speed
	else:
		velocity = velocity * 0.97
	move_and_slide()
	

func on_bump_kill():
	print("on bump kill")
	anim_tree["parameters/conditions/dead"] = true
	Global.dolphin_dead = true
	Global.guy_win()
