--file function :Vn activity base class info
--function design:cunzhang
--develop date 5-17-2011
--modify list: liubo
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online_activites\\head\\activity_normal_head_string.lua")
Include("\\script\\online_activites\\activity_head.lua")
Include("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")

TB_VN_ACTIVITY_MAIN = {}

EVENT_LOG_TITLE = "Hoat dong thang 11 nam 2014"
SVN_ACTIVITY_INI_FILE = "\\script\\online_activites\\ini\\VnOnlineMain.ini"
g_objVNAcitivityInfo = ff_GetIniFileObj(SVN_ACTIVITY_INI_FILE)
if g_objVNAcitivityInfo:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SVN_ACTIVITY_INI_FILE)
end

--锦囊大事件处理
function CLASS_ACTIVITY:JinNangOpen()
	local nTag = 0;
	local tbSayDialog = {};
	local szSayHead = "";
	if self:OnlineTimeChk() == 1 then
		nTag = 1;
		szSayHead = self:CreateActivityHead()
		--兑换选项
		for i = 1,self.nItemChgNum do
--			tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#gf_VnItemChgDeal(\""..self.sActivityChgKey.."Chg"..tostring(i).."\")")
			--tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#gf_VnItemChgDeal("..tonumber(self.sActivityChgKey)..","..tonumber(i)..")");
			
			if i == 1 then
				tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#VNG_DoiEvent_Form1(\""..self.sActivityChgKey.."Chg"..tostring(i).."\")")
			elseif i == 2 then
				--tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#VNG_DoiEvent_Form2(\""..self.sActivityChgKey.."Chg"..tostring(i).."\")")
				--tinsert(tbSayDialog,"фi 1hoa 3/8(c莕 5 gi蕐 b鉵g ki課g + 5 b� c鴑g + 2 xu v藅 ph萴)/VNG_DoiEvent_Form2")
			end
		end
		for i = 1,getn(self.tbPrizeItemInfo) do
			if getn(self.tbPrizeItemInfo[i].tbExpPrizeNum) == 2 and self.nPrizeMode ~= 1 then
				tinsert(tbSayDialog,format(self.tbHintString[2].."/#gf_VnSetActivityPrizeModel("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
			end
			if self.tbPrizeItemInfo[i].nItemUseTimesMax then
				if self.tbPrizeItemInfo[i].nTaskIdGetFinalPrize ~= 0 then
					tinsert(tbSayDialog,format(self.tbHintString[3][1].."/#Vet_Activity_GetLastPrize("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
				end
				if self.nPrizeMode == 1 then
					tinsert(tbSayDialog,format(self.tbHintString[3][2].."/#Vet_Activity_GetCapsValuePrize("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
				end	
				--查看使用数量
				tinsert(tbSayDialog,format(self.tbHintString[13].."/#Vet_ShowUsedCount("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
			end
		end
		for nIep = 1, self.nItemExcgPrizeCount do
			if getn(self.tbItemExchangePrize[nIep]) == 4 then
				tinsert(tbSayDialog,format(self.tbHintString[16].."/#Vet_ItemExchangePrize("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..nIep..")",self.tbItemExchangePrize[nIep][4]))
			end
		end
		if self.nFlag == 1 then
			tinsert(tbSayDialog,self.tbHintString[15].."/#Vet_Activity_GetLastPrizeBoth("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..")");
		end
	end
	return tbSayDialog,szSayHead,nTag;
end

function CLASS_ACTIVITY:CreateActivityHead()
	local sStartTime = GetEventStartDate(self.nActivityID)
	local nEndTime = GetEventEndDate(self.nActivityID)
	local sTimString = "ng祔 "..tostring(tonumber(strsub(sStartTime,7,8))).." th竛g "..tostring(tonumber(strsub(sStartTime,5,6))).." n╩ "..tostring(strsub(sStartTime,1,4))
	sTimString = sTimString.." n 24:00".." ng祔 "..tostring(tonumber(strsub(nEndTime,7,8)) - 1).." th竛g "..tostring(tonumber(strsub(nEndTime,5,6))).." n╩ "..tostring(strsub(nEndTime,1,4))
--	if strsub(sStartTime,1,4) ~= strsub(nEndTime,1,4) then
--		sTimString = sTimString.." n╩ "..tostring(strsub(sStartTime,1,4))
--	end
	return  format(self.tbHintString[1],self.sActivityName,sTimString)
end

--活动开放时间判断
function CLASS_ACTIVITY:OnlineTimeChk()
	return gf_CheckEventDateEx(self.nActivityID)
end

--开启获取奖励
function CLASS_ACTIVITY:ItemPrizeOnUse(nItemIndex,nItemSeq)
	--时间检测
	if self:OnlineTimeChk() ~= 1 then
		Talk(1,"",self.tbHintString[8])
		return
	end
	local tbPrizeItemInfo = self.tbPrizeItemInfo[nItemSeq]
	local nUseTimes = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdUseItemTimes)
	local nPrizeType = 1
	--使用上限判断
	if tbPrizeItemInfo.nItemUseTimesMax and tbPrizeItemInfo.nItemUseTimesMax ~= 0 then
		if nUseTimes >= tbPrizeItemInfo.nItemUseTimesMax then
			Talk(1,"",format(self.tbHintString[5],tbPrizeItemInfo.tbItemInfo[4],tbPrizeItemInfo.nItemUseTimesMax))
			return
		end
	end
	if self.nPrizeMode ~= 1 then
		--兑换规则检测
		if getn(tbPrizeItemInfo.tbExpPrizeNum) == 2 then
			nPrizeType = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdPrizeType)
			if nPrizeType == 0 then
				self:PrizeTypeSel(nItemSeq)
				return
			end
		end
	end
	--背包空间判断
	if tbPrizeItemInfo.nPrizeAdditionalTimes > 0 and mod((nUseTimes + 1),tbPrizeItemInfo.nPrizeAdditionalTimes) == 0 then
		if gf_Judge_Room_Weight(tbPrizeItemInfo.tbAdditionalPrize.tbItemRoomWeight[1],tbPrizeItemInfo.tbAdditionalPrize.tbItemRoomWeight[2],"") ~= 1 then
			return
		end
	else
		if gf_Judge_Room_Weight(tbPrizeItemInfo.tbNormalPrize.tbItemRoomWeight[1],tbPrizeItemInfo.tbNormalPrize.tbItemRoomWeight[2],"") ~= 1 then
			return
		end
	end
	--普通奖励处理
	if DelItemByIndex(nItemIndex,1) ~= 1 then
		return
	else
		if self.nPrizeMode ~= 1 then
			if nPrizeType == 1 then		--模式1
				if tbPrizeItemInfo.tbExpPrizeNum[1] > 0 then
					ModifyExp(tbPrizeItemInfo.tbExpPrizeNum[1]);
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[1] > 0 then
						gf_EventGiveCustomAward(3, tbPrizeItemInfo.bHaveThings[1], 1);
					end
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[2] > 0 then
						gf_EventGiveCustomAward(4, tbPrizeItemInfo.bHaveThings[2], 1);
					end
				end
				if getn(tbPrizeItemInfo.tbPrizeCondition) == 2 and tbPrizeItemInfo.tbPrizeCondition[1] ~= 0 then
					self:GiveItemPrize(tbPrizeItemInfo.tbNormalPrize.tbPrizeInfo1,tbPrizeItemInfo.tbNormalPrize.nRandomBase1,format(self.tbHintString[10][1],tbPrizeItemInfo.tbItemInfo[4]))
				end
				--是否有特殊次数的处理（模式1和模式2都有特殊次数奖励）
				if tbPrizeItemInfo.nPrizeAdditionalTimes > 0 and mod((nUseTimes + 1),tbPrizeItemInfo.nPrizeAdditionalTimes) == 0 then
					self:GiveItemAdditionPrize(tbPrizeItemInfo.tbAdditionalPrize,format(self.tbHintString[10][2],tbPrizeItemInfo.tbItemInfo[4]))
					--self:OnGetItemAddionalPrize(nUseTimes + 1)
				end
			else		--模式2
				if tbPrizeItemInfo.tbExpPrizeNum[2] > 0 then
					ModifyExp(tbPrizeItemInfo.tbExpPrizeNum[2]);
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[1] > 0 then
						gf_EventGiveCustomAward(3, tbPrizeItemInfo.bHaveThings[1], 1);
					end
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[2] > 0 then
						gf_EventGiveCustomAward(4, tbPrizeItemInfo.bHaveThings[2], 1);
					end
				end
				Msg2Player("tbPrizeItemInfo: "..getn(tbPrizeItemInfo));
				Msg2Player("tbPrizeCondition: "..getn(tbPrizeItemInfo.tbPrizeCondition));
				if getn(tbPrizeItemInfo.tbPrizeCondition) == 2 and tbPrizeItemInfo.tbPrizeCondition[2] ~= 0 then
					self:GiveItemPrize(tbPrizeItemInfo.tbNormalPrize.tbPrizeInfo2,tbPrizeItemInfo.tbNormalPrize.nRandomBase2,format(self.tbHintString[10][1],tbPrizeItemInfo.tbItemInfo[4]))
				end
				--是否有特殊次数的处理（模式1和模式2都有特殊次数奖励）
				if tbPrizeItemInfo.nPrizeAdditionalTimes > 0 and mod((nUseTimes + 1),tbPrizeItemInfo.nPrizeAdditionalTimes) == 0 then
					self:GiveItemAdditionPrize(tbPrizeItemInfo.tbAdditionalPrize,format(self.tbHintString[10][2],tbPrizeItemInfo.tbItemInfo[4]))
					--self:OnGetItemAddionalPrize(nUseTimes + 1)
				end
			end
		elseif self.nPrizeMode == 1 then
			self:GivePmModePrize(nItemSeq)
		end
		--使用次数处理
		if tbPrizeItemInfo.nItemUseTimesMax then
			Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdUseItemTimes,(nUseTimes + 1))
			local msg = ""
			if tbPrizeItemInfo.nItemUseTimesMax ~= 0 then
				msg = msg..format(self.tbHintString[11][1],tbPrizeItemInfo.tbItemInfo[4],(nUseTimes + 1),tbPrizeItemInfo.nItemUseTimesMax)
			end
			if self.nPrizeMode == 1 then
				msg = msg..","..format("觤 t輈h l騳 l� <color=green>%d<color>", Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1], self.tbTaskGroup[2], tbPrizeItemInfo.nPmAccPoint))
			end
--			Talk(1,"",msg)
		end
	end
end
--奖励模式选取
function CLASS_ACTIVITY:PrizeTypeSel(nItemSeq)
	local tbItemPrizeInfo = self.tbPrizeItemInfo[nItemSeq]
	if not tbItemPrizeInfo.tbExpPrizeName or getn(tbItemPrizeInfo.tbExpPrizeName) ~= 2 then
		Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2], tbItemPrizeInfo.nTaskIdPrizeType, 1)
		return
	end
	if getn(tbItemPrizeInfo.tbExpPrizeNum) == 2 then
		Say(format(self.tbHintString[9][1],tbItemPrizeInfo.tbItemInfo[4]),
			3,
			format(self.tbHintString[9][2][1],format(tbItemPrizeInfo.tbExpPrizeName[1],tbItemPrizeInfo.tbExpPrizeNum[1]),self.tbTaskGroup[1],self.tbTaskGroup[2],tbItemPrizeInfo.nTaskIdPrizeType, 1),
			format(self.tbHintString[9][2][2],format(tbItemPrizeInfo.tbExpPrizeName[2],tbItemPrizeInfo.tbExpPrizeNum[2]),self.tbTaskGroup[1],self.tbTaskGroup[2],tbItemPrizeInfo.nTaskIdPrizeType, 1),
			self.tbHintString[9][2][3]
		)
	end
end
--获取最终奖励
function CLASS_ACTIVITY:GetFinalPrize(nItemSeq,nPrizeDiff,nOrder,nIndex)
	--时间检测
	if self:OnlineTimeChk() ~= 1 then
		Talk(1,"",self.tbHintString[8])
		return
	end
	--经脉是否打通
	if nPrizeDiff == 9 or nPrizeDiff == 40 then
		if MeridianGetLevel() < 1 then
			Msg2Player("C竎 h� ch璦 k輈h ho箃 Kinh M筩h, kh玭g th� nh薾 頲 Ch﹏ Kh�.")
			return 0;
		end
		--经脉剩余气海不足
		if MeridianGetLeftGenuineQiCapcity() < 1500 then
			Msg2Player("Kh� h秈 c馻 thi誹 hi謕 kh玭g  kh玭g th� nh薾 ch﹏ kh�");
			return 0;
		end
	end
	--接了转生1的任务才能领此奖励
	if nPrizeDiff == 26 then
		if VetInterface_ConditionCheck1() ~= 1 then
			Msg2Player("Ch� c� nh﹏ v藅 nh薾 nhi謒 v� ph鬰 sinh 1 m韎 c� th� nh薾 ph莕 thng n祔");
			return 0;
		end
	end
	if nPrizeDiff == 27 or nPrizeDiff == 37 then	--or nPrizeDiff == 49
		if VetInterface_ConditionCheck1_6() ~= 1 then
			Msg2Player("Ch� c� nh﹏ v藅 nh薾 nhi謒 v� ph鬰 sinh 1 ( tr飊g sinh 6) m韎 c� th� nh薾 ph莕 thng n祔");
			return 0;
		end
	end
	if nPrizeDiff == 49 or nPrizeDiff == 57 then
		local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		if nGetQuest < 1 then
			Talk(1, "", "C竎 h� ch璦 nh薾 nhi謒 v� ph鬰 sinh b筺 ng h祅h.")
			return 0
		end
		if nGetQuest >= 2 then
			Talk(1, "", "C竎 h�  ho祅 th祅h nhi謒 v� ph鬰 sinh b筺 ng h祅h.")
			return 0
		end
	end
	if nPrizeDiff == 55 then
		local nLevel = mod(TASK_VNG_PET,100)
		if nLevel < 2 then
				Msg2Player("B筺 ch璦 c� PET c蕄 1 n猲 kh玭g th� nh薾 ph莕 thng n祔")
				return 0
		end
	end
--	if nPrizeDiff == 37 then	--and VetInterface_Reborn_ConditionCheck() ~= 1
--		return 0;
--	end
	--还要判断一次
	if self.tbPrizeItemInfo[nItemSeq] == nil then
		return
	end
	local tbPrizeInfo = self.tbPrizeItemInfo[nItemSeq]
	--判断是否有最终奖励
	if tbPrizeInfo.nItemUseTimesMax == nil then
		return
	end
	--判断游戏时间
	if self:OnlineTimeChk() ~= 1 then
		return
	end
	--判断次数
	local nUseTimes = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdUseItemTimes)
	if nUseTimes < tbPrizeInfo.nItemUseTimesMax then
		Talk(1,"",format(self.tbHintString[6],tbPrizeInfo.tbItemInfo[4],tbPrizeInfo.nItemUseTimesMax))
		return
	end
	if self.nFinalPrizeMode == 0 then 
		--是否领取判断
		if Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize) == 1 then
			Talk(1,"",self.tbHintString[7])
			return
		else
			--空间负重判断
			if tbPrizeInfo.tbFinalPrize and tbPrizeInfo.tbFinalPrize.tbItemRoomWeight and gf_Judge_Room_Weight(tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[1],tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[2],"") ~= 1 then
				return 0
			end
			--奖励处理
			if tbPrizeInfo.tbFinalPrize.tbPrizeInfo then
				--消耗处理
				if nPrizeDiff == 37 and VetInterface_Reborn_ConditionCheck() ~= 1 then
					return 0;
				end
