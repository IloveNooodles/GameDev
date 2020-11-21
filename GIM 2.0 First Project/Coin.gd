extends Area2D

signal coin_collected

func _on_Area2D_body_entered(body):
		queue_free()
		body.add_coin()
		emit_signal("coin_collected")
