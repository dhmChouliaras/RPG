extends Node


var _save: SaveGame

onready var _player = $YSort/Player

func _ready():
	_player.connect("save_requested", self, "_save_game")
	_player.connect("set_character_stats", self, "_on_set_character_stats")
	create_or_load_game()


func create_or_load_game():
	if SaveGame.save_exists():
		print("save exists")
		_save = SaveGame.load_savegame() as SaveGame
	else:
		_save = SaveGame.new()
		_save.character = CharacterStats.new()
		_save.global_position = _player.global_position
		_save.write_savegame()
	
	_player.global_position = _save.global_position
	_player.character_stats = _save.character
	GlobalPlayerStats.level = _player.character_stats.LEVEL
	GlobalPlayerStats.next_level_exp = (_player.character_stats.LEVEL * 25) + 10

func _save_game() -> void:
	_save.global_position = _player.global_position
	_save.write_savegame()

