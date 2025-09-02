class_name DietGene
extends Node

@export var objects_in_diet: Array[GDScript]

func mutate():
	pass


func is_in_diet(node: Node2D) -> bool:
	var i = 0
	
	while(
		i < objects_in_diet.size() 
		and not is_instance_of(node, objects_in_diet[i])
	):
		i += 1
	
	return i < objects_in_diet.size()
