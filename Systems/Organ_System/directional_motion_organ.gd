class_name DirectionaMotionSystem
extends Node

@export var anatomy: Anatomy

@export var water_friction_speed: float

var body: CharacterBody2D

var current_direction:= Vector2.ZERO

func _ready():
	assert(anatomy)
	body = anatomy.body
	
	assert(body)
	body.velocity = current_direction * anatomy.depth_object.depth_scale


func set_vecolity(velocity: Vector2):
	body.velocity = velocity * anatomy.depth_object.depth_scale


func set_direction(direction: Vector2):
	current_direction = direction
	
	if body.velocity.length() == 0:
		body.velocity = direction.normalized()
	else:
		body.velocity = direction.normalized() * body.velocity.length()


func set_speed(speed: float):
	body.velocity = body.velocity.normalized() * speed * anatomy.depth_object.depth_scale


func apply_water_friction():
	var total_speed = body.velocity.length() - water_friction_speed * anatomy.depth_object.depth_scale
	
	if total_speed < 0:
		total_speed = 0
		
	body.velocity = body.velocity.normalized() * total_speed


func _process(delta):
	apply_water_friction()
