extends Node

var debug_code = ""
var clipboard

const SAVEFILE = "res://savedata.txt"
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
