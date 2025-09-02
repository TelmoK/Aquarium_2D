class_name DepthSystem
extends Node2D

@export var camera: Camera2D

@export var depth_layers: Array[Node2D]

var depth_scaling: float = 0.94

## The array index that belongs to the current depth layer
var camera_depth_idex: int = 0


func scale_layers():
	for i in range(0, depth_layers.size()):
		depth_layers[i].modulate = Color(1, 1, 1, 0)
		
		if i >= camera_depth_idex:
			depth_layers[i].modulate = Color(1, 1, 1, 1)
			
		depth_layers[i].scale = (Vector2(1, 1) * pow(depth_scaling, i - camera_depth_idex))


func lerped_layer_scale(layer_inex: int, from: float, to: float, weight: float = 1):
	depth_layers[layer_inex].scale = Vector2(1, 1) * (from + (to - from) * weight)


func lerped_layer_visibility(layer_inex: int, from: float, to: float, weight: float = 1):
	depth_layers[layer_inex].modulate = Color(1, 1, 1, from + (to - from) * weight)


func handle_layer_visibility(layer_inex: int, delta: float):
	var target_alpha = 1
	
	if layer_inex < camera_depth_idex:
		target_alpha = 0
		
	lerped_layer_visibility(
			layer_inex, 
			depth_layers[layer_inex].modulate.a, 
			target_alpha,
			3 * delta
		)


func handle_depth_change_events(delta: float):
	if Input.is_action_just_pressed("ui_paste"):
		camera_depth_idex += 1
	if Input.is_action_just_pressed("ui_copy"):
		camera_depth_idex -= 1
	
	camera_depth_idex = clamp(camera_depth_idex, 0, depth_layers.size()-1)
	
	#scale_layers()
	for i in range(0, depth_layers.size()):
		lerped_layer_scale(
			i, 
			depth_layers[i].scale.x, 
			pow(depth_scaling, i - camera_depth_idex),
			1 * delta
			)
		handle_layer_visibility(i, delta)


func handle_x_axis_parallax(delta: float):
	var rel_cam_pos: Vector2 = (
			camera.global_position - depth_layers[camera_depth_idex].global_position
	)
	
	for i in range(0, depth_layers.size()):
		var rel_scaled_cam_pos = rel_cam_pos * depth_layers[i].scale
		
		depth_layers[i].global_position.x = (
			lerp(
				depth_layers[i].global_position.x, 
				rel_cam_pos.x - rel_scaled_cam_pos.x, 
				clamp(20 * delta, 0, 1)
			)
		)


func _ready():
	scale_layers()


func _process(delta):
	handle_x_axis_parallax(delta)
	handle_depth_change_events(delta)
