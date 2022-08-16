extends TouchScreenButton
class_name ButtonToTSB
var parent:Button
var button_event:InputEventMouseButton

func p():
	if parent is Button:
		if parent.disabled: return
	button_event.pressed = true
	button_event.position = get_parent().get_screen_position()
	get_viewport().push_input(button_event)
func r():
	if parent is Button:
		if parent.disabled: return
	button_event.pressed = false
	button_event.position = get_parent().get_screen_position()
	get_viewport().push_input(button_event)

func _enter_tree():
	# 防止Bug
	parent = get_parent() as Button
	if not (parent is Button): queue_free()
	if OS.has_feature("pc"): queue_free()

	# 鼠标模拟
	button_event = InputEventMouseButton.new()
	button_event.button_index = 1

	# 更新按钮大小
	var rect:RectangleShape2D = RectangleShape2D.new()
	rect.size = parent.size
	shape = rect

	# 更新按钮位置
	position.x = parent.size.x / 2
	position.y = parent.size.y / 2

	# 基础设置
	visibility_mode = TouchScreenButton.VISIBILITY_TOUCHSCREEN_ONLY
	pressed.connect(p)
	released.connect(r)
