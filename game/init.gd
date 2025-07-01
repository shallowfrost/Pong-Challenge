extends Node2D
func _ready() -> void:
	$ColorRect.color = Global.vismodes[Global.settings.x][1]
	$ball/ball.animation = Global.vismodes[Global.settings.x][0]
	$ball/ball.pause()
	$ball/ball.frame = Global.settings.y
	for segment in [$"player 1/top", $"player 1/middle", $"player 1/bottom"]:
		segment.animation = Global.vismodes[Global.settings.x][0]
		segment.pause()
		segment.frame = Global.settings.y
	for segment in [$"player 2/top", $"player 2/middle", $"player 2/bottom"]:
		segment.animation = Global.vismodes[Global.settings.x][0]
		segment.pause()
		segment.frame = Global.settings.y
	$"player 1".global_scale = Vector2(Global.scaler,Global.scaler)
	$"player 2".global_scale = Vector2(Global.scaler,Global.scaler)
	$ball.global_scale = Vector2(Global.scaler,Global.scaler)
