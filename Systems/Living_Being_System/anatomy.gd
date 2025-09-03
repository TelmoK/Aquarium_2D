class_name Anatomy
extends Node

## The brain of the fish
@export var brain: Node

## The container node that contains the Gene objects
@export var genome: Node

## The container node that contains the Status Parameter objects
@export var status: Node

## The container node that contains the Organ nodes
@export var organs: Node

func _ready():
	assert(brain, "Anatomy has no access to the Brain")
	assert(genome, "Anatomy has no access to the Genome")
	assert(status, "Anatomy has no access to the Status")
	assert(organs, "Anatomy has no access to the Organs")
