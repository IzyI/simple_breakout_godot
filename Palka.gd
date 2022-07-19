extends KinematicBody2D





func _ready():
	pass # Replace with function body.


func _process(delta):
	var y= self.get_position().y
	var mouse_x=get_viewport().get_mouse_position().x
	self.set_position(Vector2(mouse_x,y))
