class_name DepthObject
extends Node

@export var obj_root: Node2D

## Referende to the Depth System that holds this entity
var depth_system: DepthSystem

## Index of the depth layer
var depth_layer: int = 0

## The scale of the object according to its depth layer
var depth_scale: float

func update_depth_scale():
	depth_scale = depth_system.get_layer_scale(depth_layer)


func _ready():
	if not obj_root:
		obj_root = get_parent()
		print("Auto assignment of the Body of the Depth Component")


func _process(delta):
	if obj_root is CharacterBody2D:
		var character_body = obj_root as CharacterBody2D
