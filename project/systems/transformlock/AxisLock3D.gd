extends Node3D


@export var lock_x := false
@export var lock_y := false
@export var lock_z := false

@onready var parent := get_parent()

var origin: Vector3


func _ready():
	if parent == null: return
	
	origin = parent.position


func _process(_delta):
	call_deferred("apply_lock")
	

func apply_lock():
	if parent == null: return
	
	if lock_x: parent.position.x = origin.x
	if lock_y: parent.position.y = origin.y
	if lock_z: parent.position.z = origin.z
