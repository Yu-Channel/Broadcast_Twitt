extends Node2D

onready var debug_label = $Debug/DebugLabel

onready var header_text_edit = $GUI/TextArea/HeaderTextEdit
onready var title_line_edit = $GUI/TextArea/TitleLineEdit
onready var url_line_edit = $GUI/TextArea/UrlLineEdit
onready var hashtag_line_edit = $GUI/TextArea/HashtagLineEdit
onready var hashtag_option_button = $GUI/TextArea/HashtagLineEdit/HashtagOptionButton
onready var footer_text_edit = $GUI/TextArea/FooterTextEdit
onready var copy_area = $GUI/CopyArea
onready var copy_area_text_edit = $GUI/CopyArea/TextEdit


func _on_CopyButton_pressed():
	var sum_text
	
	Grobal.header = header_text_edit.text
	Grobal.title = title_line_edit.text
	Grobal.url = url_line_edit.text
	Grobal.hashtag = hashtag_line_edit.text
	Grobal.footer = footer_text_edit.text
	
	sum_text = str(Grobal.header + "\n" + Grobal.title + "\n" + Grobal.url + "\n" + Grobal.hashtag + "\n" + Grobal.footer)
	copy_area_text_edit.text = sum_text
	Grobal.clipboard = sum_text
	
	copy_area.show()

func _on_CloseButton_pressed():
	copy_area.hide()

func _on_DebugTimer_timeout():
	debug_label.text = Grobal.debug_code
