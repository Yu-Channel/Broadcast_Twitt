extends MenuButton

onready var header_text_edit = $"/root/Main/GUI/TextArea/HeaderTextEdit"
onready var title_line_edit = $"/root/Main/GUI/TextArea/TitleLineEdit"
onready var url_line_edit = $"/root/Main/GUI/TextArea/UrlLineEdit"
onready var hashtag_line_edit = $"/root/Main/GUI/TextArea/HashtagLineEdit"
onready var hashtag_option_button = $"/root/Main/GUI/TextArea/HashtagLineEdit/HashtagOptionButton"
onready var footer_text_edit = $"/root/Main/GUI/TextArea/FooterTextEdit"

var system_menu

func _ready():
	system_menu = get_popup()
	system_menu.add_item("reset")
	
	system_menu.connect("id_pressed", self, "_on_SystemMenu_pressed")

func _on_SystemMenu_pressed(ID):
	if ID == 0:
		Grobal.log_message = "Reset"
		# 読み込むデータを指定
		header_text_edit.text = ""
		title_line_edit.text = ""
		url_line_edit.text = ""
		hashtag_line_edit.text = "" 
		footer_text_edit.text = ""

