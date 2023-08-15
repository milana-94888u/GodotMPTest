extends Camera2D


func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
	if is_multiplayer_authority():
		get_parent().get_node("ColorRect").visible = true
		enabled = true


func _process(delta: float) -> void:
	if is_multiplayer_authority():
		position += Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
