extends KinematicBody2D

var velocity = 300
var arah = Vector2()
var gravity = 2000
var loncat = 1000
var coins = 0
var isjumping = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func sfxjump():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://jump.wav")
	player.play()
	
func _physics_process(delta):
	
	
	arah.x = velocity
	
	
	
	if isjumping && arah.y >= 0 :
		isjumping = false

	
	if Input.is_action_pressed("stop") :
		arah.x = 0
		$Sprite.play("idle")
	elif Input.is_action_just_released("stop"):
		arah.x = velocity
		$Sprite.play("run")
	elif Input.is_action_just_pressed("jump") and is_on_floor() :
		sfxjump()
		arah.y -= loncat
		isjumping = true
	elif not is_on_floor() :
		$Sprite.play("jump")
		
	else :
		$Sprite.play("run")
	
	
	
	
	arah.y += gravity * delta 
	var snap = Vector2.DOWN * 32 if !isjumping else Vector2.ZERO
	arah = move_and_slide_with_snap(arah, snap, Vector2.UP)
	
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene("res://Main Scene.tscn")
		
func add_coin():
	coins += 1
	print("coin saya adalah :", coins)


func _on_Spike_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene("res://Main Scene.tscn")
