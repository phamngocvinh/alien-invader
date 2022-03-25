extends Area2D


export var speed = 400

func _physics_process(delta):
	var velocity = Vector2.ZERO
	velocity.x -= 1
	velocity = velocity.normalized()
	position += velocity * speed * delta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
