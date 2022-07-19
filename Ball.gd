extends RigidBody2D



func _ready():
	pass 

var COUNT_BRICK=0

func _process(delta):
	pass


func game_over(text):
	var menu = load("res://MENU.tscn").instance()
	get_tree().get_root().add_child(menu)
	get_node("/root/Game").queue_free()
	get_node("/root/MENU/MenuBox/List/info").set_text(text)
	
func next_level():
	COUNT_BRICK=0
	if get_node("/root/Game/LEVEL_2"):
		game_over("WIN WIN WIN")
	else:
		var level2 = load("res://LEVEL_2.tscn").instance()
		get_node("/root/Game").add_child(level2)
		get_node("/root/Game/LEVEL_1").queue_free()
	
	

	
func _physics_process(delta):
	var obj_list  = get_colliding_bodies()

	
	for b in obj_list:
		if "Brick" in b.name:
			b.queue_free()
			$audio1.play()
			COUNT_BRICK+=1
			if COUNT_BRICK==3:
				next_level()
			
		
		elif "Palka" == b.name:
			var speed = self.get_linear_velocity().length()
			var direction = self.position - b.get_node('Position2D').global_position
			var velocity = direction.normalized()*speed
			self.set_linear_velocity(velocity)
			$audio3.play()
		else:
			$audio2.play()
			
	if self.position.y >= get_viewport_rect().end.y:
		game_over('happy end  game_over !!!! ')
