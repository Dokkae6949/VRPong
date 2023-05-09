@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("BounceBody3D", "StaticBody3D", preload("res://addons/BounceBody3D/bounce_body_3d.gd"), preload("res://addons/BounceBody3D/icon.png"))


func _exit_tree() -> void:
	remove_custom_type("BounceBody3D")
