extends RigidBody3D


var is_held := false
var last_pos: Vector3
var move_delta: Vector3

var hand: Interactor


func _process(_delta):
	if hand != null:
		var pos = hand.global_position
		move_delta = pos - last_pos
		last_pos = pos
	
	position += move_delta
	position.z = 0


func _on_interactable_on_grab_enabled(interactor: Interactor) -> void:
	hand = interactor
	last_pos = hand.global_position


func _on_interactable_on_grab_disabled() -> void:
	hand = null
