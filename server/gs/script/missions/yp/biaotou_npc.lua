--��Զ�ھ���ͷ
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\message.lua");
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\missions\\yp\\award.lua");

TABLE_YunBiao = new(KTabFile,"\\settings\\task\\yunbiao.txt");

g_NpcName = "<color=green>Ti�u ��u Tr�n Vi�n Ti�u C�c<color>: "

T1 = {};
T2 = {};
T3 = {};
T4 = {};
T5 = {};
T6 = {};

T1.msg = g_NpcName.."Ta l� t�ng ti�u ��u c�a Tr�n Vi�n Ti�u C�c, h�ng ng�y ta s� cho 3 l�n nhi�m v� v�n ti�u, ��i hi�p ��ng � gi�p �� kh�ng?";
T1.sel = {
	{"Gi�i thi�u v�n ti�u",T2},
	{"Nh�n Ti�u Xa (Ng�y 3 l�n)",T3},
	{"Ta mu�n mua b�o hi�m",T4},
	{"Nhi�m v� c��p ti�u (Ng�y 1 l�n)",T5},
	{"Mua Tr�n Vi�n Ho�n Ti�u L�nh",T6},
	{"K�t th�c ��i tho�i","nothing"},
};

T2.msg = g_NpcName.."��i hi�p mu�n t�m hi�u th�ng tin g�?";
T2.sel = {
	{"H��ng d�n v�n ti�u","#bt_Talk_1(1)"},
	{"Th�i gian x2 v�n ti�u","#bt_Talk_1(2)"},
	{"Mua b�o hi�m Ti�u Xa","#bt_Talk_1(3)"},
	{"Nhi�m v� c��p ti�u","#bt_Talk_1(4)"},
	{"Ph�n th��ng Ti�u Xa","bt_Talk_8"},
	{"tr� l�i",T1},
	{"K�t th�c ��i tho�i","nothing"},
};

T3.msg = g_NpcName.."��i hi�p c� th� nh�n Ti�u Xa v�n chuy�n ��n Th�t L�c Nhai � ch� c�a ta, v�n ti�u c�n giao n�p ti�n th� ch�p nh�t ��nh, sau khi th�nh c�ng ho�n th�nh v�n ti�u s� tr� l�i ti�n th� ch�p. Ng��i mu�n nh�n Ti�u Xa ngay b�y gi� kh�ng?"
T3.sel = {
	{"Ta mu�n nh�n Ti�u Xa","bt_Talk_2"},
	{"Ta mu�n ��i Ti�u Xa","bt_Talk_7"},
	{"tr� l�i",T1},
	{"K�t th�c ��i tho�i","nothing"},		
}

T4.msg = g_NpcName.."V�n ti�u c� th� g�p nguy hi�m, ��i hi�p mu�n mua b�o hi�m cho Ti�u Xa ph�i kh�ng? Sau khi mua b�o hi�m, n�u Ti�u Xa v� nguy�n nh�n n�o �� m� b� m�t s� nh�n ���c ph�n th��ng nh�t ��nh."
T4.sel = {
	{"Ta mu�n mua b�o hi�m","bt_Talk_3"},
	{"tr� l�i",T1},
	{"K�t th�c ��i tho�i","nothing"},
}

T5.msg = g_NpcName.."M�i ng�y ch� ���c ho�n th�nh 1 l�n nhi�m v� c��p ti�u, khi ho�n th�nh nhi�m v� s� c�n c� theo t�n v�t cao c�p nh�t �� ph�t ph�n th��ng!";
T5.sel = {
	{"Nh�n nhi�m v� c��p ti�u (Ti�u hao 5 �i�m tinh l�c)","bt_Talk_4_1"},
	{"Ho�n th�nh nhi�m v� c��p ti�u","bt_Talk_5"},
	{"tr� l�i",T1},
	{"K�t th�c ��i tho�i","nothing"},
}

