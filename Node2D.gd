extends Node2D


var focused : bool = true
var positions = Vector2.ZERO
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventMouseMotion:
		positions = event.position


func _process(delta):
	$ColorRect.rect_position = lerp($ColorRect.rect_position, positions, 4 * delta)
	$ColorRect.color = $ColorRect.color.linear_interpolate(Color.green if focused else Color.red, delta)


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_FOCUS_IN:
		focused = true
	elif what == MainLoop.NOTIFICATION_WM_FOCUS_OUT:
		focused = false
