class_name DirectionaMotionSystem
extends Node

@export var body: CharacterBody2D

var current_direction:= Vector2.ZERO

func _ready():
	assert(body)
	body.velocity = current_direction


func set_vecolity(velocity: Vector2):
	body.velocity = velocity


func set_direction(direction: Vector2):
	current_direction = direction


func set_speed(speed: float):
	body.velocity = body.velocity.normalized() * speed
