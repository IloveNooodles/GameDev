extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	position.y = lerp(position.y, get_global_mouse_position().y, 0.4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
