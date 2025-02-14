--神秘锦盒
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--把一些数据上的东西丢到这里来 方便测试
g_tGTaskId = {1331,1345};  --涉及到的任务id 查看gtask_main
--存储不同玩家需要输入的数字
g_tInputInfo = {}
--用于交任务的物品数量
g_nTaskItemNum = 1;
--完成数独后给的物品 第1~g_nTaskItemNum个为用于交任务的物品
g_tTaskItem = {
	{{2, 111, 7, 1,}, "Th� ch璦 b鉩 ra"},
}

g_tSudoku = {
	{
		{4, 9, 2,},
		{3, 5, 7,},
		{8, 1, 6,},
	},
	{
		{8, 3, 4,},
		{1, 5, 9,},
		{6, 7, 2,},
	},
	{
		{6, 1, 8,},
		{7, 5, 3,},
		{2, 9, 4,},
	},
	{
		{2, 7, 6,},
		{9, 5, 1,},
		{4, 3, 8,},
	},
}

function OnUse(nItemIdx)
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	
	if nHasTask ~= 1 then
		--Talk(1, "", "<color=green>神秘锦盒<color>：您没有接取当前任务！");
		return 0;
	end
	
	
	--判断是不是已经完成了
	local nHasFinished = 1;
	for i = 1, g_nTaskItemNum do
		if BigGetItemCount(g_tTaskItem[i][1][1], g_tTaskItem[i][1][2], g_tTaskItem[i][1][3]) == 0 then
			nHasFinished = 0;
			break;
		end
	end
	
	if nHasFinished == 1 then
		Talk(1, "", "Ngi  nh薾 v藅 ph萴 nhi謒 v�");
		return 0;
	end
	
	if gf_Judge_Room_Weight(getn(g_tTaskItem),10, "") ~= 1 then return 0; end
	
	--显示数独
	local tQuestion, tAnswer = get_sudoku_info();
	--将答案存起来
	g_tInputInfo[GetName()] = tAnswer;
	
	--显示
	local szMsg = "<color=green>H閜 G蕀 Th莕 B�: <color>H�  l筩 th�, danh b蕋 h� truy襫. (M鏸 m閠 d遪g u thi誹 1 ch� s�; A, B, C s� h頿 th祅h 3 ch� s�,  ch綾 l� 甶觤 m蕌 ch鑤  m� h閜 g蕀.#\n";
	for i = 1, getn(tQuestion) do
		szMsg = szMsg .. [[    ]];
		for j = 1, getn(tQuestion[i]) do
			szMsg = szMsg .. tQuestion[i][j] .. [[    ]];
		end
		szMsg = szMsg .. "\n";
	end
	szMsg = szMsg .. "Nh藀 m藅 m� c馻 h閜 g蕀: ";
	local tSel = {
		"уng �/input_code",
		"сng/close_box",
	}
	Say(szMsg, getn(tSel), tSel);
end

function close_box()
	g_tInputInfo[GetName()] = nil;
end

function input_code()
	AskClientForString("input_code_cb","", 3, 6, "Nh藀 m藅 m� c馻 h閜 g蕀: ");
end

function input_code_cb(szValue)
	if g_tInputInfo[GetName()] == nil then
		Talk(1, "", "M藅 m� nh藀 v祇 b� l鏸.");
		return 0;
	end
	
	local tAnswer = g_tInputInfo[GetName()];
	g_tInputInfo[GetName()] = nil;
	
	local nCorrect = 0;
	
	for i = 1, getn(tAnswer) do
		if szValue == tAnswer[i] then
			nCorrect = 1;
			break;
		end
	end
	if nCorrect == 0 then
		Talk(1, "", "M藅 m� nh藀 v祇 b� l鏸.");
		return 0;
	end
	
	if gf_Judge_Room_Weight(getn(g_tTaskItem),10, "") ~= 1 then return 0; end
	
	if DelItem(2,111,6,1) ~= 1 then return 0; end
	--可以给物品了
	gf_SetLogCaption("H閜 G蕀 Th莕 B�");
	for i = 1, getn(g_tTaskItem) do
		gf_AddItemEx(g_tTaskItem[i][1], g_tTaskItem[i][2]);
	end
	gf_SetLogCaption("");
end

function get_sudoku_info()
	local nRand = random(1, getn(g_tSudoku));
	local tSudoku = g_tSudoku[nRand];
	local tAnswer = {"", "", ""};
	local tQuestion = {};
	local tCode = {"Gi�", "B", "C",};
	local tChineseNum = {"m閠", "hai", "ba", "b鑞", "Ng� ", "s竨", "b秠", "t竚", "ch輓"};
	local tTChineseNum = {"1", "2", "3", "4", "5", "陸", "7", "8", "9"};
	for i = 1, getn(tSudoku) do
		nRand = random(1, getn(tSudoku[i]));
		tQuestion[i] = {};
		for j = 1, getn(tSudoku[i]) do
			if j == nRand then
				tQuestion[i][j] = "<color=yellow>" .. tCode[i] .. "<color>";
				tAnswer[1] = tAnswer[1] .. tostring(tSudoku[i][j]);
				tAnswer[2] = tAnswer[2] .. tChineseNum[tSudoku[i][j]];
				tAnswer[3] = tAnswer[3] .. tTChineseNum[tSudoku[i][j]];
			else
				--tQuestion[i][j] = tSudoku[i][j];
				tQuestion[i][j] = tTChineseNum[tSudoku[i][j]];
			end
		end
	end
	return tQuestion, tAnswer;
end
