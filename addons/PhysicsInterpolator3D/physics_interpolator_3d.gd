extends Node3D
class_name PhysicsInterpolator3D


const INTERPOLATE_POSITION := 1
const INTERPOLATE_ROTATION := 2

@export var enabled := true : set = set_enabled
@export_flags("Position", "Rotation") var interpolation: int
@export var target: Node3D

var currTransform: Transform3D
var prevTransform: Transform3D


func set_enabled(value: bool) -> void:
	enabled = value
	
	set_process(enabled)
	set_physics_process(enabled)

func set_interpolation_flag(flag) -> void:
	interpolation |= flag

func get_interpolation_flag(flag) -> bool:
	return (interpolation & flag) == flag


func _ready() -> void:
	if target == null:
		printerr("No interpolation target found.")
		return
	
	prevTransform = Transform3D()
	currTransform = Transform3D()
	
	process_priority = 100
	top_level = true
	Engine.physics_jitter_fix = 0.0
	
	set_process(enabled)
	set_physics_process(enabled)


func _process(_delta: float) -> void:
	var f := Engine.get_physics_interpolation_fraction()
	var newTransform := Transform3D()
	
	# translate
	if get_interpolation_flag(INTERPOLATE_POSITION):
		var posDelta = currTransform.origin - prevTransform.origin
		newTransform = prevTransform + (posDelta * f)
	
	# rotate
	if get_interpolation_flag(INTERPOLATE_ROTATION):
		newTransform.basis = prevTransform.basis.slerp(currTransform.basis, f)
	
	transform = newTransform

func _physics_process(_delta: float) -> void:
	_update_transform()


func _update_transform() -> void:
	if target == null:
		return
	
	prevTransform = currTransform
	currTransform = target.global_transform
