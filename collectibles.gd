extends Area2D

@export var value: int = 1

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_parent().get_node("GameOver").visible = true
		get_tree().paused = true
		queue_free()
