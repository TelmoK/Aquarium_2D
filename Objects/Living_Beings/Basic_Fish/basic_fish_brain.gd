class_name BasicFishBrain
extends Node

@export var anatomy: Anatomy

var motion: DirectionaMotionSystem

var time_left = 2

var rng = RandomNumberGenerator.new()

func _ready():
	motion = utils.pick_node(anatomy.organs, DirectionaMotionSystem)


func choose_random_direction():
	var rand = rng.randi_range(0, 7)
	
	var div = rng.randi_range(-8, 8)
	if div == 0:
		div = 1
		
	var dir = motion.current_direction.rotated(
		PI*2 / div
	)
	
	if dir.length() == 0:
		dir = Vector2(1,0)
	
	motion.set_direction(dir)

func _process(delta):
	if time_left < 0:
		choose_random_direction()
		#motion.set_direction(Vector2(1,0))
		motion.set_speed(200)
		time_left = 2
	
	time_left -= delta
	print(anatomy.get_parent().global_position)
