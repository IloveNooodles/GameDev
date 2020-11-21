extends KinematicBody2D

var velocity = 200
var arah = Vector2()
var gravity = 2000
var loncat = 1000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func sfxjump():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://jump.wav")
	player.play()
	
	
func _physics_process(delta):
	
	arah.x = velocity
	
	arah = move_and_slide(arah,Vector2.UP)
	
	arah.y += gravity * delta 
	 
	if Input.is_action_just_pressed("jump") and is_on_floor() :
		sfxjump()
		arah.y -= loncat
	
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene("res://Main Scene.tscn")
		


func _on_Player_tree_entered():
	pass # Replace with function body.
