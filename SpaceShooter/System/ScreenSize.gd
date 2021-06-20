extends Node


var window_size: Vector2
var game_size: Vector2
var ship_size: Vector2

# ------------------------------------------------------------------------------
func set_ship_start_position():
	Global.ship.position.x = ship_size.x
	Global.ship.position.y = game_size.y / 2


func _ready() -> void:
	ship_size = Global.ship.get_node("BodySprite").texture.get_size()
	game_size = Vector2(ProjectSettings.get("display/window/size/width"), 
						ProjectSettings.get("display/window/size/height"))

	set_ship_start_position()
	


func _process(_delta: float) -> void:
	window_size = OS.window_size
