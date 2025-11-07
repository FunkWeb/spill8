extends Node2D

export (Vector2) var size = Vector2(96, 40)
export (Color) var color = Color(0.8, 0.6, 0.2, 1)
export (int) var speed := 300
export (bool) var use_mouse := true
export (bool) var clamp_to_viewport := true

func _ready():
    update() # draw initial placeholder

func _draw():
    # Draw a centered rectangle as a visible placeholder "sprite"
    var r = Rect2(-size * 0.5, size)
    draw_rect(r, color)
    # Simple border
    draw_rect(r, Color(0,0,0,0), false, 2)

func _physics_process(delta):
    if use_mouse:
        # Follow mouse x position (viewport coordinates)
        var mx = get_viewport().get_mouse_position().x
        position.x = mx
    else:
        var dir = 0
        if Input.is_action_pressed("ui_left"):
            dir -= 1
        if Input.is_action_pressed("ui_right"):
            dir += 1
        if dir != 0:
            position.x += dir * speed * delta

    if clamp_to_viewport:
        var vw = get_viewport_rect().size
        var half = size.x * 0.5
        position.x = clamp(position.x, half, vw.x - half)
