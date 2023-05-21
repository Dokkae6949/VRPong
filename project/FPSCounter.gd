extends Label3D


func _process(_delta: float) -> void:
	text = "%d fps" % Engine.get_frames_per_second()
