extends StaticBody3D
class_name BounceBody3D


signal body_collided(body: Node)

const INTERPOLATE_POSITION := 1
const INTERPOLATE_ROTATION := 2

enum ProcessingType {PHYSICS, NORMAL}

@export var bounce_enabled := true

@export_subgroup("Simulation")
@export var processing_type: ProcessingType
@export var velocity: Vector3


func _process(delta: float) -> void:
	if processing_type == ProcessingType.NORMAL:
		_update(delta)

func _physics_process(delta: float) -> void:
	if processing_type == ProcessingType.PHYSICS:
		_update(delta)


func _update(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info and bounce_enabled:
		var body = instance_from_id(collision_info.get_collider_id())
		velocity = velocity.bounce(collision_info.get_normal())
		body_collided.emit(body)
