@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("PhysicsInterpolator", "Node3D", preload("res://addons/PhysicsInterpolator3D/physics_interpolator_3d.gd"), preload("res://addons/BounceBody3D/icon.png"))


func _exit_tree() -> void:
	remove_custom_type("PhysicsInterpolator")
