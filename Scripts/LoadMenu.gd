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

var load_menu

func _ready():
	load_menu = get_popup()
	
	for i in range(Grobal.menu_quantity):
		load_menu.add_item("Load" + str(i + 1))
	
	load_menu.connect("id_pressed", self, "_on_OpenMenu_pressed")

func _on_OpenMenu_pressed(ID):
	print(load_menu.get_item_text(ID), " pressed") # debug
	
	# ConfigFile のインスタンスを作成
	var save_data = ConfigFile.new()
	
	# セーブデータの読み込み
	var err = save_data.load(Grobal.SAVEFILE)
	
	# セーブデータのファイルがなければ終了
	if err != OK:
		print("セーブデータの読み込みに失敗")
		return
	
	# セーブデータのIDを設定 (1から開始)
	var load_menu_id = ID + 1
	
	if save_data.has_section("data" + str(load_menu_id)):
		print("セクションの読み込み成功", str(load_menu_id)) # debug
		Grobal.log_message = "load: " + str(load_menu_id)
		
		# 読み込むデータを指定
		header_text_edit.text = save_data.get_value("data" + str(load_menu_id), "header")
		title_line_edit.text = save_data.get_value("data" + str(load_menu_id), "title")
		hashtag_line_edit.text = save_data.get_value("data" + str(load_menu_id), "hashtag")
		footer_text_edit.text = save_data.get_value("data" + str(load_menu_id), "footer")
		
		# もしYoutubeのURLの場合空白を代入
		if save_data.get_value("data" + str(load_menu_id), "url").count(str(Grobal.YOUTUBE)) == 0:
			url_line_edit.text = save_data.get_value("data" + str(load_menu_id), "url")
		else:
			url_line_edit.text = ""
		
	else:
		print("セクションの読み込み失敗", str(load_menu_id))

