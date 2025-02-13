Include("\\script\\action\\location.lua");
Include("\\script\\misc\\topscore.lua");
AddCommand("LButton", "", "Mouse_Action()")
AddCommand("RButton", "", "Mouse_Force1()")
AddCommand("Shift+LButton", "", "Mouse_Force0()")
AddCommand("Shift+RButton", "", "Mouse_Force1()")
AddCommand("Ctrl+LButton", "", "Mouse_Say()")
AddCommand("Ctrl+RButton", "", "Mouse_Menu()")
AddCommand("Alt+RButton", "", "Mouse_Emote_Menu()")
AddCommand("Esc", "", "Open([[system]])")
AddCommand("Tab", "", "Open([[map]])")
AddCommand("Enter", "", "Focus([[commandline]])")
AddCommand("Del", "", "ClearMessage()")
AddCommand("F1", "", "Open([[help]])")
AddCommand("", "Help", "Open([[help]])")
AddCommand("", "Gi�p ��", "Open([[help]])")
AddCommand("", "bz", "Open([[help]])")
AddCommand("F2", "", "Open([[options]])")
AddCommand("F3", "", "Open([[status]])")
AddCommand("F4", "", "Open([[items]])")
AddCommand("F5", "", "Open([[skills]])")
AddCommand("F6", "", "Open([[friend]])")
AddCommand("F11", "", "Open([[tasknote]])")
AddCommand("F8", "", "Switch([[showplayerlife]])")
AddCommand("F9", "", "Switch([[pk]])")
AddCommand("Ctrl+H", "", "Switch([[pk]])")
AddCommand("F7", "", "Switch([[showplayername]])")
AddCommand("PrintScreen", "", "PrintScreen()")
AddCommand("P", "", "Open([[team]])")
AddCommand("", "team", "Open([[team]])")
AddCommand("", "T�", "Open([[team]])")
AddCommand("", "dw", "Open([[team]])")
AddCommand("Q", "", "ShortcutSkill(0)")
AddCommand("W", "", "ShortcutSkill(1)")
AddCommand("E", "", "ShortcutSkill(2)")
AddCommand("A", "", "ShortcutSkill(3)")
AddCommand("S", "", "ShortcutSkill(4)")
AddCommand("D", "", "ShortcutSkill(5)")
AddCommand("Z", "", "ShortcutSkill(6)")
AddCommand("X", "", "ShortcutSkill(7)")
AddCommand("C", "", "ShortcutSkill(8)")
AddCommand("F", "", "WeaponEffectActive()")
AddCommand("1", "", "ShortcutUseItem(0)")
AddCommand("2", "", "ShortcutUseItem(1)")
AddCommand("3", "", "ShortcutUseItem(2)")
AddCommand("4", "", "ShortcutUseItem(3)")
AddCommand("5", "", "ShortcutUseItem(4)")
AddCommand("6", "", "ShortcutUseItem(5)")
AddCommand("7", "", "ShortcutUseItem(6)")
AddCommand("8", "", "ShortcutUseItem(7)")
AddCommand("shift+1", "", "ShortcutUseItemByPage(0,2)")
AddCommand("shift+2", "", "ShortcutUseItemByPage(1,2)")
AddCommand("shift+3", "", "ShortcutUseItemByPage(2,2)")
AddCommand("shift+4", "", "ShortcutUseItemByPage(3,2)")
AddCommand("shift+5", "", "ShortcutUseItemByPage(4,2)")
AddCommand("shift+6", "", "ShortcutUseItemByPage(5,2)")
AddCommand("shift+7", "", "ShortcutUseItemByPage(6,2)")
AddCommand("shift+8", "", "ShortcutUseItemByPage(7,2)")
AddCommand("ctrl+1", "", "ShortcutUseItemByPage(0,3)")
AddCommand("ctrl+2", "", "ShortcutUseItemByPage(1,3)")
AddCommand("ctrl+3", "", "ShortcutUseItemByPage(2,3)")
AddCommand("ctrl+4", "", "ShortcutUseItemByPage(3,3)")
AddCommand("ctrl+5", "", "ShortcutUseItemByPage(4,3)")
AddCommand("ctrl+6", "", "ShortcutUseItemByPage(5,3)")
AddCommand("ctrl+7", "", "ShortcutUseItemByPage(6,3)")
AddCommand("ctrl+8", "", "ShortcutUseItemByPage(7,3)")
AddCommand("R", "", "Switch([[run]])")
AddCommand("M", "", "Switch([[horse]])")
AddCommand("V", "", "Switch([[sit]])")
AddCommand("T", "", "Switch([[trade]])")
AddCommand("O", "", "Switch([[trade]])")
AddCommand("Alt+0", "", "SayPhrase(9)")
AddCommand("Alt+1", "", "SayPhrase(0)")
AddCommand("Alt+2", "", "SayPhrase(1)")
AddCommand("Alt+3", "", "SayPhrase(2)")
AddCommand("Alt+4", "", "SayPhrase(3)")
AddCommand("Alt+5", "", "SayPhrase(4)")
AddCommand("Alt+6", "", "SayPhrase(5)")
AddCommand("Alt+7", "", "SayPhrase(6)")
AddCommand("Alt+8", "", "SayPhrase(7)")
AddCommand("Alt+9", "", "SayPhrase(8)")
AddCommand("Alt+X", "exit", "ExitGame()")
AddCommand("Alt+Q", "quit", "Exit()")
AddCommand("", "3d", "Set3D(1)")
AddCommand("", "2d", "Set3D(0)")
AddCommand("", "fullwindow", "SetFullWindow(1)")
AddCommand("", "window", "SetFullWindow(0)")
AddCommand("NUM2", "", "MoveTo(0, 0)")
AddCommand("NUM1", "", "MoveTo(8, 0)")
AddCommand("NUM4", "", "MoveTo(16, 0)")
AddCommand("NUM7", "", "MoveTo(24, 0)")
AddCommand("NUM8", "", "MoveTo(32, 0)")
AddCommand("NUM9", "", "MoveTo(40, 0)")
AddCommand("NUM6", "", "MoveTo(48, 0)")
AddCommand("NUM3", "", "MoveTo(56, 0)")
AddCommand("Left", "", "TurnTo(0)")
AddCommand("Right", "", "TurnTo(1)")
AddCommand("Insert", "", "SwitchPrivateMsgMode()")
AddCommand("+", "", "Zoom([[in]])")
AddCommand("=", "", "Zoom([[in]])")
AddCommand("-", "", "Zoom([[out]])")
AddCommand("_", "", "Zoom([[out]])")
AddCommand("Space", "", "PickNearest()")
AddCommand("Alt+Enter", "", "SwitchScreen()")
AddCommand("L", "", "HoldCursor()")
AddCommand("Ctrl+.", "", "TravelChatTab(0)")
AddCommand("Ctrl+,", "", "TravelChatTab(1)")
AddCommand("Alt+.", "", "TravelChannel(0)");
AddCommand("Alt+,", "", "TravelChannel(1)");
BanChannel("H� th�ng", "1")
AddCommand("G", "", "Open([[WorldMap]])")
AddCommand("H", "", "Open([[SceneMap]])")
AddCommand("B", "", "Open('topscore')")
AddCommand("J", "", "Open('meridian')")
AddCommand("K", "", "Open('3v3')")
AddCommand("Ctrl+K", "", "Open('XvxRank')")
--AddCommand("I","","Open([[pop]])")

