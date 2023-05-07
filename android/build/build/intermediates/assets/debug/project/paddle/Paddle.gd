extends BounceBody3D


@export_range(0,1) var dampening: float

var is_held := false
var last_pos: Vector3

var hand: Interactor


func _process(delta):
	if hand != null:
		var pos = hand.global_position
		velocity = (pos - last_pos) / delta
		last_pos = pos
	else:
		velocity *= 1 - dampening


func _on_interactable_on_grab_enabled(interactor: Interactor) -> void:
	hand = interactor
	last_pos = hand.global_position


func _on_interactable_on_grab_disabled() -> void:
	hand = null
