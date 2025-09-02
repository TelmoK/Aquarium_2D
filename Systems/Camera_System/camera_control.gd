class_name CameraControl
extends Node

@export var camera: Camera2D

var target_cam_pos: Vector2

@export var MOVE_SPEED = 400
@export var SMOOTHNESS = 3.0

func handle_movement(delta: float):
	var direction:= Vector2(0, 0)
	
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	var move = direction * MOVE_SPEED * delta
	
	if (
		camera.global_position.y + get_viewport().get_visible_rect().size.y * 0.3 > camera.limit_bottom
		or camera.global_position.y - get_viewport().get_visible_rect().size.y * 0.3 > camera.limit_top
	):
		print("LIMIT REACHED")
	
	# Move the camera based on input and speed
	target_cam_pos += move#direction * MOVE_SPEED * delta
	camera.global_position = lerp(camera.global_position, target_cam_pos, SMOOTHNESS * delta)
	
	


func _ready():
	target_cam_pos = camera.global_position


func _process(delta):
	handle_movement(delta)
