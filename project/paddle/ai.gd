extends BounceBody3D


@onready var ball = $"../../Ball"


func _process(delta: float) -> void:
	var target: Vector3 = ball.global_position
	target.z = global_position.z
	
	var dist = global_position.distance_squared_to(target)
	var dir = global_position.direction_to(target).normalized()
	
	velocity = dir * dist * 50