--				if nPrizeDiff == 57 and Vet_Complete_Revive_OnePartner_FirstStage_check() ~= 1 then
--					return 0;
--				end
--				if nPrizeDiff == 58 and Vet_Complete_Revive_OnePartner_SecondStage_check() ~= 1 then
--					return 0;
--				end
				if nPrizeDiff ~= 58 then
					Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize,1)
					self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
				end
			end
			self:OnGetFinalPrize(nPrizeDiff,nOrder)
		end
	elseif self.nFinalPrizeMode == 1 then
		--是否领取判断
		if nIndex - 1 > 0 then
			if Vet_Activity_GetItemUseInfoBit(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize, nIndex - 1) ~= 1 then
				Talk(1,"",self.tbHintString[17])
				return
			end
		end
		if Vet_Activity_GetItemUseInfoBit(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize, nIndex) == 1 then
			Talk(1,"",self.tbHintString[7])
			return
		else
			--空间负重判断
			if tbPrizeInfo.tbFinalPrize and tbPrizeInfo.tbFinalPrize.tbItemRoomWeight and gf_Judge_Room_Weight(tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[1],tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[2],"") ~= 1 then
				return 0
			end
			--奖励处理
			if tbPrizeInfo.tbFinalPrize.tbPrizeInfo then
				Vet_Activity_SetItemUseInfoBit(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize, nIndex, 1)
				self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
			end
			self:OnGetFinalPrize(nPrizeDiff,nOrder)
		end
	end
end

--给予奖励
function CLASS_ACTIVITY:GiveItemAdditionPrize(tbItemPrizeInfo,szLog)
	gf_EventGiveRandAward(tbItemPrizeInfo.tbPrizeInfo,tbItemPrizeInfo.nRandomBase,1,self.sActivityName,szLog)
end

function CLASS_ACTIVITY:GiveItemPrize(tbItemPrizeTable,nRandomBase,szLog)
	gf_EventGiveRandAward(tbItemPrizeTable,nRandomBase,1,self.sActivityName,szLog)
end

--每次使用道具奖励
function CLASS_ACTIVITY:GivePmModePrize(nItemSeq)
	local nPmAccPoint = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1], self.tbTaskGroup[2], self.tbPrizeItemInfo[nItemSeq].nPmAccPoint)
	local tPoint = {
  	{1, 60},
  	{2, 24},
  	{3, 10},
  	{4, 5},
  	{5, 1},
  }
  local nRand = gf_GetRandItemByTable(tPoint, gf_SumRandBase(tPoint), 1)
	Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1], self.tbTaskGroup[2], self.tbPrizeItemInfo[nItemSeq].nPmAccPoint, nPmAccPoint + tPoint[nRand][1])
	Msg2Player(format("B筺 nh薾 頲 %d 甶觤 t輈h l騳 ", tPoint[nRand][1]))
	if type(self.tbPrizeItemInfo[nItemSeq].tbPmFuncPrize) == "string" then
		dostring(self.tbPrizeItemInfo[nItemSeq].tbPmFuncPrize)
	else
		print("ERROR:dostring(self.tbPrizeItemInfo[nItemSeq].tbPmFuncPrize)")	
	end
end

--ipairs 添加
ipairs = ipairs or function(t)
	for i,v in t do
		if i == "n" then
			t[i]= nil
		end
	end
 return t
end

--服务器启动调用
function ServerStartUp(nStartTime,nEndTime)
end

--玩家登陆调用
function PlayerLogin(bExchangeComing,nStartTime,nEndTime)
end

--活动变量处理
function Vet_Activity_GetItemUseInfo(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	return g_objVetAcitivityTaskGroupTemp:GetTask(nTaskIDSeq)
end

function Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq,nTaskValue,bSetType)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	if bSetType and bSetType == 1 then
		if nTaskValue == 1 then
			Msg2Player("Ch鋘 h譶h th鴆 ph莕 thng 1");
		elseif nTaskValue == 2 then
			Msg2Player("Ch鋘 h譶h th鴆 ph莕 thng 2");
		end
	end
	return g_objVetAcitivityTaskGroupTemp:SetTask(nTaskIDSeq,nTaskValue)
end

function Vet_Activity_GetItemUseInfoBit(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq, nBit)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	return g_objVetAcitivityTaskGroupTemp:GetTaskBit(nTaskIDSeq, nBit)
end

function Vet_Activity_SetItemUseInfoBit(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq, nBit, nTaskValue)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	return g_objVetAcitivityTaskGroupTemp:SetTaskBit(nTaskIDSeq, nBit, nTaskValue)
end

