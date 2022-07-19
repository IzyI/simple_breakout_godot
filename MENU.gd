extends Node2D

const game_scene= preload("res://Game.tscn")

func _ready():
	pass 
	
func start_game():
	print("start game")
	var gs=game_scene.instance()
	get_tree().get_root().add_child(gs)
	self.queue_free()

func _process(delta):
	pass


func _on_START_pressed():
	start_game()
	
	
