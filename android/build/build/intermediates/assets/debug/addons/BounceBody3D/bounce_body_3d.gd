extends StaticBody3D
class_name BounceBody3D


signal body_collided(body: Node)


@export var bounce_enabled := true
@export var velocity: Vector3


func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info and bounce_enabled:
		var body = instance_from_id(collision_info.get_collider_id())
		velocity = velocity.bounce(collision_info.get_normal())
		body_collided.emit(body)
