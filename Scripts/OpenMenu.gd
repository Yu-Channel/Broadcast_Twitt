extends MenuButton

#onready var main_node = $"/root/Main"
onready var header_text_edit = $"/root/Main/GUI/TextArea/HeaderTextEdit"
onready var title_line_edit = $"/root/Main/GUI/TextArea/TitleLineEdit"
onready var url_line_edit = $"/root/Main/GUI/TextArea/UrlLineEdit"
onready var hashtag_line_edit = $"/root/Main/GUI/TextArea/HashtagLineEdit"
onready var hashtag_option_button = $"/root/Main/GUI/TextArea/HashtagLineEdit/HashtagOptionButton"
onready var footer_text_edit = $"/root/Main/GUI/TextArea/FooterTextEdit"
#onready var copy_area = $"/root/Main/GUI/CopyArea"
#onready var copy_area_text_edit = $"/root/Main/GUI/CopyArea/TextEdit"

var open_menu

func _ready():
	open_menu = get_popup()
	open_menu.add_item("Open 1")
#	open_menu.add_item("Open 2")
#	open_menu.add_item("Open 3")
	open_menu.connect("id_pressed", self, "_on_OpenMenu_pressed")

func _on_OpenMenu_pressed(ID):
	print(open_menu.get_item_text(ID), " pressed") # debug
	
	if ID == 0:
		print("file open") # debug
		
		var _file = File.new()
		
		if _file.file_exists(Grobal.SAVEFILE):
			# セーブデータが存在していたら処理
			_file.open(Grobal.SAVEFILE, File.READ)
			var save_data = _file.get_as_text()
			# JSON テキスト変換
			var err = JSON.parse(save_data)
			if err.error == OK:
				Grobal.debug_code = "103 true"
				# 正常に変換できた場合
				print("Header: %s"%err.result["Header"]) # debug
				header_text_edit.text = err.result["Header"]
				title_line_edit.text = err.result["Title"]
				url_line_edit.text = err.result["Url"]
				hashtag_line_edit.text = err.result["Hashtag"]
				footer_text_edit.text = err.result["Footer"]
			
			else:
				# 失敗したらセーブデータを作成
				Grobal.debug_code = "102" # debug
				save_init_data()
		else:
			# 存在しない場合は新規にセーブデータを作成
			Grobal.debug_code = "101" # debug
			save_init_data()
	
func save_init_data():
	print("File save") # debug
	# セーブデータ初期化
	var save_data = Grobal.save_init
	
	# JOSN テキスト変換
	var save_data_josn = JSON.print(save_data, "\t")
	
	var _file = File.new()
	_file.open(Grobal.SAVEFILE, File.WRITE)
	_file.store_string(save_data_josn)
	_file.close()


