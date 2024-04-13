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
	save_menu.add_item("Save 1")
#	save_menu.add_item("Save 2")
#	save_menu.add_item("Save 3")
	save_menu.connect("id_pressed", self, "_on_SaveMenu_pressed")

func _on_SaveMenu_pressed(ID):
	print(save_menu.get_item_text(ID), " pressed") # debug
	Grobal.debug_code = "200"
	
	if ID == 0:
		print("File save") # debug
		Grobal.debug_code = "201"
		
		# セーブデータ初期化
		var save_data = Grobal.save_init
		# セーブデータの用意
		Grobal.header = header_text_edit.text
		Grobal.title = title_line_edit.text
		Grobal.url = url_line_edit.text
		Grobal.hashtag = hashtag_line_edit.text
		Grobal.footer = footer_text_edit.text
		
		save_data = {
			"Header": Grobal.header,
			"Title": Grobal.title,
			"Url": Grobal.url,
			"Hashtag": Grobal.hashtag,
			"Footer": Grobal.footer
		}
		
		# JOSN テキスト変換
		var save_data_josn = JSON.print(save_data, "\t")
		
		var _file = File.new()
		_file.open(Grobal.SAVEFILE, File.WRITE)
		_file.store_string(save_data_josn)
		_file.close()
		