T6.msg = g_NpcName.."N�m x�a khi ta c�n ch�a gia nh�p Tr�n Vi�n Ti�u C�c, trong tay c� r�t nhi�u Tr�n Vi�n Ho�n Ti�u L�nh, hi�n t�i nh�ng v�t n�y kh�ng c�n gi� tr� ��i v�i ta n�a, ta s� b�n r� cho ��i hi�p, 5 c�i ch� t�n 1 v�ng th�i! <color=red>Nh�ng m�i ng�y ch� c� th� mua 1 l�n!<color>";
T6.sel = {
	{"Ta mu�n mua 5 Tr�n Vi�n Ho�n Ti�u L�nh","bt_Talk_6"},
	{"tr� l�i",T1},
	{"K�t th�c ��i tho�i","nothing"},
}

function main()
	temp_Talk(T1);
end

function t2_main()
	temp_Talk(T2);
end

function bt_Talk_1(nType)
	local strMsg = {
		[1] = "Nh�n nhi�m v� v�n ti�u: Ng��i ch�i �� gia nh�p th� l�c, m�i ng�y ��u c� th� ��n ch� <color=yellow>Ti�u ��u Tr�n Vi�n Ti�u C�c<color> c�a th� l�c �� nh�n nhi�m v� v�n ti�u, m�i l�n nh�n nhi�m v� v�n ti�u th�nh c�ng s� ti�u hao <color=green>15 �i�m tinh l�c<color>. ��i xe: Ti�u Xa bao g�m 5 lo�i: Ti�u Xa Th��ng, Quan Tr�ng, Qu�n D�ng, C� M�t v� Ho�ng Gia, m�i l�n s� nh�n s� ���c ng�u nhi�n m�t lo�i Ti�u Xa, n�u b�n kh�ng v�a � v�i Ti�u Xa v�a nh�n ���c, c� th� d�ng <color=yellow>Tr�n Vi�n Ho�n Ti�u L�nh<color> ti�n h�nh ��i xe. ��i xe kh�ng gi�i h�n s� l�n v� kh�ng ti�u hao tinh l�c. Ho�n th�nh nhi�m v� v�n ti�u: Sau khi nh�n ���c Ti�u Xa, <color=yellow>trong v�ng 30 ph�t<color> th�nh c�ng h� t�ng ��n ch� <color=yellow>Thanh H�i Di�m Th��ng<color> � Th�t L�c Nhai xem nh� ho�n th�nh nhi�m v�. Ti�u Xa b� h�y ho�c v��t qu� 30 ph�t th� s� nh� nhi�m v� v�n ti�u th�t b�i.",
		[2] = "<color=yellow>20:00 - 22:00<color> h�ng ng�y s� l� th�i gian x2 v�n ti�u, ho�n th�nh nhi�m v� v�n ti�u trong kho�ng th�i gian n�y s� nh�n ���c g�p ��i c�c ph�n th��ng nhi�m v� kh�c (ngo�i tr� v�ng), ti�n th� ch�p �� nh�n Ti�u Xa kh�ng thay ��i.",
		[3] = "Sau khi ng��i ch�i nh�n Ti�u Xa th�nh c�ng c� th� ti�n h�nh mua b�o hi�m �� nh�n ph�n th��ng b�o hi�m, mua b�o hi�m c�n giao n�p m�t s� ti�n b�o hi�m, sau khi ho�n th�nh nhi�m v� s� kh�ng ho�n tr� s� ti�n n�y. Khi Ti�u Xa ���c mua b�o hi�m b� ph� h�y ho�c b� h� th�ng thu h�i s� nh�n ���c ph�n th��ng b�o hi�m t��ng �ng c�a Ti�u Xa �� <color=yellow>(Th�p h�n ph�n th��ng c� ��nh khi ho�n th�nh nhi�m v�)<color>. Ti�u Xa th�nh c�ng v�n chuy�n ��n ch� Thanh H�i Di�m Th��ng s� kh�ng th� nh�n ���c ph�n th��ng b�o hi�m!",
		[4] = "<color=yellow>20:00 - 22:00<color> h�ng ng�y, trong th�i gian x2 ho�t ��ng v�n ti�u s� ��ng th�i m� nhi�m v� �o�t ti�u, ng��i ch�i c� th� ��n ch� Ti�u ��u Tr�n Vi�n Ti�u C�c nh�n nhi�m v� �o�t ti�u; sau khi nh�n nhi�m v�, ti�u h�y Ti�u Xa c�a th� l�c kh�c s� nh�n ���c T�n V�t Ti�u Xa, d�ng T�n V�t Ti�u Xa c� th� ��n ch� c�a ta �� ��i ph�n th��ng �o�t ti�u. <color=red>Ch� �: M�i ng�y ch� ���c ho�n th�nh 1 l�n nhi�m v� �o�t ti�u, khi ho�n th�nh nhi�m v� ch� c�n c� theo Ti�u K� cao c�p nh�t �� ph�t ph�n th��ng!<color>",
	};
	suTalk("t2_main",g_NpcName..strMsg[nType]);
