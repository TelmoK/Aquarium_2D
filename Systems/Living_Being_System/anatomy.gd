class_name Anatomy
extends Node

## The PhysicsBody2D of the entity (that is the root o the entity)
@export var body: PhysicsBody2D

## The brain of the entity
@export var brain: Node

## The container node that contains the Gene objects
@export var genome: Node

## The container node that contains the Status Parameter objects
@export var status: Node

## The container node that contains the Organ nodes
@export var organs: Node

func _ready():
	if not body:
		body = get_parent()
		print("Auto assignment of the Body of the Anatomy Component")
	
	assert(brain, "Anatomy has no access to the Brain")
	assert(genome, "Anatomy has no access to the Genome")
	assert(status, "Anatomy has no access to the Status")
	assert(organs, "Anatomy has no access to the Organs")
