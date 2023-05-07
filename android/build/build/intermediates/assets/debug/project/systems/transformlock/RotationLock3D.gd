extends Node3D


@export var lock_x := false
@export var lock_y := false
@export var lock_z := false

var parent: Node3D
var origin: Vector3


func _ready():
	parent = get_parent()
	
	if parent == null: return
	
	origin = parent.rotation


func _process(_delta):
	call_deferred("apply_lock")
	

func apply_lock():
	if parent == null: return
	
	if lock_x: parent.rotation.x = origin.x
	if lock_y: parent.rotation.y = origin.y
	if lock_z: parent.rotation.z = origin.z