end

function bt_Talk_2()
	local nTalkNpc = GetTargetNpc()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local m,x,y = GetNpcWorldPos(nTalkNpc);
	if g_nDebugVersion ~= 1 then
		if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= m then
			Talk(1,"",g_NpcName.."��i hi�p h�y ��n ti�u c�c thu�c th� l�c c�a m�nh �� nh�n ti�u!");
			return 0;
		end
	end
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 0 then
		Talk(1,"",g_NpcName.."Ti�u Xa c�a ng��i ��u? H�y mau xem th� c� ph�i b� m�t r�i kh�ng!");
		return 0;
	end
	if GetTask(TASK_FIELD_PVP_CAR_DAILY_NUM) >= 3 then
		Talk(1,"",g_NpcName.."H�m nay ng��i �� nh�n 3 l�n nhi�m v� v�n ti�u, ng�y mai h�y quay l�i!");
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nDistance = abs(nPosX-x)+abs(nPosY-y);
	if nMapID ~= m or nDistance > 40 then
		Talk(1,"",g_NpcName.."��i hi�p ch�y qu� xa r�i!");
		return 0;
	end
	local nRand = random(1,100);
	for i = 1,getn(tBCRand) do
		if nRand <= tBCRand[i] then
			SetTask(TASK_FIELD_PVP_CAR_RAND,i);
			break;
		end
	end
	SendScript2Client('Open("YunBiao", 1)');
	bt_Talk_2_2()
end

function bt_Talk_7()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."Ng��i ch�a nh�n nhi�m v� Ti�u Xa!");
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nNpcIdx);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Talk(1,"",g_NpcName.."Ti�u Xa c�a ng��i b� ph� h�y ho�c qu� th�i gian v�n ti�u v�n ch�a ��n ��ch, v�n ti�u th�t b�i!");
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	if nMapID ~= nNpcMapID or nDistance > 16 then
		Talk(1,"",g_NpcName.."��i hi�p �� l�m m�t Ti�u Xa r�i ph�i kh�ng, h�y mau �i t�m n�o!")
		return 0;
	end
	SendScript2Client('Open("YunBiao", 2)');
	bt_Talk_2_1();
end

