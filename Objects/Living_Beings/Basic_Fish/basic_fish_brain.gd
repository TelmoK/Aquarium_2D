class_name BasicFishBrain
extends Node

@export var anatomy: Anatomy

var time_left = 2

func _process(delta):
	if time_left < 0:
		var motion: DirectionaMotionSystem = utils.pick_node(anatomy.organs, DirectionaMotionSystem)
		motion.set_direction(Vector2(1,0))
		motion.set_speed(200)
		time_left = 2
	
	time_left -= delta
