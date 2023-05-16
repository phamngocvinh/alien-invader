extends RigidBody2D


@export var speed = 400
@export var health = 100
@export var bullet_scene: PackedScene

func _physics_process(delta):
	var velocity = Vector2.ZERO
	velocity.x -= 1
	velocity = velocity.normalized()
	position += velocity * speed * delta

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer_Firerate.start()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Timer_Firerate_timeout():
	var bullet = bullet_scene.instantiate()
	bullet.position = $Position2D_Fire.global_position
	get_tree().get_root().add_child(bullet)
