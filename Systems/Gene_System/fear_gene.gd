class_name FearGene
extends Node

@export var feared_objects: Array[GDScript]

func mutate():
	pass


func is_feared(node: Node2D) -> bool:
	var i = 0
	
	while(
		i < feared_objects.size() 
		and not is_instance_of(node, feared_objects[i])
	):
		i += 1
	
	return i < feared_objects.size()
