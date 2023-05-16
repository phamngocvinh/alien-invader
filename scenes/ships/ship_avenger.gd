extends Area2D

@export var speed = 400  # Player speed (pixels/sec)
@export var bullet_scene: PackedScene
var screen_size  # Gmae window's size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(200, 200)
	$fire_rate_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position.x = clamp(
		position.x, $Sprite2D.texture.get_width() / 2, screen_size.x - $Sprite2D.texture.get_width() / 2
	)
	position.y = clamp(
		position.y,
		$Sprite2D.texture.get_height() / 2,
		screen_size.y - $Sprite2D.texture.get_height() / 2
	)


func _on_fire_rate_timer_timeout():
	var bullet = bullet_scene.instantiate()
	bullet.position = $Marker2D.global_position
	get_tree().get_root().add_child(bullet)



func _on_Ship_Avenger_body_entered(body):
	if body.is_in_group("enemy_1"):
		hide()
