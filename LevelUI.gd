extends Control

onready var texture_rect = $TextureRect

var level = 4 setget set_level

func set_level(value):
	level += 1
	if texture_rect != null:
		texture_rect.rect_size.x = level * 30


func _ready():
	self.level = GlobalPlayerStats.level
	GlobalPlayerStats.connect("lvl_changed", self, "set_level")
