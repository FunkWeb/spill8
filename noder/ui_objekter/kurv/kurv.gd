extends Node2D

@export var size: Vector2 = Vector2(96, 40)
@export var color: Color = Color(0.8, 0.6, 0.2, 1)
@export var speed: int = 300
@export var use_mouse: bool = true
@export var clamp_to_viewport: bool = true
@export var show_debug: bool = false

func _ready():
    queue_redraw() # Godot 4.x: use queue_redraw() instead of update()

func _draw():
    # Draw a centered rectangle as a visible placeholder "sprite"
    var r = Rect2(-size * 0.5, size)
    draw_rect(r, color)
    # Simple border
    draw_rect(r, Color.BLACK, false, 2.0)
    
    # Debug visualization when enabled
    if show_debug:
        var vw = get_viewport_rect().size
        var half = size.x * 0.5
        # Show movement bounds
        var y_offset = size.y * 0.7
        draw_line(Vector2(half - position.x, y_offset), 
                 Vector2(vw.x - half - position.x, y_offset),
                 Color(1,1,1,0.3), 2.0)
        # Show current state
        var state = "Mouse" if use_mouse else "Keyboard"
        draw_string(ThemeDB.fallback_font, Vector2(-size.x * 0.5, -size.y),
                   state + " | Pos: " + str(snapped(position.x, 0.1)))

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