--奖励模式选取
function gf_VnSetActivityPrizeModel(nTaskGrouId,nTaskIDSeq,nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if tbActivity then tbActivity:PrizeTypeSel(nItemSeq) end
end

--选择最终奖励
function Vet_Activity_SelLastPrize(nTaskGrouId,nTaskIDSeq,nItemSeq,nPrizeDiff,nOrder,nIndex)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if tbActivity then tbActivity:GetFinalPrize(nItemSeq,nPrizeDiff,nOrder,nIndex) end
end

--使用次数查看
function Vet_ShowUsedCount(nTaskGrouId,nTaskIDSeq,nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local PrizeItemInfo = tbActivity.tbPrizeItemInfo[nItemSeq]
	local nUseTimes = Vet_Activity_GetItemUseInfo(nTaskGrouId,nTaskIDSeq,PrizeItemInfo.nTaskIdUseItemTimes)
	Talk(1,"",format(tbActivity.tbHintString[11][1],PrizeItemInfo.tbItemInfo[4],nUseTimes,PrizeItemInfo.nItemUseTimesMax))
end

function Vet_Activity_GetLastPrize(nTaskGrouId,nTaskIDSeq,nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tTempSel = tbActivity.tbPrizeItemInfo[nItemSeq].tbFinalPrize.sel
	local tTempPriKind = tbActivity.tbPrizeItemInfo[nItemSeq].tbFinalPrize.tbFinalPrizeKind
	local tTempDiaSel = {}
	if  tTempSel ~= nil and tTempPriKind ~= nil and getn(tTempSel) == getn(tTempPriKind) then
		for j = 1,getn(tTempSel) do
			if tTempSel[j] ~= nil and tTempSel[j] ~= 0 and tTempPriKind[j] ~= nil and tTempPriKind[j] ~= 0 then
				if tTempSel[j] == -1 then
					tinsert(tTempDiaSel,format(tbActivity.tbHintString[12][tTempPriKind[j]],nTaskGrouId,nTaskIDSeq,nItemSeq,tTempSel[j],j))
				else
					tinsert(tTempDiaSel,format(tbActivity.tbHintString[12][tTempPriKind[j]],tTempSel[j],nTaskGrouId,nTaskIDSeq,nItemSeq,tTempSel[j],j))
				end
			end
		end
		tinsert(tTempDiaSel,tbActivity.tbHintString[14])
		Say(tbActivity.tbHintString[12][1],	getn(tTempDiaSel), tTempDiaSel);
	else
		print("ERROR:Vet_Activity_GetLastPrize()")
	end
	return
end

--获取积分奖励
function Vet_Activity_GetCapsValuePrize(nTaskGrouId, nTaskIDSeq, nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tbPrizeInfo = tbActivity.tbPrizeItemInfo[nItemSeq].tbPmPrizeInfo
	local nPmAccPoint = Vet_Activity_GetItemUseInfo(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmAccPoint)
	local nSize = getn(tbPrizeInfo)
	if nSize > 31 then
		print("UDERROR: Vet_Activity_GetCapsValuePrize nSize > 31")
		return
	end
	local tbSay = {}
	for i = 1, nSize do
		local k = tbPrizeInfo[i];
		if k then
			local nIsAward = Vet_Activity_GetItemUseInfoBit(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmUsePrizeTag, i)
			local nCount = 0
			if k[2] == "item" then
				nCount = k[3][4]
			elseif k[2] == "function" then
				nCount = k[5]
			end
			if nCount > 0 then
				if nIsAward == 1 then
					tinsert(tbSay, {format("觤 t輈h l騳 %d nh薾 頲 [%s]*%d", k[1], k[4], nCount).."(  nh薾 thng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
				else
					if nPmAccPoint >= k[1] then
						tinsert(tbSay, {format("觤 t輈h l騳 %d nh薾 頲 [%s]*%d", k[1], k[4], nCount).."( c� th� nh薾 thng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					else
						tinsert(tbSay, {format("觤 t輈h l騳 %d nh薾 頲 [%s]*%d", k[1], k[4], nCount), format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					end
				end
			else
				if nIsAward == 1 then
					tinsert(tbSay, {format("觤 t輈h l騳 %d nh薾 頲 [%s]",k[1], k[4]).."(  nh薾 thng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
				else
					if nPmAccPoint >= k[1] then
						tinsert(tbSay, {format("觤 t輈h l騳 %d nh薾 頲 [%s]", tonumber(k[1]), k[4]).."( c� th� nh薾 thng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					else
						tinsert(tbSay, {format("觤 t輈h l騳 %d nh薾 頲 [%s]", tonumber(k[1]), k[4]), format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					end
				end
			end
		end
	end
	tinsert(tbSay, {"\nK誸 th骳 i tho筰", "nothing"})
	local tempSay = {};
	tempSay.msg = format("V藅 d鬾g hi謓 t筰 <color=gold>%s<color> 甶觤 t輈h l騳 l� <color=green>%d<color> , %s b筺 mu鑞 nh薾 ph莕 thng n祇 ?", tbActivity.tbPrizeItemInfo[nItemSeq].tbItemInfo[4], nPmAccPoint, gf_GetPlayerSexName())
	tempSay.sel = tbSay
	temp_Talk(tempSay);
end

function Vet_Activity_GetCapsValuePrize_Deal(nTG, nTS, nIS, nIdx, nIA)
	local nTaskGrouId = tonumber(nTG)
	local nTaskIDSeq  = tonumber(nTS)
	local nItemSeq    = tonumber(nIS)
	local nIndex      = tonumber(nIdx)
	local nIsAward    = tonumber(nIA)
	if nIsAward == 1 then
		Talk(1,"","B筺  nh薾 ph莕 thng n祔 r錳 ")
		return
	end
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tbPrizeInfo = tbActivity.tbPrizeItemInfo[nItemSeq].tbPmPrizeInfo
	local tK = tbPrizeInfo[nIndex]
	if not tK then return end
	local nPmAccPoint = Vet_Activity_GetItemUseInfo(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmAccPoint)
	if nPmAccPoint < tK[1] then
		Talk(1,"","觤 t輈h l騳 kh玭g  , kh玭g th� nh薾 thng ")
		return
	end
	if "item" == tK[2] or "function" == tK[2] then
		if gf_Judge_Room_Weight(tK[6], tK[6]) ~= 1 then
			Talk(1,"",format("T骾 thi誹  <color=red>%d � <color>", tK[6]))
			return 0
		end
	end
	Vet_Activity_SetItemUseInfoBit(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmUsePrizeTag, nIndex, 1)
	if tK[2] == "item" then
		gf_AddItemEx2(tK[3], tK[4], "2XU v藅 ph萴", "nh薾 ph莕 thng t輈h l騳 甶觤 ", tK[5] or 0, 1)
	elseif tK[2] == "exp" then
		gf_ModifyExp(tK[3])
	elseif tK[2] == "function" then
		dostring(tK[3])
	end
end

--使用道具兑换奖励
function Vet_ItemExchangePrize(nTaskGrouId,nTaskIDSeq,nSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tItem = tbActivity.tbItemExchangePrize[nSeq]
	if not tItem or getn(tItem) ~= 4 then
		return
	end
	local tAward = tbActivity.tbIEPAward[nSeq]
	if not tAward or getn(tAward) < 1 then
		return
	end
	local tSay = {}
	for i = 1, getn(tAward) do
		local v = tAward[i];
		local msg = ""
		if v[2] == "exp" or v[2] == "rep" or v[2] == "shimen" then
			msg = v[4]..format("(ti猽 hao %d c竔%s)", v[1], tItem[4])
		elseif  v[2] == "item" then
			msg = v[4]..format("*%d(ti猽 hao %d c竔%s)", v[3][4], v[1], tItem[4])
		elseif v[2] == "function" then
			msg = v[4]..format("*%d(ti猽 hao %d c竔%s)", v[5] or 1, v[1], tItem[4])
		end
		tinsert(tSay, {msg, "#Vet_ItemExchangePrize_Deal("..nTaskGrouId..","..nTaskIDSeq..","..i..","..nSeq..")"});
	end
	tinsert(tSay, {"\n T筰 h� ch� xem qua th玦", "nothing"});
	local tempSay = {};
	tempSay.msg = format("b筺 mu鑞 s� d鬾g <color=green>%s<color> i c竔 g� ?", tItem[4])
	tempSay.sel = tSay
	temp_Talk(tempSay);
	return
end

function Vet_ItemExchangePrize_Deal(nTaskGrouId, nTaskIDSeq, i, nSeq)
	local tbActivity = gf_VnGetActivityByGroupId(tonumber(nTaskGrouId), tonumber(nTaskIDSeq))
	if not(tbActivity) then return end
	local tItem = tbActivity.tbItemExchangePrize[tonumber(nSeq)]
	if not tItem or getn(tItem) ~= 4 then
		return
	end
	local tAward = tbActivity.tbIEPAward[tonumber(nSeq)]
	if not tAward or getn(tAward) < 1 then
		return
	end
	local v = tAward[tonumber(i)]
	if v[2] == "item" or v[2] == "function" then
		if gf_Judge_Room_Weight(v[6], v[6]) ~= 1 then
			Talk(1,"",format("t骾  y %d", v[6]))
			return
		end
	end
	if GetItemCount(tItem[1], tItem[2], tItem[3]) < v[1] then
		Talk(1,"",format("v藅 ph萴 %s# s� lng kh玭g  <color=red>%d<color> c竔", tItem[4], v[1]))
		return
	end
	if DelItem(tItem[1], tItem[2], tItem[3], v[1]) ~= 1 then
		return
	end
	if v[2] == "exp" then
		gf_Modify("Exp", v[3])
	elseif v[2] == "rep" then
		gf_Modify("Rep", v[3])
	elseif v[2] == "shimen" then
		gf_EventGiveCustomAward(4, v[3], 1, "2XU v藅 ph萴", "v藅 ph萴  i ph莕 thng ")
	elseif v[2] == "item" then
		gf_AddItemEx2(v[3], v[4], "2XU v藅 ph萴", "v藅 ph萴  i ph莕 thng ", v[5], 1)
	elseif v[2] == "function" then
		dostring(v[3])
	end
end

--获取活动选项
function get_tbJNDialog_info(tbActivityID)
	local tbSayDialog = {};
	local szSayHead = "";
	local nTag = 0;
	if not tbActivityID then
		return tbSayDialog, szSayHead, "";
	end
	--返回第一个指定ID的活动
	for i = 1, getn(tbActivityID) do
		local nActivityID = tbActivityID[i];
		if nActivityID > 0 and nActivityID <= GetEventCount() then
			if TB_VN_ACTIVITY_MAIN[nActivityID] then
				tbSayDialog, szSayHead, nTag = TB_VN_ACTIVITY_MAIN[nActivityID]:JinNangOpen();
				if nTag == 1 then
					return tbSayDialog, szSayHead, TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName;
				end
			end
		end
	end
	return tbSayDialog, szSayHead, "";
end

--由TaskGroupid等信息定位
function gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	for i,_ in ipairs(TB_VN_ACTIVITY_MAIN) do
		if TB_VN_ACTIVITY_MAIN[i]:OnlineTimeChk() == 1 and TB_VN_ACTIVITY_MAIN[i].tbTaskGroup[1] == nTaskGrouId and TB_VN_ACTIVITY_MAIN[i].tbTaskGroup[2] == nTaskIDSeq then
			return TB_VN_ACTIVITY_MAIN[i]
		end
	end
	return nil;
end
--由活动ID定位活动
function gf_VnGetActivityByID(nID)
	return TB_VN_ACTIVITY_MAIN[nID],1
end
--由物品信息定位活动
function gf_VnGetActivityByItemIndex(nItemIndex)
	local nItemId,nDetaiId,nParticularId = GetItemInfoByIndex(nItemIndex)
	for i,_ in ipairs(TB_VN_ACTIVITY_MAIN) do
			if TB_VN_ACTIVITY_MAIN[i]:OnlineTimeChk() == 1 then
				for nItemSeq = 1,getn(TB_VN_ACTIVITY_MAIN[i].tbPrizeItemInfo) do
					local tbItemInfo = TB_VN_ACTIVITY_MAIN[i].tbPrizeItemInfo[nItemSeq].tbItemInfo
					if tbItemInfo and tbItemInfo[1] == nItemId and tbItemInfo[2] == nDetaiId and tbItemInfo[3] == nParticularId then
						return TB_VN_ACTIVITY_MAIN[i],nItemSeq
					end
				end
			end
	end
	return nil, nil;
end
--由时间定位活动信息
function gf_VnGetActivityByTime()
	local tActivityId = {}
	for i,_ in ipairs(TB_VN_ACTIVITY_MAIN) do
		if TB_VN_ACTIVITY_MAIN[i]:OnlineTimeChk() == 1 then
			tinsert(tActivityId,i)
		end
	end
	return tActivityId
end

--normal task-prize api functions

--天门阵获得活动道具
function vaf_TianMenZhen_Award_Api(nType)
	local tActivityId = gf_VnGetActivityByTime()
	for _,nActivityID in ipairs(tActivityId) do
		local tPrizeInfo = g_objVNAcitivityInfo:GetMixTable(tostring(TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID),"tJoinTianMenZhen")
		if (tPrizeInfo) then
			if type(tPrizeInfo[1]) == "table" then
				for i = 1,getn(tPrizeInfo) do
					if nType == 1 then
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][5]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi猲 M玭 tr薾")
					elseif nType == 2 then
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][6]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi猲 M玭 tr薾")
					elseif nType == 3 then
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][7]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi猲 M玭 tr薾")
					else
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][4]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi猲 M玭 tr薾")
					end
				end
			else
				if nType == 1 then
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[5]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi猲 M玭 tr薾")
				elseif nType == 2 then
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[6]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi猲 M玭 tr薾")
				elseif nType == 3 then
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[7]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi猲 M玭 tr薾")
				else
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi猲 M玭 tr薾")
				end
			end
		end
	end
end

VAF_AWARD_API_TABLE = {
	["tPlantSmallTreePrize"] = "Tr錸g C﹜ B竧 Nh� Nh�",   
	["tPlantBigTreePrize"] = "Tr錸g C﹜ B竧 Nh� L韓", 
	["tOpenSeedBagPrize"] = "M� T骾 H箃 Gi鑞g", 
	["tLiangShanKillBoss"] = "Lng S琻 ti猽 di謙 BOSS", 
	["tLiangShanDailyTask"] = "Lng S琻 vt 秈 nhi謒 v� h籲g ng祔", 
	["tWanJianZhong"] = "Qua 秈 V筺 Ki誱 Tr騨g", 
	["tTongTianHuanJing"] = "Qua 秈 Th玭g Thi猲", 
	["tPlant4LingTree"] = "Tr錸g C﹜ T� Linh", 
	["tPlantSeedTree"] = "Tr錸g C﹜ H箃 Gi鑞g",
	["tLiangShanJinBox"] = "Lng S琻-Rng V祅g",
	["tLiangShanYinBox"] = "Lng S琻-Rng B筩",
	["tLiangShanTongBox"] = "Lng S琻-Rng уng",
	["tWjzDailyTask"] = "Nhi謒 v� V筺 Ki誱 Tr騨g",
	["tWjzJinBox"] = "V筺 Ki誱 Tr騨g-Rng V祅g",
	["tWjzYinBox"] = "V筺 Ki誱 Tr騨g-Rng B筩",
	["tWjzTongBox"] = "V筺 Ki誱 Tr騨g-Rng уng",
	["tDXGDailyTask"] = "Nhi謒 v� мa Huy襫 Cung",
	["tDXGJinBox"] = "мa Huy襫 Cung-Rng V祅g",
	["tDXGYinBox"] = "мa Huy襫 Cung-Rng B筩",
	["tDXGTongBox"] = "мa Huy襫 Cung-Rng уng",
	["tTYTJinBox"] = "Rng V祅g Th竔 Nh蕋 Th竝-Thng",
	["tTYTYinBox"] = "Rng B筩 Th竔 Nh蕋 Th竝-Thng",
	["tTYTTongBox"] = "Rng уng Th竔 Nh蕋 Th竝-Thng",
	["tTYTJinBox_H"] = "Th竔 Nh蕋 Th竝 Anh H飊g_Rng V祅g",
	["tTYTYinBox_H"] = "Th竔 Nh蕋 Th竝 Anh H飊g_Rng B筩",
	["tTYTTongBox_H"] = "Th竔 Nh蕋 Th竝 Anh H飊g_Rng уng",
}

function vaf_award_api(szKey)
	local tActivityId = gf_VnGetActivityByTime()
	if not VAF_AWARD_API_TABLE[szKey] then return end
	for _,nActivityID in ipairs(tActivityId) do
		local tPrizeInfo = g_objVNAcitivityInfo:GetMixTable(tostring(TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID), szKey)
		if (tPrizeInfo) then
			if type(tPrizeInfo[1]) == "table" then
				for i = 1,getn(tPrizeInfo) do
					gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][4]},tPrizeInfo[i][5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, VAF_AWARD_API_TABLE[szKey])
				end
			else
				gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4]},tPrizeInfo[5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, VAF_AWARD_API_TABLE[szKey])
			end
		end
	end
end


--kill npc杀野怪掉落
function vaf_kill_npc_drop()
	local tActivityId = gf_VnGetActivityByTime()
	for _,nActivityID in ipairs(tActivityId) do
		local tPrizeInfo = g_objVNAcitivityInfo:GetMixTable(tostring(TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID),"tKillNpc")
		if (tPrizeInfo) then
			if type(tPrizeInfo[1]) == "table" then
				for i = 1,getn(tPrizeInfo) do
					if random(100) <= (tPrizeInfo[i][6] or 10) then 
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][4]},tPrizeInfo[i][5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Цnh qu竔 ngo礽 th祅h nh薾 頲 ph莕 thng ho箃 ng")
					end
				end
			else
				if random(100) <= (tPrizeInfo[6] or 10) then 
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4]},tPrizeInfo[5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Цnh qu竔 ngo礽 th祅h nh薾 頲 ph莕 thng ho箃 ng")
				end
			end
		end
	end
end

--获得军功
function vaf_201203_GiveJunGong()
	gf_EventGiveCustomAward(31,1000,1,"M� ti謈 khao qu﹏","100 l莕 gi秈 thng")
end
function vaf_201204_GiveJunGong()
	gf_EventGiveCustomAward(31,100,1,"M颽 H� M竧 L筺h","100 l莕 gi秈 thng")
end

function gf_VnGetPrizeRandomSeed(tbPrize)
	local nRandomSeed = 0
	if not tbPrize then return end
	for i = 1,getn(tbPrize) do
		nRandomSeed = nRandomSeed + tbPrize[i][2]
	end
	return nRandomSeed
end
--attention:all the pet-award-api are here
--add pet grow award:the param is the number of award
function gf_VnGiveActivityPetGrowAward(nPetGrowAward)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (nPetGrowAward * 100)) --甶觤 n﹏g c蕄
		WriteLogEx(EVENT_LOG_TITLE, "nh薾 thng s� d鬾g v藅 ph萴 event ", 1, nPetGrowAward.." 甶觤 n﹏g c蕄")
		Msg2Player("B筺 nh薾 頲 "..nPetGrowAward.." 觤 N﹏g C蕄 B筺 уng H祅h")
end
--add pet mp award api: the param is the number of award
function gf_VnGiveActivityPetMpAward(nPetMpAward)
	Pet_AddGP(nPetMpAward)
	WriteLogEx(EVENT_LOG_TITLE, "nh薾 thng s� d鬾g v藅 ph萴 event ", 1, nPetMpAward.." 甶觤 linh l鵦")
	Msg2Player("B筺 nh薾 頲 "..nPetMpAward.." 觤 Linh L鵦 B筺 уng H祅h")
end

function Vet_Create_Activity_By_Id(nActivityID)
	TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID = nActivityID
	TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName = g_objVNAcitivityInfo:GetString(tostring(nActivityID),"sActivityName")
	TB_VN_ACTIVITY_MAIN[nActivityID].sActivityChgKey = tostring(nActivityID)
	TB_VN_ACTIVITY_MAIN[nActivityID].tbTaskGroup = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tTaskGroup")
	TB_VN_ACTIVITY_MAIN[nActivityID].nItemChgNum = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nItemChgNum")
	TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeItemCount = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPrizeItemCount") or 1
	TB_VN_ACTIVITY_MAIN[nActivityID].nFlag = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nFlag") or 0;
	TB_VN_ACTIVITY_MAIN[nActivityID].nGetBothFinalPrize = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nGetBothFinalPrize") or 7;
	TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeMode = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPrizeMode") or 0;
	TB_VN_ACTIVITY_MAIN[nActivityID].nFinalPrizeMode = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nFinalPrizeMode") or 0;
	TB_VN_ACTIVITY_MAIN[nActivityID].nItemExcgPrizeCount = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nItemExcgPrizeCount") or 0;
	--道具兑换奖励
	TB_VN_ACTIVITY_MAIN[nActivityID].tbItemExchangePrize = {}
	for nIep = 1, TB_VN_ACTIVITY_MAIN[nActivityID].nItemExcgPrizeCount do
		TB_VN_ACTIVITY_MAIN[nActivityID].tbItemExchangePrize[nIep] = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbItemExchangePrize"..nIep)
	end
	--奖励物品相关
	for nItemPrizeNum = 1,TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeItemCount do
		TB_VN_ACTIVITY_MAIN[nActivityID].tbPrizeItemInfo[nItemPrizeNum] = {
			tbItemInfo = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbPrizeItemInfo"..nItemPrizeNum),
			nTaskIdPrizeType = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nTaskIdPrizeType"..nItemPrizeNum),
			nTaskIdGetFinalPrize = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nTaskIdGetFinalPrize"..nItemPrizeNum),
			nTaskIdUseItemTimes = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nTaskIdUseItemTimes"..nItemPrizeNum),
			tbExpPrizeNum = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbExpPrizeNum"..nItemPrizeNum),
			tbPrizeCondition = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbPrizeCondition"..nItemPrizeNum),
			tbExpPrizeName = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbExpPrizeName"..nItemPrizeNum),
			tbNormalPrize = {
				tbItemRoomWeight = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbNormalPrizeRoomWeight"..nItemPrizeNum),
			},
			nPrizeAdditionalTimes = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPrizeAdditionalTimes"..nItemPrizeNum),
			tbAdditionalPrize = {
				tbItemRoomWeight = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbAdditionalPrizeRoomWeight"..nItemPrizeNum),
			},
			nItemUseTimesMax = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nItemUseTimesMax"..nItemPrizeNum),
			tbFinalPrize = {
				tbItemRoomWeight = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbFinalPrizeRoomWeight"..nItemPrizeNum),
				tbFinalPrizeKind = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbFinalPrizeKind"..nItemPrizeNum),
			},
			--累计点和领奖标记
			nPmAccPoint = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPmAccPoint"..nItemPrizeNum),
			nPmUsePrizeTag = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPmUsePrizeTag"..nItemPrizeNum),
			bHaveThings = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"bHaveThings"..nItemPrizeNum),
		}
	end
	return TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeItemCount;
end


--============================================================================
local ActivityMaxCount = GetEventCount();
for nGlbId = 1, ActivityMaxCount do
	if gf_CheckEventDateEx(nGlbId) == 1 then
		TB_VN_ACTIVITY_MAIN[nGlbId] = gf_Inherit(CLASS_ACTIVITY);
		local nCount = Vet_Create_Activity_By_Id(nGlbId) or 1;
		if VET_ACTIVITY_AWARD_TABLE[nGlbId] ~= nil then
			for j = 1 , nCount do			
				--共用额外奖励表1
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbAdditionalPrize.tbPrizeInfo = VET_ACTIVITY_AWARD_TABLE[nGlbId][1]
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbAdditionalPrize.nRandomBase = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][1])
				--共用的最终奖励表2,3
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbFinalPrize.tbPrizeInfo = VET_ACTIVITY_AWARD_TABLE[nGlbId][2]
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbFinalPrize.nRandomBase = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][2])
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbFinalPrize.sel = VET_ACTIVITY_AWARD_TABLE[nGlbId][3][j];
				if TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition and getn(TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition) == 2 then
					--模式1 4
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.tbPrizeInfo1 = VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[1]]
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.nRandomBase1 = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[1]])
					--模式2 5
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.tbPrizeInfo2 = VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[2]]
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.nRandomBase2 = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[2]])
				end
				--累计领取的奖励(6,7号索引)
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPmPrizeInfo = VET_ACTIVITY_AWARD_TABLE[nGlbId][5 + j]
				--使用道具的奖励(8,9号索引)
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPmFuncPrize = VET_ACTIVITY_AWARD_TABLE[nGlbId][7 + j]
			end
			--道具兑换奖励 10 - 10+Count
			TB_VN_ACTIVITY_MAIN[nGlbId].tbIEPAward = {}
			for nIep = 1, TB_VN_ACTIVITY_MAIN[nGlbId].nItemExcgPrizeCount do
				TB_VN_ACTIVITY_MAIN[nGlbId].tbIEPAward[nIep] = VET_ACTIVITY_AWARD_TABLE[nGlbId][9 + nIep]
			end
		end
		TB_VN_ACTIVITY_MAIN[nGlbId].OnGetFinalPrize = function(_,nPrizeDiff,nOrder)
				if nPrizeDiff == 1 then
					ModifyExp(25000000);
				gf_WriteLogEx(EVENT_LOG_TITLE, "nh薾  th祅h c玭g", 1, "Ph莕 thng cu鑙 25000000 kinh nghi謒")
				elseif nPrizeDiff == 2 then
					--TODO:Check match condition to add pet grow prize add here
					gf_VnGiveActivityPetGrowAward(20);
				elseif nPrizeDiff == 3 then
					--TODO:Check match condition to add pet mp prize add here
					gf_VnGiveActivityPetMpAward(1);
				elseif nPrizeDiff == 4 then
					--70级高级秘籍	
					--vaf_Give70GaojiMiji();
					local nRoute = GetPlayerRoute()
					gf_AddItemEx2(VET_70_GAOJIMIJI_NEW[nRoute][2], tb_golden_faction_tree[nRoute][1], "Event thang 11", "nh薾 ph莕 thng cu鑙")
					Msg2Player("B筺 nh薾 頲 1 cu鑞 m藅 t辌h cao c蕄 70")
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh薾  th祅h c玭g", 1, "Ph莕 thng cu鑙 M藅 T辌h")
				elseif nPrizeDiff == 5 then
					ModifyExp(nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh薾  th祅h c玭g", 1, "Ph莕 thng cu鑙 "..nOrder.." kinh nghi謒")
				elseif nPrizeDiff == 6 then
					--给军功值
					gf_EventGiveCustomAward(31,nOrder,"Event thang 12","фi ph莕 thng cu鑙 c飊g");
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh薾  th祅h c玭g", 1, "Ph莕 thng cu鑙 "..nOrder.." c玭g tr筺g")
				elseif nPrizeDiff == 7 then
					gf_AddItemEx({2,1,9977,1},"Qu﹏ C玭g Huy Ho祅g",1);
					gf_AddItemEx({2,1,9998,1},"Qu﹏ C玭g Чi",1);
					gf_AddItemEx({2,1,9999,1},"Qu﹏ C玭g Chng",1);
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh薾  th祅h c玭g", 1, "Ph莕 thng cu鑙  3 lo筰 qu﹏ c玭g")
				elseif nPrizeDiff == 8 then
					gf_AddItemEx({2,1,1009,nOrder},"Thi猲 Th筩h Tinh Th筩h");
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh薾  th祅h c玭g", 1, "Ph莕 thng cu鑙 Thi猲 Th筩h")
				elseif nPrizeDiff == 9 then
					--给真气
					AwardGenuineQi(nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh薾  th祅h c玭g", 1, "Ph莕 thng cu鑙 "..nOrder.." ch﹏ kh�")
				elseif nPrizeDiff == 10 then
					--给天门碎片
					AddItem(2,1,30410,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "M秐h Thi猲 M玭");
				elseif nPrizeDiff == 11 then
					--给天门金令
					AddItem(2,1,30370,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "Thi猲 M玭 Kim L謓h");
				elseif nPrizeDiff == 12 then
					--给天罡碎片
					AddItem(2,1,30390,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "M秐h Thi猲 Cang");
				elseif nPrizeDiff == 13 then
					--给藏宝箱
					AddItem(2,1,30341,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "T祅g Rng");
				elseif nPrizeDiff == 14 then
					--给金子
					Earn(nOrder*10000);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "V祅g");
				elseif nPrizeDiff == 15 then
					--给木箱+XU
					AddItem(2,1,30340,nOrder);
					AddItem(2,1,30230,66);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "M閏 Rng + XU");
				elseif nPrizeDiff == 16 then
					--财神宝箱
					AddItem(2,1,30344,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "Th莕 T礽 B秓 Rng");
				elseif nPrizeDiff == 17 then
					--财神宝箱
					AddItem(2,1,30230,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "Xu v藅 ph萴");
				elseif nPrizeDiff == 18 then
					--按职业门派给高级70级秘籍
					ahf_GetGaojiZhenjuan(1, nOrder, 1)
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "M藅 Tich 70 Cao C蕄");
				elseif nPrizeDiff == 19 then
					--全部给
					gf_ModifyExp(2000000000);
					gf_EventGiveCustomAward(31,690000,EVENT_LOG_TITLE,"фi ph莕 thng cu鑙 c飊g");
					AwardGenuineQi(690000);
					--给一只玉兔
					local nRet, nIndex = AddItem(0,105,30038,1,4,-1,-1,-1,-1,-1,-1);
					if 1 == nRet then
						SetItemExpireTime(nIndex, 3600*24 * 60);
						gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", 1, "Th� Ng鋍");
					end
				elseif nPrizeDiff == 20 then
					ahf_GetYaoYangByRouteBody(VET_YAOYANG_CLOTH);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "Di謚 Dng Y");
				elseif nPrizeDiff == 21 then
					ahf_GetYaoYangByRouteBody(VET_YAOYANG_CAP);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "Di謚 Dng M筼");
				elseif nPrizeDiff == 22 then
					ahf_GetYaoYangByRouteBody(VET_YAOYANG_SHOE);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "Di謚 Dng Kh�");
				elseif nPrizeDiff == 23 then
					local nRet, nIndex = AddItem(2,1,1068,nOrder);
					SetItemExpireTime(nIndex, 15 * 24 * 3600);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "Thi猲 Th筩h linh th筩h");
				elseif nPrizeDiff == 24 then
					local nRet, nIndex = AddItem(2,1,1067,nOrder);
					SetItemExpireTime(nIndex, 15 * 24 * 3600);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "мnh H錸 Thi猲 Th筩h Th莕 Th筩h");
				elseif nPrizeDiff == 25 then
					AddItem(2,0,1082,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "Th竔 D辌h H鏽 Nguy猲");
				elseif nPrizeDiff == 26 then
					VetInterface_FinishReborn1();
				elseif nPrizeDiff == 27 then
					VetInterface_FinishReborn1_6();
				elseif nPrizeDiff == 28 then
					gf_ModifyExp(2000000000);
					ModifyReputation(4700,0);
					SetTask(336, GetTask(336) + 4700);
       			 		Msg2Player(format("Thu 頲 %d 甶觤 c鑞g hi課 s� m玭", 4700));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "2000000000 Kinh Nghi謒 + 4700 Danh V鋘g + 4700 S� M玭");
				elseif nPrizeDiff == 29 then
					gf_ModifyExp(1000000000);
					if GetTask(701) >= 0 then
	    	  				SetTask(701, GetTask(701) + 74000);
	    	  			else
	    	  				SetTask(701, GetTask(701) - 74000);
	    	  			end
	    	  			Msg2Player(format("C竎 h� nh薾 頲 %d 甶觤 qu﹏ c玭g", 74000));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "74000 Qu﹏ C玭g + 1000000000 Kinh Nghi謒");
				elseif nPrizeDiff == 30 then
					gf_ModifyExp(1000000000);
					AwardGenuineQi(74000);
       	 			gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "74000 Ch﹏ Kh� + 1000000000 Kinh Nghi謒");
				elseif nPrizeDiff == 31 then
					gf_ModifyExp(2000000000);
					ModifyReputation(3900,0);
					SetTask(336, GetTask(336) + 3900);
       	 				Msg2Player(format("Thu 頲 %d 甶觤 c鑞g hi課 s� m玭", 3900));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "2000000000 甶觤 kinh nghi謒 + 3900 甶觤 danh v鋘g + 3900 甶觤 s� m玭");
				elseif nPrizeDiff == 32 then
					gf_ModifyExp(1000000000);
					if GetTask(701) >= 0 then
	    	  				SetTask(701, GetTask(701) + 79000);
	    	  			else
	    	  				SetTask(701, GetTask(701) - 79000);
	    				end
	    	 			 Msg2Player(format("C竎 h� nh薾 頲 %d 甶觤 qu﹏ c玭g", 79000));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "79000 甶觤 qu﹏ c玭g + 1000000000 甶觤 kinh nghi謒");
				elseif nPrizeDiff == 33 then
					gf_ModifyExp(1000000000);
					AwardGenuineQi(79000);
       	 				gf_WriteLogEx("Ho箃 ng Vi謙 Nam", "фi ph莕 thng cu鑙 c飊g", nOrder, "79000 甶觤 ch﹏ kh� + 1000000000 甶觤 kinh nghi謒");
			       	elseif nPrizeDiff == 34 then
			       		gf_ModifyExp(2000000000);
					ModifyReputation(4444,0);
					SetTask(336, GetTask(336) + 4444);
			       	 	Msg2Player(format("Thu 頲 %d 甶觤 c鑞g hi課 s� m玭", 4444));
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "2000000000 甶觤 kinh nghi謒+4444 甶觤 danh v鋘g +4444 甶觤 s� m玭 ");
			       	elseif nPrizeDiff == 35 then
			       		gf_ModifyExp(1500000000);
					if GetTask(701) >= 0 then
				    		SetTask(701, GetTask(701) + 77777);
				    	  else
				    	  	SetTask(701, GetTask(701) - 77777);
				    	  end
				    	  Msg2Player(format("C竎 h� nh薾 頲 %d 甶觤 qu﹏ c玭g", 77777));
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "77777 甶觤 c玭g tr筺g +1500000000 甶觤 kinh nghi謒");
			       	elseif nPrizeDiff == 36 then
			       		AwardGenuineQi(77777);
			       		gf_ModifyExp(1500000000);
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "77777 甶觤 c玭g tr筺g +1500000000 甶觤 kinh nghi謒");
				elseif nPrizeDiff == 37 then
					VetInterface_Reborn()
				elseif nPrizeDiff == 38 then
					gf_ModifyExp(1500000000);
					ModifyReputation(5000,0);
					SetTask(336, GetTask(336) + 5000);
       	 				Msg2Player(format("Thu 頲 %d 甶觤 c鑞g hi課 s� m玭", 5000));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "1500000000 甶觤 kinh nghi謒 +5000 甶觤 danh v鋘g +5000 甶觤 s� m玭 ");								
				elseif nPrizeDiff == 39 then
					gf_ModifyExp(1500000000);
					if GetTask(701) >= 0 then
			    	  		SetTask(701, GetTask(701) + 39000);
			    		else
			    	  		SetTask(701, GetTask(701) - 39000);
			    		end
			    	 	Msg2Player(format("C竎 h� nh薾 頲 %d 甶觤 qu﹏ c玭g", 39000));
		       	 	  	gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "1500000000 甶觤 kinh nghi謒 +39000 甶觤 qu﹏ c玭g ");
				elseif nPrizeDiff == 40 then
					gf_ModifyExp(1500000000);
					AwardGenuineQi(39000);
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "1500000000 甶觤 kinh nghi謒 +39000 甶觤 ch﹏ kh� ");		
				elseif nPrizeDiff == 41 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1068, 1}, "Thi猲 Th筩h linh th筩h", "Ho箃 ng Vi謙 Nam", "1000000000EXP+01 Thi猲 th筩h linh th筩h (30 ng祔)", 30 * 24 * 3600, 1);
				elseif nPrizeDiff == 42 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1067, 1}, "мnh H錸 Thi猲 Th筩h Th莕 Th筩h", "Ho箃 ng Vi謙 Nam", "1000000000 EXP + 01 мnh H錸 Thi猲 Th筩h Th莕 Th筩h (30 ng祔)", 30 * 24 * 3600, 1);
				elseif nPrizeDiff == 43 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 30345, 1}, "Chuy觧 Sinh Кn ", "Ho箃 ng Vi謙 Nam", "1000000000 EXP + 01 Chuy觧 Sinh Кn", 0, 1);
				elseif nPrizeDiff == 44 then
					gf_ModifyExp(1000000000);
					if GetTask(701) >= 0 then
						SetTask(701, GetTask(701) + 39000);
					else
						SetTask(701, GetTask(701) - 39000);
					end
					Msg2Player(format("C竎 h� nh薾 頲 %d 甶觤 qu﹏ c玭g", 39000));
					gf_WriteLogEx("Ho箃 ng Vi謙 Nam", "фi ph莕 thng cu鑙 c飊g", nOrder, "1000000000 EXP + 39000 甶觤 qu﹏ c玭g");
				elseif nPrizeDiff == 45 then
					gf_ModifyExp(1500000000);
					gf_AddItemEx2({2, 1, 1113, 1}, "Чi мnh H錸 ", "Ho箃 ng Vi謙 Nam", "1500000000 EXP + 01 Чi мnh H錸 Thi猲 Th筩h Th莕 Th筩h (30 ng祔)", 30 * 24 * 3600, 1);
				elseif nPrizeDiff == 46 then
					gf_ModifyExp(2000000000);
				elseif nPrizeDiff == 47 then
					gf_ModifyExp(1000000000);
					ModifyReputation(5000,0);
					SetTask(336, GetTask(336) + 5000);
					Msg2Player(format("Thu 頲 %d 甶觤 c鑞g hi課 s� m玭", 5000));
					gf_WriteLogEx("Ho箃 ng Vi謙 Nam", "фi ph莕 thng cu鑙 c飊g", nOrder, "1000000000 EXP + 5000 甶觤 danh v鋘g + 5000 甶觤 s� m玭");
				elseif nPrizeDiff == 48 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 30345, 1}, "Chuy觧 Sinh Кn ", "Ho箃 ng Vi謙 Nam", "1000000000 EXP + 01 Chuy觧 Sinh Кn (60 ng祔, c� th� giao d辌h)", 60 * 24 * 3600, 1);
				elseif nPrizeDiff == 49 then
					Event_PhucSinhPET()
				elseif nPrizeDiff == 50 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1068, 1}, "Thi猲 Th筩h linh th筩h", "Ho箃 ng Vi謙 Nam", "1000000000 EXP + 01 Thi猲 Th筩h Linh Th筩h (15 ng祔)", 15 * 24 * 3600, 1);
				elseif nPrizeDiff == 51 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1067, 1}, "мnh H錸 Thi猲 Th筩h Th莕 Th筩h", "Ho箃 ng Vi謙 Nam", "1000000000 EXP + 01 мnh H錸 Thi猲 Th筩h Th莕 Th筩h (15 ng祔)", 15 * 24 * 3600, 1);
				elseif nPrizeDiff == 52 then
					gf_ModifyExp(2000000000);
					if GetTask(701) >= 0 then
						SetTask(701, GetTask(701) + 9999);
					else
						SetTask(701, GetTask(701) - 9999);
					end
					Msg2Player(format("C竎 h� nh薾 頲 %d 甶觤 qu﹏ c玭g", 9999));
					gf_AddItemEx2({2, 1, 30344, 2}, "Th莕 T礽 B秓 Rng", "Ho箃 ng Vi謙 Nam", "2000000000 EXP + 9999 甶觤 c玭g tr筺g + 02 Th莕 T礽 B秓 Rng + 01 Чi мnh H錸 Thi猲 Th筩h Th莕 Th筩h (15 ng祔)", 0, 1);
					gf_AddItemEx2({2, 1, 1113, 1}, "Чi мnh H錸 ", EVENT_LOG_TITLE, "2000000000 EXP + 9999 甶觤 c玭g tr筺g + 02 Th莕 T礽 B秓 Rng + 01 Чi мnh H錸 Thi猲 Th筩h Th莕 Th筩h (15 ng祔)", 15 * 24 * 3600, 1);
				elseif nPrizeDiff == 53 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1068, 1}, "Thi猲 Th筩h linh th筩h", EVENT_LOG_TITLE, "1000000000 EXP + 01 Thi猲 Th筩h Linh Th筩h (07 ng祔)", 7 * 24 * 3600, 1);
				elseif nPrizeDiff == 54 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1067, 1}, "мnh H錸 Thi猲 Th筩h Th莕 Th筩h", "Ho箃 ng Vi謙 Nam", "1000000000 EXP + 01 мnh H錸 Thi猲 Th筩h Th莕 Th筩h (07 ng祔)", 7 * 24 * 3600, 1);
				elseif nPrizeDiff == 55 then
					gf_VnGiveActivityPetGrowAward(300);
					gf_VnGiveActivityPetMpAward(200);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "300 甶觤 n﹏g c蕄 + 200 甶觤 linh l鵦");		
				elseif nPrizeDiff == 56 then
					gf_ModifyExp(1000000000);
					AwardGenuineQi(39000);
					gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", nOrder, "1000000000 EXP + 39000 甶觤 ch﹏ kh�");		
				elseif nPrizeDiff == 57 then
					Event_PhucSinhPET()	--Vet_Complete_Revive_OnePartner_FirstStage();
				elseif nPrizeDiff == 58 then
					Vet_Complete_Revive_OnePartner_SecondStage();
				end
			end
	end