--����
function bt_Talk_2_1()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID,nPosX,nPosY = GetWorldPos();
	if g_nDebugVersion ~= 1 then
		if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= nMapID then
			return 0;
		end
	end
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."Ng��i ch�a nh�n nhi�m v� Ti�u Xa!");
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nNpcIdx);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Talk(1,"",g_NpcName.."Ti�u Xa c�a ng��i b� ph� h�y ho�c qu� th�i gian v�n ti�u v�n ch�a ��n ��ch, v�n ti�u th�t b�i!");
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	if nMapID ~= nNpcMapID or nDistance > 16 then
		Talk(1,"",g_NpcName.."��i hi�p �� l�m m�t Ti�u Xa r�i ph�i kh�ng, h�y mau �i t�m n�o!")
		return 0;
	end
	--Ҫɾ������
	if GetTask(TASK_FIELD_PVP_CAR_RAND) == 5 then
		Talk(1,"","S�n ph�m c�a ho�ng th�t, ch�c l� r�t c� gi� tr�!");
		return 0;
	end
	if DelItem(tPVPItemInfo[9][2],tPVPItemInfo[9][3],tPVPItemInfo[9][4],1) == 1 then
		local nPseudoRand = GetTask(TASK_FIELD_PVP_CAR_PSEUDORAND);
		SetTask(TASK_FIELD_PVP_CAR_PSEUDORAND,nPseudoRand+1);
		if nPseudoRand >= 29 then
			SetTask(TASK_FIELD_PVP_CAR_RAND,5);
		else
			local nRand = random(1,100);
			for i = 1,getn(tBCRand) do
				if nRand <= tBCRand[i] then
					SetTask(TASK_FIELD_PVP_CAR_RAND,i);
					break;
				end
			end
		end
		SetNpcLifeTime(nNpcIdx, 0);
		bt_create_biaoche();
	else
		Talk(1,"",g_NpcName.."Tr�n Vi�n Ho�n Ti�u L�nh tr�n ng��i kh�ng ��!");
	end
end

--����
function bt_Talk_2_2()
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 0 then
		Talk(1,"",g_NpcName.."Ti�u Xa c�a ng��i ��u? H�y mau xem th� c� ph�i b� m�t r�i kh�ng!");
		return 0;
	end
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID,nPosX,nPosY = GetWorldPos();
	if g_nDebugVersion ~= 1 then
		if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= nMapID then
			return 0;
		end
	end
	local nDistance = abs(nPosX-tPos[nMapID].bt[1][1])+abs(nPosY-tPos[nMapID].bt[1][2]);
	if nDistance > 40 then
		return 0;
	end
	local nRand = random(1,100);
	for i = 1,getn(tBCRand) do
		if nRand <= tBCRand[i] then
			SetTask(TASK_FIELD_PVP_CAR_RAND,i);
			break;
		end
	end
	if yp_getValue(3) < 15 then
		Talk(1,"",g_NpcName.."Tr� tinh l�c kh�ng ��!");
		return 0;		
	end
	--Ҫɾ��Ѻ��
	local nNeedCash = tonumber(TABLE_YunBiao:getCell(GetTask(TASK_FIELD_PVP_CAR_RAND)+1,2));
	if GetCash() < nNeedCash then
		Talk(1,"",g_NpcName.."Ng�n l��ng tr�n ng��i kh�ng ��!");
		return 0;
	end
	if Pay(nNeedCash) == 1 then
		yp_setValue(3,-15); --�۾���ֵ
		SetTask(TASK_FIELD_PVP_CAR_DAILY_NUM,GetTask(TASK_FIELD_PVP_CAR_DAILY_NUM)+1);
		bt_create_biaoche();
	end
end

function bt_create_biaoche()
	local nBCType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	local nNpcIdx = CreateNpc(tBiaoChe[nBCType][1],format("%s - %s",GetName(),tBiaoChe[nBCType][2]),GetWorldPos());
	if nNpcIdx > 0 then
		local nMaxLife,nCurLife = GetUnitCurStates(nNpcIdx,1);
		local nNpcID = GetNpcID(nNpcIdx);
		SetNpcLifeTime(nNpcIdx,30*60);
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if tAllCamp[nCamp] then
			SetCampToNpc(nNpcIdx,tAllCamp[nCamp]);
		end
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcRemoveScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcTempData(nNpcIdx, 1, nBCType)
		SetTask(TASK_FIELD_PVP_CAR_START,1);
		SetTask(TASK_FIELD_PVP_CAR_IDX,nNpcIdx);
		SetTask(TASK_FIELD_PVP_CAR_ID,nNpcID);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,nCurLife);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,GetTime());
		local nHour = tonumber(date("%H"));
		if nHour >= 20 and nHour <= 21 then
			SetTask(TASK_FIELD_PVP_CAR_DOUBLE,1);
		end
		if nBCType == 5 then
			SetTask(TASK_FIELD_PVP_CAR_PSEUDORAND,0);
			local strGlb = ""
			if g_nDebugVersion == 1 then
				strGlb = "Th�t L�c Nhai";
			else
				strGlb = tMainMapID[nCamp][2];
			end
			Msg2Global("��i hi�p "..GetName().." T� ch� t�ng ti�u ��u Tr�n Vi�n Ti�u C�c c�a th� l�c "..strGlb.." nh�n th�nh c�ng 1 Ti�u Xa Ho�ng Gia ch�a r�t nhi�u kho b�u qu� hi�m!");
		end
	end
