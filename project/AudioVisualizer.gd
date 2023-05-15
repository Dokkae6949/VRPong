extends Node3D


signal on_volume_changed(volume: float)


@export var target_bus: String : set = set_target_bus
@export var min_frequency: float = 0
@export var max_frequency: float = 11050.0
@export var min_db: float = 60.0

var target_bus_spectrum: AudioEffectInstance
var current_volume: float


func set_target_bus(value: String) -> void:
	target_bus_spectrum = AudioServer.get_bus_effect_instance(AudioServer.get_bus_index(value),0)
	target_bus = value


func _process(delta: float) -> void:
	update_frequency_in_range()


func update_frequency_in_range() -> void:
	var magnitude: float = target_bus_spectrum.get_magnitude_for_frequency_range(min_frequency, max_frequency).length()
	var volume = clamp((min_db + linear_to_db(magnitude)) / min_db, 0, 1)
	
	if volume != current_volume:
		current_volume = volume
		on_volume_changed.emit(current_volume)