end

--============================================================================

function Vet_Activity_GetLastPrizeBoth(nTaskGrouId,nTaskIDSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	if Vet_Activity_GetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize) == 1 then
		Talk(1,"",tbActivity.tbHintString[7]);
		return
	end
	for i = 1, tbActivity.nPrizeItemCount do
		if Vet_Activity_GetItemUseInfo(tbActivity.tbTaskGroup[1],tbActivity.tbTaskGroup[2],tbActivity.tbPrizeItemInfo[i].nTaskIdUseItemTimes) < tbActivity.tbPrizeItemInfo[i].nItemUseTimesMax then
			Talk(1,"",format(tbActivity.tbHintString[6],tbActivity.tbPrizeItemInfo[i].tbItemInfo[4],tbActivity.tbPrizeItemInfo[i].nItemUseTimesMax));
			return
		end
	end
	if tbActivity.nFlag == 1 then
		--70为9月活动
		if tbActivity.nActivityID == 70 then
			Say("Ti猽 hao <color=red>500<color> Xu v藅 ph萴 nh薾 頲 m閠 th� ci m韎 \n <color=green> Th� Ng鋍  \n T鑓  di chuy觧 120%\n ч b襫 888/888\n h筺 s� d鬾g 60 ng祔 c� th� giao d辌h b籲g C祅 Kh玭 Ph� <color>\n",2,"уng �/#Vet_Activity_GetAdditionPrize("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")","T筰 h� ch� xem qua th玦/nothing");
			return
		end
		--76为圣诞活动
		if tbActivity.nActivityID == 76 then
			Say(format("Ti猽 hao <color=red>%dXU<color> nh薾 頲 1 <color=green>Xe Tu莕 L閏<color> (h筺 s� d鬾g 45 ng祔) v� <color=green>B� ngo筰 trang Noel<color> (c� th� giao d辌h)", 888), 2, "уng �/#Vet_Activity_GetAdditionPrize_76("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T筰 h� ch� xem qua th玦/nothing");
			return
		end
		--103,11月活动
		if tbActivity.nActivityID == 103 then
			Say("Nh薾 t蕋 c� ph莕 thng 2.000.000.000 kinh nghi謒 v� 2 Tr飊g Sinh Кn ( 30 ng祔)", 2, "уng �/#Vet_Activity_GetAdditionPrize_103("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T筰 h� ch� xem qua th玦/nothing")
			return
		end
		--107,1月活动
		if tbActivity.nActivityID == 107 then
			Say("Ph莕 thng s� d鬾g B竛h Ch璶g v� B竛h T衪 t n gi韎 h筺", 2, "уng �/#Vet_Activity_GetAdditionPrize_107("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T筰 h� ch� xem qua th玦/nothing")
			return
		end
		--112,2月活动
		if tbActivity.nActivityID == 112 then
			Say("Ph莕 thng s� d鬾g Chocolare Chips Muffin v�  Dark Chocolate t鑙 產 ", 2, "уng �/#Vet_Activity_GetAdditionPrize_112("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T筰 h� ch� xem qua th玦/nothing")
			return
		end
		--123,5月活动
		if tbActivity.nActivityID == 123 then
			Say("2000000000 甶觤 kinh nghi謒 +01 chuy觧 sinh n (30 ng祔 )+200甶觤 linh l鵦 pet ", 2, "уng �/#Vet_Activity_GetAdditionPrize_123("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T筰 h� ch� xem qua th玦/nothing")
			return
		end
		--135,10月活动
		if tbActivity.nActivityID == 135 then
			Say("Ch鋘 ph莕 thng s� d鬾g t鑙 產 c� 2 lo筰", 3, "Ho祅 th祅h giai 畂筺 2 nhi謒 v� Ph鬰 sinh B筺 уng H祅h (ti猽 hao 2500 ti猽 dao ng鋍)/#Vet_Activity_GetAdditionPrize_135("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "Ch鋘 ph莕 thng 2 t� 甶觤 kinh nghi謒/#Vet_Activity_GetAdditionPrize_135a("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T筰 h� ch� xem qua th玦/nothing")
--			Say("Ho祅 th祅h giai 畂筺 2 c馻 ph鬰 sinh ng h祅h (Ti猽 hao 2500 Ti猽 Dao Ng鋍) (Nh﹏ v藅 c莕 ho祅 th祅h giai 畂筺 1 c馻 ph鬰 sinh ng h祅h m韎 c� th� nh薾 thng)", 2, "уng �/#Vet_Activity_GetAdditionPrize_135("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T筰 h� ch� xem qua th玦/nothing")
			return
		end
	end
end

function Vet_Activity_GetAdditionPrize(nActivityID,nTaskGrouId,nTaskIDSeq)
	tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if GetItemCount(2,1,30230) < 500 then
		Talk(1,"",format("Xu v藅 ph萴 kh玭g  <color=red>%d<color> c竔",500));
		return
	end
	if gf_Judge_Room_Weight(1,0," ") ~= 1 then
	 return
	end
	if DelItem(2,1,30230,500) == 1 then
		--设置已领取标记
		Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
		local nRet,nItemIndex = AddItem(0,105,30038,1,1,-1,-1,-1,-1,-1,-1);
		SetItemExpireTime(nItemIndex, 60 * 24 * 60 * 60);
	end
end

-- Mo rong doi event
function VNG_DoiEvent_Form1()
	AskClientForNumber("VNG_DoiEvent_Kieu1", 1, 999, "S� lng (1-999)")
end

function VNG_DoiEvent_Kieu1(nCount)
	local tbCheckCase = {
		[1] = {6500},
		[2] = {3500},
		[3] = {0},
	}
	if gf_Judge_Room_Weight(3, 100, "") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end
	if GetItemCount(2,1,30741) < (6 * nCount ) or GetItemCount(2,1,30742) < (6 * nCount ) or GetItemCount(2,1,30603) < (2 * nCount)  then
		Talk(1, "", "B筺 kh玭g  甶襲 ki謓 i.");
		return 0;
	end
	local nTem = 0
	local tbAwardRate = {[1] = 0, [2] = 0, [3] = 0,}
	for i=1,nCount do
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
--		local nIndex = mod(random(1,1000),2) + 1
		tbAwardRate[nIndex] = tbAwardRate[nIndex] + 1
	end
	
	if DelItem(2,1,30741 , 6 * nCount) == 1 and DelItem(2,1,30742 , 6 * nCount) == 1 and DelItem(2,1,30603, 2 * nCount) == 1 then
		if tbAwardRate[1] > 0 then
			gf_AddItemEx2({2,1,30743, tbAwardRate[1]}, "Tranh Th� Ph竝", EVENT_LOG_TITLE , "nh薾")
		end
		if tbAwardRate[2] > 0 then
			gf_AddItemEx2({2,1,30744, tbAwardRate[2]}, "Tranh Th� Ph竝 c Bi謙", EVENT_LOG_TITLE , "nh薾")
		end
--		if tbAwardRate[3] > 0 then
--			gf_AddItemEx2({2, 1, 30709, tbAwardRate[3]}, "Ch� H箃 Sen", EVENT_LOG_TITLE , "nh薾")
--		end		
	end
end
function VNG_DoiEvent_Form2()
	AskClientForNumber("VNG_DoiEvent_Kieu2", 1, 999, "S� lng (1-999)")
end

function VNG_DoiEvent_Kieu2(nCount)
	local tbCheckCase = {
		[1] = {10000},
		[2] = {0},
		[3] = {0},
	}
	if gf_Judge_Room_Weight(3, 100, "") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end
	if GetItemCount(2,1,30632 ) < (5 * nCount ) or GetItemCount(2,1,30633 ) < (5 * nCount ) or GetItemCount(2,1,30230 ) < (2 * nCount ) then	--GetCash() < (100000 * nCount) 
		Talk(1, "", "B筺 kh玭g  甶襲 ki謓 i.");
		return 0;
	end
	local nTem = 0
	local tbAwardRate = {[1] = 0, [2] = 0, [3] = 0}
	for i=1,nCount do
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
--		local nIndex = mod(random(1,1000),2) + 1	
		tbAwardRate[nIndex] = tbAwardRate[nIndex] + 1
	end
	
	if DelItem(2,1,30632, 5 * nCount) == 1 and DelItem(2,1,30633, 5 * nCount) == 1 and DelItem(2,1,30230, 2 * nCount) == 1 then	--Pay(100000*nCount)
		if tbAwardRate[1] > 0 then
			gf_AddItemEx2({2, 1, 30635, tbAwardRate[1]}, "Hoa 8/3", EVENT_LOG_TITLE , "nh薾")
		end
--		if tbAwardRate[2] > 0 then
--			gf_AddItemEx2({2, 1, 30607, tbAwardRate[2]}, "Hoa 觤 10", EVENT_LOG_TITLE , "nh薾")
--		end
--		if tbAwardRate[3] > 0 then
--			gf_AddItemEx2({2, 1, 30608, tbAwardRate[3]}, "B籲g Khen", EVENT_LOG_TITLE , "nh薾")
--		end		
	end
end

function VNG_DoiEvent_Form3()
	AskClientForNumber("VNG_DoiEvent_Kieu3", 1, 999, "S� lng (1-999)")
end

function VNG_DoiEvent_Kieu3(nCount)
	if gf_Judge_Room_Weight(4, 100, "") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end
	if GetItemCount(2,1,30512) < (5 * nCount ) or GetItemCount(2,1,30603) < (2 * nCount)  then
		Talk(1, "", "B筺 kh玭g  甶襲 ki謓 i.");
		return 0;
	end

	if DelItem(2,1,30512, 5 * nCount) == 1 and DelItem(2,1,30603, 2 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30514, nCount}, "M莔 C﹜", EVENT_LOG_TITLE , "nh薾")
	end
end

function VNG_DoiEvent_Form4()
	AskClientForNumber("VNG_DoiEvent_Kieu4", 1, 999, "S� lng (1-999)")
end

function VNG_DoiEvent_Kieu4(nCount)
	if gf_Judge_Room_Weight(4, 100, "") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end
	if GetItemCount(2,1,30512) < (5 * nCount ) or GetItemCount(2,1,30513) < (1 * nCount)  then
		Talk(1, "", "B筺 kh玭g  甶襲 ki謓 i.");
		return 0;
	end

	if DelItem(2,1,30512, 5 * nCount) == 1 and DelItem(2,1,30513, 1 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30514, nCount}, "M莔 C﹜", EVENT_LOG_TITLE , "nh薾")
	end
end

function Vet_Activity_GetAdditionPrize_76(nActivityID,nTaskGrouId,nTaskIDSeq)
	tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	local nCount = 888;
	if GetItemCount(2,1,30230) < nCount then
		Talk(1,"",format("Xu v藅 ph萴 kh玭g  <color=red>%d<color> c竔",nCount));
		return
	end
	if gf_Judge_Room_Weight(4,100," ") ~= 1 then
	 return
	end
	if DelItem(2,1,30230,nCount) == 1 then
		--设置已领取标记
		Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
		--给驯鹿车
		local nRet,nItemIndex = AddItem(0,105,30041,1,1,-1,-1,-1,-1,-1,-1);
		SetItemExpireTime(nItemIndex, 45 * 24 * 3600);
		--给圣诞套装
		local tChrismas = {
			{{"N鉵 gi竛g sinh chu萵", {0,108,109,1}}, {"N鉵 gi竛g sinh kh玦 ng�", {0,108,110,1}}, {"N鉵 gi竛g sinh g頸 c秏", {0,108,112,1}}, {"N鉵 gi竛g sinh nh�", {0,108,111,1}}},
			{{"Thng y gi竛g sinh chu萵", {0,109,109,1}}, {"Gi竛g sinh kh玦 ng�", {0,109,110,1}}, {"Thng y gi竛g sinh g頸 c秏", {0,109,112,1}}, {"Thng y gi竛g sinh Ki襲 n�", {0,109,111,1}}},
			{{"H� y Gi竛g sinh chu萵", {0,110,73,1}}, {"Trang ph鬰 gi竛g sinh kh玦 ng�", {0,110,74,1}}, {"H� y gi竛g sinh n� g頸 c秏", {0,110,76,1}}, {"Gi竛g sinh Ki襲 n�", {0,110,75,1}}},
		};
		local nBody = GetBody();
		local nSize = getn(tChrismas);
		for i = 1, nSize do
			gf_AddItemEx2(tChrismas[i][nBody][2], tChrismas[i][nBody][1], "Ho箃 ng Gi竛g sinh", "Ph莕 thng cu鑙", 45 * 24 * 3600, 1)
		end
	end
end

function get_random_event_ittem(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][1]
		if nRandom <= nBase then
			return i			
		end
	end	
end

function Vet_Update_Pet(nPoint)
	if not nPoint or nPoint <= 0 then
		return 0;
	end
	--Interface, complete by vet!
	--do something
	if nPoint == 50 then
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (50 * 100)) --甶觤 n﹏g c蕄
		WriteLogEx(EVENT_LOG_TITLE, "nh薾 thng s� d鬾g v藅 ph萴 event ", 1, "50 甶觤 n﹏g c蕄")
		Msg2Player("B筺 nh薾 頲 50 觤 N﹏g C蕄 B筺 уng H祅h")
	end
	if nPoint == 10 then
		Pet_AddGP(10)
		WriteLogEx(EVENT_LOG_TITLE, "nh薾 thng s� d鬾g v藅 ph萴 event ", 1, "10 甶觤 linh l鵦")
		Msg2Player("B筺 nh薾 頲 10 觤 Linh L鵦 B筺 уng H祅h")
	end
end

function Vet_Activity_GetAdditionPrize_103(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
		return
	end
	--设置已领取标记
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({2,1,30345,2}, "Chuy觧 Sinh Кn ", EVENT_LOG_TITLE, "фi ph莕 ph莕 thng cu鑙", 30*24*3600, 1);
end

--need to complete by VET-----------------------------------
function VetInterface_ConditionCheck1()
	if GetTask(TSK_CS6_TULINH) > 1 then
		Talk(1, "", "Чi hi謕  ho祅 th祅h nhi謒 v� giai 畂筺 n祔 r錳, n猲 kh玭g c莕 l穙 phu gi髉  n鱝.")
		return 0
	end
	if GetTask(TSK_CS6_TULINH) ~= 1 or GetItemCount(2,1,30490) <2 then
		Talk(1, "", "Чi hi謕 ch璦  nh薾 nhi謒 v� chuy觧 sinh 6 ho芻 kh玭g c�  2 Ho祅g Kim Чi Ng﹏ Phi誹")
		return 0
	else
		return 1
	end
end

function VetInterface_FinishReborn1()
	if GetTask(TSK_CS6_TULINH) == 1 then
		if DelItem(2,1,30490,2) == 1 then
			SetTask(TSK_CS6_TULINH,2)
			Talk(1, "", "Ta  truy襫 th� ph莕 u c馻 b� k輕 T� Linh Ph鬰 Sinh cho i hi謕 r錳, b﹜ gi� i hi謕 h穣 甶 t譵 Vi猲 Quan Tho竔 Nhi謒  l穘h gi竜 ph莕 c遪 l筰 !!!!")
			TaskTip("Ta  truy襫 th� ph莕 u c馻 b� k輕 T� Linh Ph鬰 Sinh cho i hi謕 r錳, b﹜ gi� i hi謕 h穣 甶 t譵 Vi猲 Quan Tho竔 Nhi謒  l穘h gi竜 ph莕 c遪 l筰 !!!!")
			return 1
		else
			return 0
		end
	else
		return 0
	end
end

function VetInterface_ConditionCheck1_6()
	if GetTask(TSK_CS6_TULINH) ~= 1 then
		return 0
	else
		return 1
	end
end

function VetInterface_FinishReborn1_6()
	if GetTask(TSK_CS6_TULINH) == 1 then
		if DelItem(2,1,30490,2) == 1 then
			SetTask(TSK_CS6_TULINH,2)
			TaskTip("Ta  truy襫 th� ph莕 u c馻 b� k輕 T� Linh Ph鬰 Sinh cho i hi謕 r錳, b﹜ gi� i hi謕 h穣 甶 t譵 Vi猲 Quan Tho竔 Nhi謒  l穘h gi竜 ph莕 c遪 l筰 !!!!")
			return 1
		else
			return 0
		end
	else
		return 0
	end
end

function VetInterface_Reborn_ConditionCheck()
	if GetItemCount(2,1,30603) < 999 then
		Talk(1,"",format("s� ng鋍 ti猽 dao trong t骾 kh玭g  %d c竔 ", 999))
		return 0
	end
	if DelItem(2,1,30603,999) == 1 then
		return 1
	end
	return 0
end

function VetInterface_Reborn()
	--finish Reborn 7
	--do something
--	if VetInterface_Reborn_ConditionCheck() ~= 1 then
--		return 0
--	end

	if GetTask(TSK_CS6_TULINH) == 1 then
--		if DelItem(2,1,30603,999) == 1 then
			SetTask(TSK_CS6_TULINH,2)
			TaskTip("Ta  truy襫 th� ph莕 u c馻 b� k輕 T� Linh Ph鬰 Sinh cho i hi謕 r錳, b﹜ gi� i hi謕 h穣 甶 t譵 Vi猲 Quan Tho竔 Nhi謒  l穘h gi竜 ph莕 c遪 l筰 !!!!")
			return 1
--		else
--			return 0
--		end
	else
		Talk(1,"", "Ta kh玭g th� truy襫 th� b� k輕 n祔 cho i hi謕 !!!!")
		return 0
	end
end

function Vet_Complete_Revive_OnePartner_FirstStage_check()
	return 1;
end

function Vet_Complete_Revive_OnePartner_FirstStage()
	--complete by veit
	--finish first stage
	--
end

function Vet_Complete_Revive_OnePartner_SecondStage_check()
	--complete by veit
	--
	
	return 0;
end

function Vet_Complete_Revive_OnePartner_SecondStage()	--(nActivityID,nTaskGrouId,nTaskIDSeq)
--	local nCheck = GetTask(2788)
--	if nCheck >= 1 then
--		Talk("B筺  nh薾 ph莕 thng cu鑙 khi s� d鬾g t鑙 產 2 v藅 ph萴 r錳.")
--		return 0
--	end
	local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10)
	if mod(nIsPS,10) >= 1 then
		Talk(1,"","B筺 ng h祅h  ph鬰 sinh r錳 n猲 kh玭g th� nh薾 ph莕 thng n祔.")
		return 0
	end
--	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	
--	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	if nCurGodPoint < 999 then
		Talk(1,"","B筺 ng h祅h ch璦  999 甶觤 linh l鵦")
		return
	end
	if GetItemCount(2,1,30603) < 999 then
		Talk(1,"","Ti猽 Dao Ng鋍 trong t骾 kh玭g  999 c竔")
		return
	end
	local checka = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_A,10,5)
	local checkb = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_B,10,3)	
	if checka < 160160 or checkb < 3303030 then
		Talk(1, "", "B筺 ch璦 ho祅 th祅h giai 畂筺 1 nhi謒 v� ph鬰 sinh b筺 ng h祅h n猲 kh玭g th� nh薾 ph莕 thng !!!!")
		return 0
	end	

--	gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", 2500, "Ti猽 hao Ti猽 Dao Ng鋍 ho祅 th祅h giai 畂筺 2 c馻 ph鬰 sinh ng h祅h");		
	--设置已领取标记
--	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	local szNpcName = "<color=green>S� ki謓 Event th竛g 11<color>: "
	local tSay = {}
	local tHeader = szNpcName.." Чi hi謕 h穣 ch鋘 hng Ph鬰 Sinh cho B筺 уng H祅h c馻 m譶h."
	tinsert(tSay, format("H� tr� h� N閕 C玭g/#add_buffEvent2(1)"))		
	tinsert(tSay, format("H� tr� h� Ngo筰 C玭g/#add_buffEvent2(2)"))		
	--tinsert(tSay, "H� tr� h� Ngo筰 C玭g/#add_buffEvent(2,tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")")	

	tinsert(tSay, "Ta ch� gh� qua th玦/nothing")
	Say(tHeader, getn(tSay), tSay)	
end

------------------------------------------------------------


function Vet_Activity_GetAdditionPrize_107(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	--设置已领取标记
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	if GetTask(701) >= 0 then
		SetTask(701, GetTask(701) + 20000);
	else
		SetTask(701, GetTask(701) - 20000);
	end
	Msg2Player(format("C竎 h� nh薾 頲 %d 甶觤 qu﹏ c玭g", 20000));
	AwardGenuineQi(20000);
 	gf_WriteLogEx("Ho箃 ng Vi謙 Nam", "Ph莕 thng s� d鬾g B竛h Ch璶g v� B竛h T衪 t n gi韎 h筺", "2000000000 甶觤 kinh nghi謒 + 20000 甶觤 ch﹏ kh� + 20000 甶觤 qu﹏ c玭g");
end

function Vet_Activity_GetAdditionPrize_112(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	--设置已领取标记
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	if GetTask(701) >= 0 then
		SetTask(701, GetTask(701) + 20000);
    else
		SetTask(701, GetTask(701) - 20000);
	end
	Msg2Player(format("C竎 h� nh薾 頲 %d 甶觤 qu﹏ c玭g", 20000));
	AwardGenuineQi(20000);
	AddItem(2,1,30497,200,4);
 	gf_WriteLogEx("Ho箃 ng Vi謙 Nam", "Ph莕 thng s� d鬾g Chocolare Chips Muffin v�  Dark Chocolate t鑙 產 ", "2000000000 甶觤 kinh nghi謒 + 20000 甶觤 ch﹏ kh� +20000 甶觤 c玭g tr筺g +200 Ma Tinh");
end

function Vet_Activity_GetAdditionPrize_123(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	local nLevel = mod(TASK_VNG_PET,100)
	if nLevel < 2 then
			Msg2Player("B筺 ch璦 c� PET c蕄 1 n猲 kh玭g th� nh薾 ph莕 thng n祔")
			return
	end
	--设置已领取标记
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({2, 1, 30345, 1}, "Chuy觧 Sinh Кn ", "Ho箃 ng Vi謙 Nam", "S� d鬾g  sero d﹗ ti v� sero b筩 h�  t 頲 ph莕 thng cao nh蕋", 30 * 24 * 3600, 1)
	Pet_AddGP(200)
	Msg2Player("B筺 nh薾 頲 200 觤 Linh L鵦 B筺 уng H祅h")
	gf_WriteLogEx(EVENT_LOG_TITLE, "Ph莕 thng s� d鬾g t鑙 產", "Ph莕 thng s� d鬾g t鑙 產 2 lo筰");
	--complete by vet
	--pet value
	--do something
end

function Vet_201403_UseItemAward()
	--给奖励
	gf_Modify("Exp",600000)
	gf_Modify("Rep",1);
	SetTask(336, GetTask(336) + 1);
	Msg2Player(format("Thu 頲 %d 甶觤 c鑞g hi課 s� m玭", 1));
	local tItem = {
		{1, 95},
		{2, 4},
		{3, 1},
	}
	local nIndex = gf_GetRandItemByTable(tItem, gf_SumRandBase(tItem), 1)
	gf_AddItemEx2({2,1,30636, tItem[nIndex][1]}, "8/3 t輓 v藅", "2XU", "S� d鬾g item nh薾 thng ", 0, 1)
end

function Vet_201404_UseItemAward()
	--给奖励
	local tExp = {
		[0] = 500000,
		[1] = 650000,
		[2] = 650000,
		[3] = 650000,
		[4] = 650000,
		[5] = 650000,
		[6] = 1500000,
		[7] = 2000000,
	}
	local nReb = gf_GetPlayerRebornCount()
	if tExp[nReb] then
		gf_Modify("Exp",tExp[nReb])
	end
	gf_Modify("Rep",1);
	SetTask(336, GetTask(336) + 1);
  Msg2Player(format("Thu 頲 %d 甶觤 c鑞g hi課 s� m玭", 1));
  local tItem = {
  	{1, 85},
  	{2, 8},
  	{3, 4},
  	{4, 2},
  	{5, 1},
  }
  local nIndex = gf_GetRandItemByTable(tItem, gf_SumRandBase(tItem), 1)
  gf_AddItemEx2({2,1,30641, tItem[nIndex][1]}, "t� s綾 b秓 th筩h ", "2XU", "S� d鬾g item nh薾 thng ", 0, 1)
end

function Pet_AddGP(nPoint)
	if IsPlayerDeath() == 1 then
		return
	end
	tRequireElement =
	{
				[1] = {0},
				[2] = {200},
				[3] = {600},
				[4] = {30000},
	}
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurGodPoint + nPoint <= tRequireElement[nCurLevel][1] then
		nCurGodPoint = nCurGodPoint +nPoint
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
	else
		nCurGodPoint = tRequireElement[nCurLevel][1]
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
		Msg2Player("B筺 уng H祅h  t 頲 甶觤 Linh L鵦 t鑙 產 c馻 c蕄, kh玭g th� t╪g th猰.")
	end
end
function Event_PhucSinhPET()
	VNG_SetTaskPos(TSK_PET_PS_GIAIDOAN_A,160160,10,5)
	VNG_SetTaskPos(TSK_PET_PS_GIAIDOAN_B,3303030,10,3)
	Msg2Player("B筺  ho祅 th祅h giai 畂筺 1 nhi謒 v� ph鬰 sinh b筺 ng h祅h")
end

function Vet_Activity_GetAdditionPrize_135(nActivityID,nTaskGrouId,nTaskIDSeq)
	local nCheck = GetTask(2788)
	if nCheck >= 1 then
		Talk("B筺  nh薾 ph莕 thng cu鑙 khi s� d鬾g t鑙 產 2 v藅 ph萴 r錳.")
		return 0
	end
	local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10)
	if mod(nIsPS,10) >= 1 then
		Talk(1,"","B筺 ng h祅h  ph鬰 sinh r錳 n猲 kh玭g th� nh薾 ph莕 thng n祔.")
		return 0
	end
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	if GetItemCount(2,1,30603) < 999 then
		Say(format("Ti猽 Dao Ng鋍 trong t骾 kh玭g  %d", 999), 0);
		return
	end
	local checka = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_A,10,5)
	local checkb = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_B,10,3)	
	if checka < 160160 or checkb < 3303030 then
		Talk(1, "", "B筺 ch璦 ho祅 th祅h giai 畂筺 1 nhi謒 v� ph鬰 sinh b筺 ng h祅h n猲 kh玭g th� nh薾 ph莕 thng !!!!")
		return 0
	end	
	if DelItem(2,1,30603,999) ~= 1 then
		return 0;
	end

--	gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", 2500, "Ti猽 hao Ti猽 Dao Ng鋍 ho祅 th祅h giai 畂筺 2 c馻 ph鬰 sinh ng h祅h");		
	--设置已领取标记
--	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	local szNpcName = "<color=green>S� ki謓 Event th竛g 11<color>: "
	local tSay = {}
	local tHeader = szNpcName.." Чi hi謕 h穣 ch鋘 hng Ph鬰 Sinh cho B筺 уng H祅h c馻 m譶h."
	tinsert(tSay, format("H� tr� h� N閕 C玭g/#add_buffEvent(1,%s%s%s)",tbActivity.nActivityID,nTaskGrouId,nTaskIDSeq))		
	tinsert(tSay, format("H� tr� h� Ngo筰 C玭g/#add_buffEvent(2,%s%s%s)",tbActivity.nActivityID,nTaskGrouId,nTaskIDSeq))		
	--tinsert(tSay, "H� tr� h� Ngo筰 C玭g/#add_buffEvent(2,tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")")	

	tinsert(tSay, "Ta ch� gh� qua th玦/nothing")
	Say(tHeader, getn(tSay), tSay)	
end

function add_buffEvent(nWay,nActivityID,nTaskGrouId,nTaskIDSeq)
	local nCheck = GetTask(2788)
	if nCheck >= 1 then
		Talk("B筺  nh薾 ph莕 thng cu鑙 khi s� d鬾g t鑙 產 2 v藅 ph萴 r錳.")
		return 0
	end
	local tNoiNgoai = {
			 [1] = {
						{"N閕 C玭g 6%", "state_m_attack_percent_add", 6},
						{"Sinh L鵦 +6000", "state_life_max_point_add", 8000},
						{"Sinh L鵦 6%", "state_life_max_percent_add", 6},
						{"Kh竛g t蕋 c� +12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo筰 C玭g 12%", "state_p_attack_percent_add", 12},
						{"Sinh L鵦 +6000", "state_life_max_point_add", 10000},
						{"Sinh L鵦 6%", "state_life_max_percent_add", 6},
						{"N閕 ph遪g/Ngo筰 ph遪g +60", "state_i_defence_point_add", 60},
						{"Ngo筰 ph遪g +60", "state_o_defence_point_add", 60},
					},
				}
	local t_pet_type = {
									[1] = {"Th� tr緉g",3333,24},
									[2] = {"Th� x竚",3333,25},
									[3] = {"Th� 甧n",3334,26},		
								}	
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);		
	SetTask(2788,1)	--nh薾 ph莕 thng cu鑙 khi s� d鬾g t鑙 產 2 v藅 ph萴
	SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t╪g bc nhi謒 v� l猲 gi� tr� 3 l� ho祅 th祅h xong giai 畂筺 2
	gf_WriteLogEx("PHUC SINH PET", "xong giai 畂筺 2", 1, "Ho祅 th祅h Giai 筺 2")												
		local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10) --mod 10 l� gi� tr� x竎 nh c� Ph鬰 Sinh PET 
		nIsPS = (nIsPS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS) --set gi� tr� x竎 nh c� Ph鬰 Sinh PET
		-------------
		local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10)
		nCount_PET_PS = (nCount_PET_PS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10) 
		SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS) --set gi� tr� x竎 nh s� l莕 Ph鬰 Sinh PET
		-------------
		local nNewValue =  SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A),nWay,4)
		SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue ) -- set hng Ph鬰 Sinh c馻 PET
		-------------Set c竎 ch� s� buff
		local nAttrId = 2908130 --29/08/13 + x
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end		
		------------- add PET m韎
		local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
		local nNewType = t_pet_type[nRand][3]
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("Ch骳 m鮪g i hi謕  chi猽 m� PET th祅h c玭g")
		else
			gf_WriteLogEx("PHUC SINH PET BK", "add th蕋 b筰", 1, "Add pet th蕋 b筰")			
		end
		-------------
		Msg2Player("Ch骳 m鮪g i hi謕  ho祅 th祅h nhi謒 v� Ph鬰 Sinh cho B筺 уng H祅h !!!!")		
		gf_WriteLogEx("PHUC SINH PET BK", "xong giai 畂筺 2", 1, "Ho祅 th祅h Giai 筺 buff")			
	
