extends KinematicBody2D
# ------------------------------------------------------------------------------
# VARIABLES
var speed: float = 150.0
var acceleration: float = 500.0
var velocity: Vector2 = Vector2.ZERO

# ------------------------------------------------------------------------------
# FUNCTIONS
func get_input_axis() -> float:
	var axis = Vector2.ZERO

	var right = int(Input.is_action_pressed("ui_right"))
	var left = int(Input.is_action_pressed("ui_left"))
	var up = int(Input.is_action_pressed("ui_up"))
	var down = int(Input.is_action_pressed("ui_down"))
	
	axis.x = right - left
	axis.y = down - up

	return axis.normalized()


func apply_friction(friction_amount: float) -> void:
	if velocity.length() > friction_amount:
		velocity -= velocity.normalized() * friction_amount
	else:
		velocity = Vector2.ZERO


func apply_acceleration(acceleration_amout: Vector2) -> void:
	velocity += acceleration_amout
	velocity = velocity.clamped(speed)


func apply_movement(delta: float) -> void:
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(acceleration * delta)
	else:
		apply_acceleration(axis * acceleration * delta)
		
	velocity = move_and_slide(velocity)


func _ready() -> void:
	Global.ship = self


func _process(_delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	apply_movement(delta)
