extends PanelContainer

@onready var player = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready():
	player.stop = true
	await get_tree().create_timer(5).timeout
	self.visible = false
	player.stop = false
	self.queue_free()
