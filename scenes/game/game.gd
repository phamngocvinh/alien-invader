extends Node

var enemyScene = preload("res://scenes/enemies/enemy_1.tscn")
var game_screen

# Called when the node enters the scene tree for the first time.
func _ready():
	game_screen = get_viewport().get_visible_rect().size
	$timer_enemy_spawn.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground.scroll_offset.x -= 100 * delta


func _on_timer_enemy_spawn_timeout():
	var enemy = enemyScene.instance()
	enemy.global_position = Vector2(game_screen.x, rand_range(10, game_screen.y - 10))
	get_tree().get_root().add_child(enemy)
