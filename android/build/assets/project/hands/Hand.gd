extends XRController3D


var interactor: Interactor


func _init() -> void:
	button_pressed.connect(_on_button_pressed)
	button_released.connect(_on_button_released)

func _ready() -> void:
	interactor = $Interactor
	

func _on_button_pressed(n: String):
	if n == "grip_click" && interactor != null:
		interactor.enable_grab()
	
func _on_button_released(n: String):
	if n == "grip_click" && interactor != null:
		interactor.disable_grab()
