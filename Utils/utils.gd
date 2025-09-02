extends Node

func get_nodes_by_type(source_node: Node, type: Object) -> Array:
	var found_nodes: Array = []
	
	for node in source_node.get_children():
		if is_instance_of(node, type):
			found_nodes.append(node)
	
	return found_nodes


## Picks the first node of the specified type it finds in 
## the sons of the source_node
func pick_node(source_node: Node, type: Object) -> Object:
	var nodes = get_nodes_by_type(source_node, type)
	
	if nodes.is_empty():
		return null
	
	return nodes[0]
