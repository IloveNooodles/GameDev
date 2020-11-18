extends KinematicBody2D

var veclocity = 200
var movement = Vector2()
var arah = Vector2()
var gravity = 200

func getInput(delta):
	arah.x = 1
	movement.x = arah.x * veclocity
	movement.y += gravity * delta 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	getInput(delta)
	movement = move_and_slide(movement, Vector2(0,1))


func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene("res://Main Scene.tscn")
