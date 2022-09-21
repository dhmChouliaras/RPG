extends CenterContainer

const EmptyInventorySlot = preload("res://Items/EmptyInventorySlot.png")
onready var item_texture_rect = $ItemTextureRect

var inventory = preload("res://Inventory/Inventory.tres")

func display_item(item):
	if item is Item:
		item_texture_rect.texture = item.texture
	else:
		item_texture_rect.texture = EmptyInventorySlot

func get_drag_data(_position):
	var item_index = get_index()
	var item = inventory.remove_item(item_index)
	if item is Item:
		var data = {}
		data.item = item
		data.item_index = item_index
		var dragPreview = TextureRect.new()
		dragPreview.texture = item.texture
		var c = Control.new()
		dragPreview.rect_position = -0.5 * item.texture.get_size()
		c.add_child(dragPreview)
		set_drag_preview(c)
		return data

func can_drop_data(_position, data):
	return data is Dictionary && data.has("item")

func drop_data(_position, data):
	var my_item_index = get_index()
	var my_item = inventory.items[my_item_index]
	inventory.swap_items(my_item_index, data.item_index)
	inventory.set_item(my_item_index, data.item)
