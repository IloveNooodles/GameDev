extends Node

var Tujuan

func _ready():
	Tujuan = get_node("Tujuan").get_global_position()

func _on_Area2D_body_entered(body):
		if body.name == 'Player':
			body.set_position(Tujuan)
