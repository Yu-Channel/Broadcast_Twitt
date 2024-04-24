extends MenuButton

#onready var main_node = $"/root/Main"
onready var header_text_edit = $"/root/Main/GUI/TextArea/HeaderTextEdit"
onready var title_line_edit = $"/root/Main/GUI/TextArea/TitleLineEdit"
onready var url_line_edit = $"/root/Main/GUI/TextArea/UrlLineEdit"
onready var hashtag_line_edit = $"/root/Main/GUI/TextArea/HashtagLineEdit"
onready var hashtag_option_button = $"/root/Main/GUI/TextArea/HashtagLineEdit/HashtagOptionButton"
onready var footer_text_edit = $"/root/Main/GUI/TextArea/FooterTextEdit"

var save_menu

func _ready():
	save_menu = get_popup()
	for i in range(Grobal.menu_quantity):
		save_menu.add_item("Save" + str(i + 1))
	
	save_menu.connect("id_pressed", self, "_on_SaveMenu_pressed")

func _on_SaveMenu_pressed(ID):
	print(save_menu.get_item_text(ID), " pressed") # debug
	
	# ConfigFile のインスタンスを作成
	var save_data = ConfigFile.new()
	
	# セーブデータが存在していた場合は読み込み
	save_data.load(Grobal.SAVEFILE)
	
	save_data.set_value("debug", "flag", 0)
	
	# セーブデータのIDを設定 (1から開始)
	var save_menu_id = ID + 1
	# 追加で保存するパラメータを設定
	save_data.set_value("data" + str(save_menu_id), "header", header_text_edit.text)
	save_data.set_value("data" + str(save_menu_id), "title", title_line_edit.text)
	save_data.set_value("data" + str(save_menu_id), "url", url_line_edit.text)
	save_data.set_value("data" + str(save_menu_id), "hashtag", hashtag_line_edit.text)
	save_data.set_value("data" + str(save_menu_id), "footer", footer_text_edit.text)
	
	# セーブデータを保存する
	save_data.save(Grobal.SAVEFILE)
	
	Grobal.log_message = "Save: " + str(save_menu_id)
	