end

function add_buffEvent2(nWay)
	local nCheck = GetTask(2812)
	if nCheck >= 1 then
		Talk(1,"","B筺  nh薾 ph莕 thng cu鑙 khi s� d鬾g t鑙 產 2 v藅 ph萴 r錳.")
		return 0
	end
	local tNoiNgoai = {
			 [1] = {
						{"N閕 C玭g 6%", "state_m_attack_percent_add", 6},
						{"Sinh L鵦 +6000", "state_life_max_point_add", 8000},
						{"Sinh L鵦 6%", "state_life_max_percent_add", 6},
						{"Kh竛g t蕋 c� +12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo筰 C玭g 12%", "state_p_attack_percent_add", 12},
						{"Sinh L鵦 +6000", "state_life_max_point_add", 10000},
						{"Sinh L鵦 6%", "state_life_max_percent_add", 6},
						{"N閕 ph遪g/Ngo筰 ph遪g +60", "state_i_defence_point_add", 60},
						{"Ngo筰 ph遪g +60", "state_o_defence_point_add", 60},
					},
				}
	local t_pet_type = {
									[1] = {"Th� tr緉g",3333,24},
									[2] = {"Th� x竚",3333,25},
									[3] = {"Th� 甧n",3334,26},		
								}	
	if GetItemCount(2,1,30603) < 999 then
		Talk(1,"","Ti猽 Dao Ng鋍 trong t骾 kh玭g  999 c竔")
		return
	end								
	if DelItem(2,1,30603,999) ~= 1 then
		return 0;
	end								
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);		
	SetTask(2812,1)	--nh薾 ph莕 thng cu鑙 