RegisterFunctionAlias("join", "JoinTeam")
RegisterFunctionAlias("Gia nh�p", "JoinTeam")
RegisterFunctionAlias("jr", "JoinTeam")
RegisterFunctionAlias("T�ng", "JoinTeam")
RegisterFunctionAlias("trade", "Trade")
RegisterFunctionAlias("Giao d�ch", "Trade")
RegisterFunctionAlias("jy", "Trade")
RegisterFunctionAlias("invite", "InviteTeam")
RegisterFunctionAlias("M�i", "InviteTeam")
RegisterFunctionAlias("yq", "InviteTeam")
RegisterFunctionAlias("create", "CreateTeam")
RegisterFunctionAlias("T� ��i", "CreateTeam")
RegisterFunctionAlias("zd", "CreateTeam")


SetPhrase(0, "H�y theo t�i! :K")
SetPhrase(1, "M�i ng��i c�ng l�n n�o! Ng��i ��ng s�c m�nh! :F")
SetPhrase(2, "Nguy hi�m! Ch�y mau! :$")
SetPhrase(3, "Mau gi�p t�i t�ng m�u! :M")
SetPhrase(4, "C� ai mu�n t� ��i v�i t�i kh�ng? T�i c� ��n qu�! ^o^")
SetPhrase(5, "H�ng m�i ra l� c�n n�ng h�i ��y! :E")
SetPhrase(6, "Ng��i � ��u ��n? C�p m�y r�i? :o")
SetPhrase(7, "C�c v� ��i hi�p! L�m �n cho xin �t ti�n �i! :)")
SetPhrase(8, "T�i h� l� ng��i m�i! Xin m�i ng��i quan t�m ch� gi�o :I")
SetPhrase(9, "�ang � ��u v�y? :S")

