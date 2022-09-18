extends Control

onready var texture_rect = $TextureRect

var level = 0 setget set_level

func set_level(_value):
	level = GlobalPlayerStats.level
	if texture_rect != null:
		texture_rect.rect_size.x = level * 30


func _ready():
	self.level = GlobalPlayerStats.level
	Events.connect("lvl_changed", self, "set_level")
