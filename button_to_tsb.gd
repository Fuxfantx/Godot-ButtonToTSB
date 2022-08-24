# CC0 Licensed.

extends TouchScreenButton
class_name ButtonToTSB  ## Turn Your Button into TouchScreenButton!
var parent:Button
var button_event:InputEventMouseButton
@export var optimized_for_round_button:bool = false

func p():
	if parent.disabled: return
	button_event.pressed = true
	button_event.position = get_parent().get_screen_position()
	if optimized_for_round_button:
		button_event.position.x += get_parent().get_global_rect().size.x / 2
		button_event.position.y += get_parent().get_global_rect().size.y / 2
	get_viewport().push_input(button_event)
func r():
	if parent.disabled: return
	button_event.pressed = false
	button_event.position = get_parent().get_screen_position()
	if optimized_for_round_button:
		button_event.position.x += get_parent().get_global_rect().size.x / 2
		button_event.position.y += get_parent().get_global_rect().size.y / 2
	get_viewport().push_input(button_event)
func u():
	var rect:RectangleShape2D = RectangleShape2D.new()
	rect.size = parent.size
	shape = rect
	position.x = parent.size.x / 2
	position.y = parent.size.y / 2


func _enter_tree():
	# Bug Prevent
	parent = get_parent() as Button
	if parent==null: queue_free()
	if OS.has_feature("pc"): queue_free()

	# Emulate the Mouse
	button_event = InputEventMouseButton.new()
	button_event.button_index = 1

	# Update Button's Size
	var rect:RectangleShape2D = RectangleShape2D.new()
	rect.size = parent.size
	shape = rect

	# Update Button's Position
	position.x = parent.size.x / 2
	position.y = parent.size.y / 2

	# Configurations
	visibility_mode = TouchScreenButton.VISIBILITY_TOUCHSCREEN_ONLY
	pressed.connect(p)
	released.connect(r)
	parent.resized.connect(u)
