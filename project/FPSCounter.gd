extends Label3D


func _process(delta: float) -> void:
	text = "%d fps" % Engine.get_frames_per_second()
