extends Node

var debug_code = ""
var clipboard
var log_message = ""
# menu の個数を指定
var menu_quantity = 10

const SAVEFILE = "res://savedata.hage"
const YOUTUBE = "https://youtube.com/"

# セーブファイルの初期化用
var save_init = {
	"Header": "",
	"Title": "",
	"Url": "",
	"Hashtag": "",
	"Footer": ""
}

var header = ""
var title = ""
var url = ""
var hashtag = ""
var footer = ""
