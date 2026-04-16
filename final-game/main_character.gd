extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var lastPosition = 103
var displacement = 0
func _physics_process(delta: float) -> void:
	
	if position.x != lastPosition:
		var temp = position.x
		print(temp)
		if temp > lastPosition:
			temp = temp - lastPosition
		else:
			temp = lastPosition - temp
		if temp < 1100:
			displacement += (lastPosition - position.x)
			print(lastPosition)
		lastPosition = position.x
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("changeDimension") and is_on_floor():
		
		if position.x < 3000:
			position.x = 3135 - displacement
		else:
			position.x = 133 - displacement
	
	#3135
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
