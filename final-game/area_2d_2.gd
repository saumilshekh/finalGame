extends Area2D


var isPressed = false
var wall: StaticBody2D
var wall_start_pos: Vector2
var wall_end_pos: Vector2
var speed = 100.0  # adjust this for faster/slower

func _ready() -> void:
	$AnimatedSprite2D.play("Unpressed")
	wall = get_node("../StaticBody2D7")
	wall_start_pos = wall.position
	wall_end_pos = wall.position + Vector2(0, -200)  # adjust lift height

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isPressed:
		wall.position = wall.position.move_toward(wall_end_pos, speed * delta)
	else:
		wall.position = wall.position.move_toward(wall_start_pos, speed * delta)


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("canPress"):
		isPressed = true
		$AnimatedSprite2D.play("Pressed")


func _on_body_exited(body: Node2D) -> void:
	if isPressed:
		isPressed = false
		$AnimatedSprite2D.play("Unpressed")
