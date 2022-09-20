extends CanvasModulate

onready var animation_player = $AnimationPlayer


func _process(delta):
	var time = OS.get_time()
	var time_in_seconds = time.hour * 3600 + time.minute * 60 + time.second
	var current_frame = range_lerp(time_in_seconds,0,86400,0,24)
	animation_player.play("Day_Night_Cycle")
	animation_player.seek(current_frame)
