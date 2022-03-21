extends Area2D

export var speed = 500
export var damage = 1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
	var velocity = Vector2.ZERO
	velocity.x += 1
	velocity = velocity.normalized()
	position += velocity * speed * delta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bullet_exited_screen():
	queue_free()
