class_name AgeStatusParameter
extends Node

@export var anatomy: Anatomy

@export var value = 0

func _ready():
	if not anatomy:
		print("AgeStatusParameter has not reference to its body Anatomy")



func _process(delta):
	var longevity_gene: LongevityGene
	
	if anatomy:
		longevity_gene = utils.pick_node(anatomy.genome, LongevityGene)
	
	if longevity_gene and longevity_gene.life_lenght_ticks <= value:
		# Death Notification
		pass
	