end

function bt_Talk_3()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."��i hi�p kh�ng c� Ti�u Xa n�n kh�ng th� mua b�o hi�m!");
		return 0;
	end
	local nOldNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	if nType == 0 then
		return 0;
	end		
	local tMoney = {2000,3000,4000,5000,6000};
	Say(g_NpcName.."Hi�n t�i c�p Ti�u Xa c�a ��i hi�p l� <color=yellow>"..nType.."<color>, mua b�o hi�m c�n ti�u hao "..gf_GetMoneyString(tMoney[nType])..".",
		2,
		"\n��ng � mua b�o hi�m/bt_Talk_3_1",
		"\nKh�ng mua b�o hi�m/nothing")
end

function bt_Talk_3_1()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."��i hi�p kh�ng c� Ti�u Xa n�n kh�ng th� mua b�o hi�m!");
		return 0;
	end
	local nOldNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	if nType == 0 then
		return 0;
	end	
	local tMoney = {2000,3000,4000,5000,6000};
	if GetCash() < tMoney[nType] then
		Talk(1,"",g_NpcName.."Ng�n l��ng tr�n ng��i kh�ng ��!");
		return 0;
	end
	if GetTask(TASK_FIELD_PVP_CAR_TB) == nType then
		Talk(1,"",g_NpcName.."Ng��i �� mua b�o hi�m cho Ti�u Xa n�y r�i!");
		return 0;
	end
	if Pay(tMoney[nType]) == 1 then
		SetTask(TASK_FIELD_PVP_CAR_TB,nType);
		Talk(1,"",g_NpcName.."Ng��i mua b�o hi�m cho Ti�u Xa n�y!");
	end
end

function bt_Talk_4()
	local nHour = tonumber(date("%H"));
	if nHour < 20 or nHour > 21 then
		Talk(1,"",g_NpcName.."20:00-22:00 h�ng ng�y m�i c� th� nh�n nhi�m v� c��p ti�u.");
		return 0;
	end 
	Say(g_NpcName.."M�i ng�y ch� ���c nh�n 1 l�n nhi�m v� c��p ti�u!",
		3,
		"Nh�n nhi�m v� c��p ti�u/bt_Talk_4_1",
--		"��ɶ�������/bt_Talk_4_2",
		"tr� l�i/main",
		"K�t th�c ��i tho�i/nothing")
end

function bt_Talk_4_1()
	local nHour = tonumber(date("%H"));
	if nHour < 20 or nHour > 21 then
		Talk(1,"",g_NpcName.."20:00-22:00 h�ng ng�y m�i c� th� nh�n nhi�m v� c��p ti�u.");
		return 0;
	end
	if GetTask(TASK_FIELD_PVP_CAR_TASK) >= 1 then
		Talk(1,"",g_NpcName.."H�m n�y ng��i �� nh�n nhi�m v� n�y!");
		return 0;
	else
		local nJlz = yp_getValue(3);
		if nJlz < 5 then
			Talk(1,"",g_NpcName.."�i�m tinh l�c c�a ��i hi�p kh�ng ��!");
			return 0;
		end
		yp_setValue(3,-5);
		SetTask(TASK_FIELD_PVP_CAR_TASK,1);
		Talk(1,"",g_NpcName.."Ng��i �� nh�n nhi�m v� c��p ti�u!");
	end
end