RegisterFunctionAlias("88", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "7")
RegisterFunctionAlias("an", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "34")
RegisterFunctionAlias("bf", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "103")
RegisterFunctionAlias("ca", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "82")
RegisterFunctionAlias("dd", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "48")
RegisterFunctionAlias("gf", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "105")
RegisterFunctionAlias("gg", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "47")
RegisterFunctionAlias("hi", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "8")
RegisterFunctionAlias("jj", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "42")
RegisterFunctionAlias("jx", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "39")
RegisterFunctionAlias("lv", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "50")
RegisterFunctionAlias("mm", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "43")
RegisterFunctionAlias("ok", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "87")
RegisterFunctionAlias("pk", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "36")
RegisterFunctionAlias("beg", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "9")
RegisterFunctionAlias("bow", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "1")
RegisterFunctionAlias("bug", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "55")
RegisterFunctionAlias("bye", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "5")
RegisterFunctionAlias("cry", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "17")
RegisterFunctionAlias("cut", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "78")
RegisterFunctionAlias("die", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "41")
RegisterFunctionAlias("esc", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "35")
RegisterFunctionAlias("gao", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "109")
RegisterFunctionAlias("han", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "38")
RegisterFunctionAlias("hmm", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "100")
RegisterFunctionAlias("hua", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "63")
RegisterFunctionAlias("hug", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "79")
RegisterFunctionAlias("inn", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "102")
RegisterFunctionAlias("lun", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "57")
RegisterFunctionAlias("nod", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "52")
RegisterFunctionAlias("pat", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "27")
RegisterFunctionAlias("pen", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "66")
RegisterFunctionAlias("tan", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "11")
RegisterFunctionAlias("thx", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "86")
RegisterFunctionAlias("wen", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "44")
RegisterFunctionAlias("zzz", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "88")
RegisterFunctionAlias("18mo", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "28")
RegisterFunctionAlias("aisi", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "117")
RegisterFunctionAlias("aiyi", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "26")
RegisterFunctionAlias("buxx", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "32")
RegisterFunctionAlias("chou", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "108")
RegisterFunctionAlias("gone", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "101")
RegisterFunctionAlias("haha", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "6")
RegisterFunctionAlias("hero", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "98")
RegisterFunctionAlias("idle", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "70")
RegisterFunctionAlias("jiar", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "37")
RegisterFunctionAlias("jidu", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "15")
RegisterFunctionAlias("joke", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "45")
RegisterFunctionAlias("jump", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "72")
RegisterFunctionAlias("jush", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "104")
RegisterFunctionAlias("kick", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "4")
RegisterFunctionAlias("kill", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "116")
RegisterFunctionAlias("kiss", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "3")
RegisterFunctionAlias("lean", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "2")
RegisterFunctionAlias("lick", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "25")
RegisterFunctionAlias("love", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "118")
RegisterFunctionAlias("mapi", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "94")
RegisterFunctionAlias("miss", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "56")
RegisterFunctionAlias("poke", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "113")
RegisterFunctionAlias("poor", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "67")
RegisterFunctionAlias("puke", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "22")
RegisterFunctionAlias("qiao", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "30")
RegisterFunctionAlias("reny", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "123")
RegisterFunctionAlias("rose", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "21")
RegisterFunctionAlias("shiw", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "122")
RegisterFunctionAlias("sigh", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "23")
RegisterFunctionAlias("sing", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "121")
RegisterFunctionAlias("slap", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "12")
RegisterFunctionAlias("spit", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "14")
RegisterFunctionAlias("taoy", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "81")
RegisterFunctionAlias("wink", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "62")
RegisterFunctionAlias("wosh", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "10")
RegisterFunctionAlias("wuwu", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "119")
RegisterFunctionAlias("ysis", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "89")
RegisterFunctionAlias("zany", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "75")
RegisterFunctionAlias("zhen", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "124")
RegisterFunctionAlias("agree", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "92")
RegisterFunctionAlias("baoch", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "65")
RegisterFunctionAlias("baohu", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "53")
RegisterFunctionAlias("bihua", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "51")
RegisterFunctionAlias("blush", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "97")
RegisterFunctionAlias("chuqi", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "74")
RegisterFunctionAlias("crazy", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "84")
RegisterFunctionAlias("dadao", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "31")
RegisterFunctionAlias("dagun", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "106")
RegisterFunctionAlias("dajie", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "91")
RegisterFunctionAlias("daxia", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "58")
RegisterFunctionAlias("doubt", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "33")
RegisterFunctionAlias("drink", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "83")
RegisterFunctionAlias("duish", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "59")
RegisterFunctionAlias("dunno", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "110")
RegisterFunctionAlias("duobu", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "115")
RegisterFunctionAlias("fadai", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "24")
RegisterFunctionAlias("faint", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "29")
RegisterFunctionAlias("fangq", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "76")
RegisterFunctionAlias("gaosh", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "111")
RegisterFunctionAlias("gongx", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "69")
RegisterFunctionAlias("happy", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "68")
RegisterFunctionAlias("hengx", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "80")
RegisterFunctionAlias("jingy", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "93")
RegisterFunctionAlias("kaolv", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "114")
RegisterFunctionAlias("laugh", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "46")
RegisterFunctionAlias("lover", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "60")
RegisterFunctionAlias("marry", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "90")
RegisterFunctionAlias("match", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "54")
RegisterFunctionAlias("meinv", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "96")
RegisterFunctionAlias("paima", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "120")
RegisterFunctionAlias("peace", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "71")
RegisterFunctionAlias("point", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "40")
RegisterFunctionAlias("polan", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "112")
RegisterFunctionAlias("shuai", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "49")
RegisterFunctionAlias("sleep", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "13")
RegisterFunctionAlias("smell", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "19")
RegisterFunctionAlias("smile", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "0")
RegisterFunctionAlias("sorry", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "16")
RegisterFunctionAlias("stuff", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "20")
RegisterFunctionAlias("swear", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "107")
RegisterFunctionAlias("thank", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "85")
RegisterFunctionAlias("visit", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "95")
RegisterFunctionAlias("wanfu", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "99")
RegisterFunctionAlias("wangy", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "64")
RegisterFunctionAlias("weiqu", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "73")
RegisterFunctionAlias("wuchi", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "18")
RegisterFunctionAlias("xiaox", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "77")
RegisterFunctionAlias("xiezi", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "125")
RegisterFunctionAlias("zhich", "SayEmote", 3, "GetRecentPlayerName()", "GetCurrentChannelName()", "61")
