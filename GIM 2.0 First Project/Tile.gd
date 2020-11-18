extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = lerp(position.y, get_global_mouse_position().y, 0.4)
	
