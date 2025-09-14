class_name DepthTransitionLayer 
extends Node2D

## Layer index of the origin Depth Layer
var origin_layer: int

## Layer index of the target Depth Layer
var target_layer: int

## Defines the rythm of the transition
var speed: float

var depth_system: DepthSystem

## How much is the scale going to increment 
var _scale_shift: float

func _init(transition_node: Node):
	if transition_node.get_parent():
		transition_node.get_parent().remove_child(transition_node)
	add_child(transition_node)


func _set_scale_shift():
	_scale_shift = (
		(
			depth_system.get_layer_scale(target_layer)
			- depth_system.get_layer_scale(origin_layer)
		) * speed
	)


func _shift_scale():
	self.scale += Vector2.ONE * _scale_shift


func is_transition_finished():
	return self.scale == depth_system.depth_layers[target_layer].scale


## Puts the contained node in the target Depth Layer and deletes  
## this transition node
func _end_transition():
	var child_node = get_child(0)
	if child_node.get_parent():
		child_node.get_parent().remove_child(child_node)
	
	depth_system.depth_layers[target_layer].add_child(child_node)
	queue_free()


func _ready():
	_set_scale_shift()
	self.scale = Vector2.ONE * depth_system.get_layer_scale(origin_layer)


func _process(delta):
	if is_transition_finished():
		_end_transition()
	else:
		_shift_scale()
