extends Area3D
class_name Interactor

## Controls if items should be dropped as soon as they leave the collider
@export var auto_release := false

var interactables: Array[Interactable]

var _is_grabbing := false
var _interactables_to_remove: Array[int]


func _init() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)


func enable_grab():
	_is_grabbing = true
	
	# enables grab for every interactable
	for interactable in interactables:
			interactable.enable_grab(self)

func disable_grab():
	_is_grabbing = false
	
	# disables every interactable
	for interactable in interactables:
		interactable.disable_grab()
	
	# removes any interactables which are queued to be removed
	for i in _interactables_to_remove:
		interactables.remove_at(i)
		
	_interactables_to_remove.clear()


func _on_area_entered(area: Area3D) -> void:
	if area is Interactable:
		area = area as Interactable
		
		interactables.append(area)

func _on_area_exited(area: Area3D) -> void:
	area = area as Interactable
	
	var i = interactables.find(area)
	
	if i < 0: return
	
	# checks if it should be removed instantly or when disable_grab gets called
	if not auto_release and _is_grabbing:
			_interactables_to_remove.append(i)
	else:
		interactables.remove_at(i)
		area.disable_grab()
