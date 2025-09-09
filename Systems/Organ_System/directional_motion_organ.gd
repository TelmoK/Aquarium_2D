class_name DirectionaMotionSystem
extends Node

@export var body: CharacterBody2D

var current_direction:= Vector2.ZERO

@export var water_friction_speed: float

func _ready():
	assert(body)
	body.velocity = current_direction


func set_vecolity(velocity: Vector2):
	body.velocity = velocity


func set_direction(direction: Vector2):
	current_direction = direction
	
	if body.velocity.length() == 0:
		body.velocity = direction.normalized()
	else:
		body.velocity = direction.normalized() * body.velocity.length()


func set_speed(speed: float):
	body.velocity = body.velocity.normalized() * speed


func apply_water_friction():
	var total_speed = body.velocity.length() - water_friction_speed
	
	if total_speed < 0:
		total_speed = 0
		
	body.velocity = body.velocity.normalized() * total_speed


func _process(delta):
	apply_water_friction()
