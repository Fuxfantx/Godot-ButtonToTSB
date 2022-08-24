# Godot-ButtonToTSB

In Mobile Rhythm Games, you may want to disable "Emulate Mouse From Touch" to reduce excessive `*_input(event)` calls like this:

```gdscript
# your_player_script.gd


func _enter_tree():
    # ······
    ProjectSettings.set_setting("input_devices/pointing/emulate_mouse_from_touch", false)
    # ······

# ······
# func quit():
#     ProjectSettings.set_setting("input_devices/pointing/emulate_mouse_from_touch", true)
```

This script gives you an easy way to Re-Enable a Theme Button in this situation. Just import this into your project, and *simply* Add `ButtonToTSB` as a Button's Child Node. Then your Theme Button should be at work on <mark>Mobile</mark> Touchscreens.

<mark>Notice: Only Suitable for Godot 4.x Branch!</mark>



###### CC0 Licensed.


