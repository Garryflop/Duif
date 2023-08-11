extends Node2D


onready var marker = $Sprite

var target_position = null

func _physics_process(delta):
	var canvas = get_canvas_transform()
	var top_left = -canvas.origin / canvas.get_scale()
	var size = get_viewport_rect().size / canvas.get_scale()
	
	set_marker_position(Rect2(top_left, size))

func set_marker_position(bounds : Rect2):
	if target_position == null:
		marker.global_position.x = clamp(global_position.x, bounds.position.x, bounds.end.x)
		marker.global_position.y = clamp(global_position.y, bounds.position.y, bounds.end.y)
	else:
		var dis = global_position - target_position
		var length
		
		var tl = (bounds.position - target_position).angle()
		var tr = (Vector2(bounds.end.x, bounds.position.y) - target_position).angle()
		var bl = (Vector2(bounds.position.x, bounds.end.y) - target_position).angle()
		var br = (bounds.end - target_position).angle()
		if (dis.angle() > tl && dis.angle() < tr) \
				|| (dis.angle() < bl && dis.angle() > br):
			var y_len = clamp(dis.y, bounds.position.y - target_position.y, \
				bounds.end.y - target_position.y)
			var angle = dis.angle() - PI / 2.0
			length = y_len / cos(angle) if cos(angle) != 0 else y_len
		else:
			var x_len = clamp(dis.x, bounds.position.x - target_position.x, \
				bounds.end.x - target_position.x)
			var angle = dis.angle()
			length = x_len / cos(angle) if cos(angle) != 0 else x_len
			
		marker.global_position = polar2cartesian(length, dis.angle()) + target_position

