extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pocztek_animacji_body_entered(body: Node2D) -> void:
	if body in get_tree().get_nodes_in_group("BubbleGuy"):
		animation_player.play("Zrzut")


func _on_win_body_entered(body: Node2D) -> void:
	if body in get_tree().get_nodes_in_group("BubbleGuy"):
		Global.guy_win()
