extends AudioStreamPlayer3D


@onready var miss_sfx = preload("res://project/ball/sfx/miss.wav")
@onready var bounce_sfx = preload("res://project/ball/sfx/bounce.wav")


func _on_ball_body_collided(body: Node) -> void:
	if body.is_in_group("Paddle"):
		stream = bounce_sfx
		pitch_scale = 0.9 + randf_range(-0.1, 0.1)
		play()
		
	if body.is_in_group("Wall"):
		stream = bounce_sfx
		pitch_scale = 0.8 + randf_range(-0.1, 0.1)
		play()
