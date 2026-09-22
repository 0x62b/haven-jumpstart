extends Area2D

@export var move_distance = 60
@export var move_speed = 25

var start_position: Vector2
var direction := 1.0

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	start_position = global_position
	body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	global_position.x += direction * move_speed * delta

	if global_position.x >= start_position.x + move_distance:
		global_position.x = start_position.x + move_distance
		direction = -1.0

	elif global_position.x <= start_position.x - move_distance:
		global_position.x = start_position.x - move_distance
		direction = 1.0

	sprite.flip_h = direction > 0

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.respawn()