--	Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize,1)
--	self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
	---------------
	SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t╪g bc nhi謒 v� l猲 gi� tr� 3 l� ho祅 th祅h xong giai 畂筺 2
	gf_WriteLogEx("PHUC SINH PET", "xong giai 畂筺 2", 1, "Ho祅 th祅h Giai 筺 2")												
		local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10) --mod 10 l� gi� tr� x竎 nh c� Ph鬰 Sinh PET 
		nIsPS = (nIsPS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS) --set gi� tr� x竎 nh c� Ph鬰 Sinh PET
		-------------
		local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10)
		nCount_PET_PS = (nCount_PET_PS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10) 
		SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS) --set gi� tr� x竎 nh s� l莕 Ph鬰 Sinh PET
		-------------
		local nNewValue =  SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A),nWay,4)
		SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue ) -- set hng Ph鬰 Sinh c馻 PET
		-------------Set c竎 ch� s� buff
		local nAttrId = 2908130 --29/08/13 + x
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end		
		------------- add PET m韎
		local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
		local nNewType = t_pet_type[nRand][3]
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("Ch骳 m鮪g i hi謕  chi猽 m� PET th祅h c玭g")
		else
			gf_WriteLogEx("PHUC SINH PET BK", "add th蕋 b筰", 1, "Add pet th蕋 b筰")			
		end
		-------------
		Msg2Player("Ch骳 m鮪g i hi謕  ho祅 th祅h nhi謒 v� Ph鬰 Sinh cho B筺 уng H祅h !!!!")		
		gf_WriteLogEx("PHUC SINH PET BK", "xong giai 畂筺 2", 1, "Ho祅 th祅h Giai 筺 buff")			
	
end

function Vet_Activity_GetAdditionPrize_135a(nActivityID,nTaskGrouId,nTaskIDSeq)
	local nCheck = GetTask(2788)
	if nCheck >= 1 then
		Talk("B筺  nh薾 ph莕 thng cu鑙 khi s� d鬾g t鑙 產 2 v藅 ph萴 r錳.")
		return 0
	end
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	ModifyExp(2000000000)
	SetTask(2788,1)	--nh薾 ph莕 thng cu鑙 khi s� d鬾g t鑙 產 2 v藅 ph萴
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);			--task nh薾 thng khi s� d鬾g max c� 2
	gf_WriteLogEx(EVENT_LOG_TITLE, "фi ph莕 thng cu鑙 c飊g", 0, "2 t� kinh nghi謒");		

end