function bt_Talk_5()
	local nState = GetTask(TASK_FIELD_PVP_CAR_TASK);
	local nType = 0;
	if nState == 1 then --������
		Talk(1,"",g_NpcName.."H�m nay v�n ch�a ho�n th�nh nhi�m v�!")
	elseif nState == 2 then
		if gf_Judge_Room_Weight(1,20,"") ~= 1 then
			return 0;
		end		
		for i = 10,14 do
			if BigGetItemCount(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4]) > 0 then
				if i > nType then
					nType = i;
				end
			end
		end
		if nType == 0 then
			Talk(1,"",g_NpcName.."Tr�n ng��i c�c h� kh�ng c� Ti�u K� �� �o�t!");
		else
			for i = 10,14 do
				local nCount = BigGetItemCount(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4]);
				if nCount > 0 then
					BigDelItem(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4],nCount);
				end
			end
			SetTask(TASK_FIELD_PVP_CAR_TASK, 3);
			yp_aw_giveAward_15(nType-9);
		end
	elseif nState == 3 then
		Talk(1,"",g_NpcName.."H�m nay ng��i �� ho�n th�nh nhi�m v� r�i!")
	else
		Talk(1,"",g_NpcName.."H�m nay ��i hi�p v�n ch�a nh�n nhi�m v� c��p ti�u ph�i kh�ng?");
	end
end

function bt_Talk_6()
	if GetTask(TASK_FIELD_PVP_CAR_BIAOLING) ~= 0 then
		Talk(1,"",g_NpcName.."H�m nay ng��i �� mua Tr�n Vi�n Ho�n Ti�u L�nh r�i, ng�y mai h�y quay l�i!");
		return nil;
	end
	if GetCash() < 10000 then
		Talk(1,"",g_NpcName.."Ng�n l��ng tr�n ng��i kh�ng ��!");
		return nil;		
	end
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return nil;
	end 	
	if Pay(10000) == 1 then
		SetTask(TASK_FIELD_PVP_CAR_BIAOLING,1);
		gf_AddItemEx({tPVPItemInfo[9][2],tPVPItemInfo[9][3],tPVPItemInfo[9][4],5,4},tPVPItemInfo[9][1]);
	end
end

function bt_Talk_8()
	local tSay = {
		"Ti�u Xa Th��ng/#bt_Talk_8_1(1)",
		"Ti�u Xa Quan Tr�ng/#bt_Talk_8_1(2)",
		"Ti�u Xa Qu�n D�ng/#bt_Talk_8_1(3)",
		"Ti�u Xa C� M�t/#bt_Talk_8_1(4)",
		"Ti�u Xa Ho�ng Gia/#bt_Talk_8_1(5)",
		"tr� l�i/t2_main",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("B�n mu�n ki�m tra ph�n th��ng c�a lo�i Ti�u Xa n�o?", getn(tSay), tSay);
end

function bt_Talk_8_1(nType)
	local tAward = {
		--���֣����飬��ǮG��������������Ϊ�������װ����Ƭ���콾��
		[1] = {"Ti�u Xa Th��ng", 1000000, 4, 30, 0, 1, 0, 0},
		[2] = {"Ti�u Xa Quan Tr�ng", 2000000, 8, 30, 0, 2, 0, 0},
		[3] = {"Ti�u Xa Qu�n D�ng", 3500000, 15, 30, 100, 3, 0, 0},
		[4] = {"Ti�u Xa C� M�t", 6000000, 30, 30, 100, 4, 1, 0},
		[5] = {"Ti�u Xa Ho�ng Gia", 10000000, 50, 30, 100, 5, 1, 1},
	}
	local tSubAward = tAward[nType];
	local sTitle = "<color=green>%s<color>-ph�n th��ng:\n\n<color=yellow>%d EXP, %d v�ng, danh v�ng th� l�c %d, tu vi %d, Ho�n Ti�u L�nh*%d, M�nh Trang B�*%d, Thi�n Ki�u L�nh*%d<color>"
	local tSay = {
		"tr� l�i/bt_Talk_8",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say(format(sTitle, tSubAward[1], tSubAward[2], tSubAward[3], tSubAward[4], tSubAward[5], tSubAward[6], tSubAward[7], tSubAward[8])
		, getn(tSay), tSay)
end