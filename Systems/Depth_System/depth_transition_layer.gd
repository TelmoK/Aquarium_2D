class_name DepthTransitionLayer 
extends Node2D

## Layer index of the origin Depth Layer
var origin_layer: int

## Layer index of the target Depth Layer
var target_layer: int

## Defines the rythm of the transition
var speed: float

var depth_system: DepthSystem

func _init(transition_node: Node):
	if transition_node.get_parent():
		transition_node.get_parent().remove_child(transition_node)
	add_child(transition_node)


## Puts the contained node in the target Depth Layer and deletes  
## this transition node
func end_transition():
	var child_node = get_child(0)
	if child_node.get_parent():
		child_node.get_parent().remove_child(child_node)
	
	depth_system.depth_layers[target_layer].add_child(child_node)
	queue_free()


func _process(delta):
	pass
