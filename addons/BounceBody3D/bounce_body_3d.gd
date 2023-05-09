extends StaticBody3D
class_name BounceBody3D


signal body_collided(body: Node)

enum ProcessingType {PHYSICS, NORMAL}

@export var bounce_enabled := true
@export var velocity: Vector3
@export var processing_type: ProcessingType : set = set_processing_type


func set_processing_type(type: ProcessingType) -> void:
	if type == ProcessingType.NORMAL:
		set_process(true)
		set_physics_process(false)
	else:
		set_process(false)
		set_physics_process(true)


func _process(delta: float) -> void:
	_update(delta)

func _physics_process(delta: float) -> void:
	_update(delta)


func _update(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info and bounce_enabled:
		var body = instance_from_id(collision_info.get_collider_id())
		velocity = velocity.bounce(collision_info.get_normal())
		body_collided.emit(body)
