extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var flip = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x < 250:
		flip = true
	if position.x > 937:
		flip = false
	if flip:
		position.x += 2
	else:
		position.x -= 2
