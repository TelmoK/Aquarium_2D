class_name DepthObject
extends Node

@export var obj_root: Node2D

## Referende to the Depth System that holds this entity
var depth_system: DepthSystem

## Index of the depth layer
var depth_layer: int = 0

func _ready():
	if not obj_root:
		obj_root = get_parent()
		print("Auto assignment of the Body of the Depth Component")
