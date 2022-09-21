extends CenterContainer

onready var item_texture_rect = $ItemTextureRect

func display_item(item):
	if item is Item:
		item_texture_rect.texture = item.Texture
	else:
		item_texture_rect.texture = load("res://Items/EmptyInventorySlot.png")
