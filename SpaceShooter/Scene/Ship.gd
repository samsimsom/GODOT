extends Area2D


export(int) var speed = 100


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	getInput(delta)
	


func getInput(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta

	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
