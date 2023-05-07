extends Area3D
class_name Interactable


signal on_grab_enabled(interactor: Interactor)
signal on_grab_disabled()


func enable_grab(interactor: Interactor):
	on_grab_enabled.emit(interactor)


func disable_grab():
	on_grab_disabled.emit()
