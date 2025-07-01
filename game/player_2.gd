extends Node2D

@onready var ball = $ball/ball
@onready var player_1 = [$"player 1/top", $"player 1/middle", $"player 1/bottom"]
@onready var player_2 = [$"player 2/top", $"player 2/middle", $"player 2/bottom"]
@onready var background = $ColorRect

var settings = Vector2(1,2) # 0-dark / 1-light ,  0-default / 1-simple / 2-classic
var paddle_size = Vector2(2,4) # 12 * number / x is scale ,  y is unit length
var max_speeds = 200 # (in pixels / second)
var enemy_pos = Vector2(50, 648 * 0.5)

func _ready() -> void:
	var vismodes = [["dark", Color(0.16,0.16,0.16,1)], ["light", Color(0.92,0.92,0.92,1)]]
	background.color = vismodes[settings.x][1]
	ball.animation = vismodes[settings.x][0]
	ball.pause()
	ball.frame = settings.y
	for segment in player_1:
		segment.animation = vismodes[settings.x][0]
		segment.pause()
		segment.frame = settings.y
	for segment in player_2:
		segment.animation = vismodes[settings.x][0]
		segment.pause()
		segment.frame = settings.y
	$"player 1".global_scale = Vector2(paddle_size.x,paddle_size.x)
	$"player 2".global_scale = Vector2(paddle_size.x,paddle_size.x)
	$ball.global_scale = Vector2(paddle_size.x, paddle_size.x)
	_player_pos(player_2, Vector2(1152 - enemy_pos.x, enemy_pos.y))

func _player_pos(player, pos):
	if (648 - 4 - 12 * paddle_size.x * paddle_size.y / 2 < pos.y):
		pos.y = 648 - 4 - 12 * paddle_size.x * paddle_size.y / 2
	if (4 + 12 * paddle_size.x * paddle_size.y / 2 > pos.y):
		pos.y = 12 * paddle_size.x * paddle_size.y / 2

	player[0].global_position = pos - Vector2(0,paddle_size.x * 12)
	player[1].global_position = pos
	player[2].global_position = pos + Vector2(0,paddle_size.x * 12)

func _process(_delta: float) -> void:
	_player_pos(player_1, Vector2(enemy_pos.x, get_global_mouse_position().y))
