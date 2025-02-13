Include("\\script\\class\\mem.lua")

function createTvList(tTaskList)
	local t = new(tTaskList);
	local tbTempTaskID = {};
	for i,v in t do
		if type(v) == "table" then
			for k = v[1], v[2] do
				tinsert(tbTempTaskID,k);
			end
		elseif type(v) == "number" then
			tinsert(tbTempTaskID,v);
		else
			tbTempTaskID[i] = v;
		end
		t[i] = nil;
	end
	for k,v in tbTempTaskID do
		t[k] = v;
	end
	t.n = nil;
	return t;
end

tCampBase = {};

function tCampBase:getRealTaskId(n)
	return self.tbTaskID[n];
end

--获取任务变量值，类GetTask
--返回GetTask()值和该任务变量
function tCampBase:GetCampTask(nCampTaskID)
	if not nCampTaskID then
		print("[task manage] error:no CampTaskID!",nCampTaskID);
		crash()
		return 0;
	end
	local nRealTaskID = self:getRealTaskId(nCampTaskID);
	if not nRealTaskID then
		print(Val2Str(self))
		print("[task manage] error:RealTaskID nil!",nCampTaskID);
		crash()
		return 0;
	end
	return GetTask(nRealTaskID),nRealTaskID;
end

--设置任务变量值，类SetTask
function tCampBase:SetCampTask(nCampTaskID,nValue)
	if not nCampTaskID then
		print("[task manage] error:no CampTaskID!");
		crash()
		return 0
	end
	local nRealTaskID = self:getRealTaskId(nCampTaskID);
	if not nRealTaskID then
		print("[task manage] error:RealTaskID nil!");
		crash()
		return 0;
	end
	SetTask(nRealTaskID,nValue);
end

function tCampBase:AddCampTask(nCampTaskID,nValue)
	if not nCampTaskID then
		print("[task manage] error:no CampTaskID!");
		crash()
		return 0
	end
	local nRealTaskID = self:getRealTaskId(nCampTaskID);
	if not nRealTaskID then
		print("[task manage] error:RealTaskID nil!");
		crash()
		return 0;
	end
	SetTask(nRealTaskID,GetTask(nRealTaskID) + nValue);
end

function tCampBase:ModifyCampTask(nCampTaskID, nValue)
	self:SetCampTask(nCampTaskID, self:GetCampTask(nCampTaskID) + nValue);
end

--获取任务变量byte值，类GetByte
function tCampBase:GetCampByte(nCampTaskID,nByte)
	if not nCampTaskID then
		print("[task manage] error:no CampTaskID!");
		crash()
		return 0;
	end
	local nRealTaskID = self:getRealTaskId(nCampTaskID);
	if not nRealTaskID then
		print("[task manage] error:RealTaskID nil!");
		crash()
		return 0;
	end
	return GetByte(GetTask(nRealTaskID),nByte);
end

--设置任务变量byte值，类SetByte
function tCampBase:SetCampByte(nCampTaskID,nByte,nValue)
	if not nCampTaskID then
		print("[task manage] error:no CampTaskID!");
		crash()
		return 0
	end
	local nRealTaskID = self:getRealTaskId(nCampTaskID);
	if not nRealTaskID then
		print("[task manage] error:RealTaskID nil!");
		crash()
		return 0;
	end
	SetTask(nRealTaskID,SetByte(GetTask(nRealTaskID),nByte,nValue));
end

--获取任务变量bit值，类GetBit
function tCampBase:GetCampBit(nCampTaskID,nBit)
	if not nCampTaskID then
		print("[task manage] error:no CampTaskID!");
		crash()
		return 0;
	end
	local nRealTaskID = self:getRealTaskId(nCampTaskID);
	if not nRealTaskID then
		print("[task manage] error:RealTaskID nil!");
		crash()
		return 0;
	end
	return GetBit(GetTask(nRealTaskID),nBit);
end

--设置任务变量bit值，类Setbit
function tCampBase:SetCampBit(nCampTaskID,nBit,nValue)
	if not nCampTaskID then
		print("[task manage] error:no CampTaskID!");
		crash()
		return 0
	end
	local nRealTaskID = self:getRealTaskId(nCampTaskID);
	if not nRealTaskID then
		print("[task manage] error:RealTaskID nil!");
		crash()
		return 0;
	end
	SetTask(nRealTaskID,SetBit(GetTask(nRealTaskID),nBit,nValue));
end

--检测变量是否在变量池内
function tCampBase:CheckTaskID(tbGlbTaskList)
	local nResult = 1;
	local tbCampTaskList = self.tbTaskID;
	for i=1,getn(tbCampTaskList) do
		local v = tbGlbTaskList[tbCampTaskList[i]];
		if v == nil then
			print("[task manage] error:CampID("..self.CampID..") TaskID("..tbCampTaskList[i]..") nil!");
		crash()
			nResult = 0;
		elseif v == 1 then
			tbGlbTaskList[tbCampTaskList[i]] = 2;
		else
			print("[task manage] error:TaskID("..tbCampTaskList[i]..") reuse!! CampID("..self.CampID..")");
		crash()
			nResult = 0;
		end
	end
	return nResult;
end

--清除过期活动任务变量
function tCampBase:ClearTaskID()
	local tbCampTaskList = self.tbTaskID;
	for i = 1,getn(tbCampTaskList) do
		local nCurValue = self:GetCampTask(i);
		self:SetCampTask(i,0);
		WriteLog(format("[TaskID Clear] [Acc:%s name:%s] [Nhi謒 v� bi課 lng: %d x鉧, tr� trc khi x鉧: %d]",GetAccount(),GetName(),tbCampTaskList[i],nCurValue));
	end	
end

function tCampBase:CheckCampDate()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= self.DateState and nDate <= self.DateEnd then
		return 1;
	end
	return 0;
end


tCampManage = {};
function tCampManage:SetCampFlag(tCamp)
	local nEmptyTaskID = self:GetFirstEmptyCampFlagTaskID();
	if nEmptyTaskID ~= 0 then
		SetTask(nEmptyTaskID, tCamp.CampID);
		return 1
	end	
	return 0
end

--playerloninin.lua中和活动开始的NPC中调用
function tCampManage:ClearCampTaskID()
	local nDate = tonumber(date("%Y%m%d"));
	local tCurAllCamp = {};  --未过期所有活动
	for i,v in tAllCamp do
		if v:CheckCampDate() == 1 then
			tCurAllCamp[getn(tCurAllCamp)+1] = v
		end
	end
	if getn(tCurAllCamp) == 0 then
		return 0;
	end
	
	for i,v in tCurAllCamp do
		local nCheckCampFlag = 0;
		for j = 1,getn(tbTaskList.tbCampFlag) do
			local nCurCampID = GetTask(tbTaskList.tbCampFlag[j]); --获取角色参与的活动ID
			if v.CampID == nCurCampID then
				nCheckCampFlag = 1;
				break;
			end
		end
		if nCheckCampFlag == 0 then
			WriteLog(format("[Camp Clear] [Acc:%s name:%s] [Nhi謒 v� bi課 lng  x鉧 ID ho箃 ng th祅h %d.]",GetAccount(),GetName(),v.CampID));
			v:ClearTaskID();
			local nCheckFlag = tCampManage:SetCampFlag(v);
			if nCheckFlag ~= 1 then
				print("[Camp Clear] Error:CampFlag set fail!!(CampID:"..v.CampID..")");
			end
		end
	end
end

--检测所有未过期活动变量是否重用或不在变量池内
function tCampManage:CheckCampTaskID(bShow, day)
	local nDate = day or tonumber(date("%Y%m%d"));
	local tCurAllCamp = {};  --未过期所有活动
	for i,v in tAllCamp do
		if nDate <= v.DateEnd then
			tCurAllCamp[getn(tCurAllCamp)+1] = v
		end
	end
	if getn(tCurAllCamp) == 0 then
		return 0;
	end
	
	local tbGlbTaskFlag = tbTaskList.tbCampList;
	local tbGlbTaskList = {};
	for i=1,getn(tbGlbTaskFlag) do
		tbGlbTaskList[tbGlbTaskFlag[i]] = 1;
	end
	
	for i,v in tCurAllCamp do
		v:CheckTaskID(tbGlbTaskList);
	end
	
	if bShow == 1 then
		for k,v in tbGlbTaskList do
			if v == 1 then
				print(k,v)
			end
		end
	end
end

function tCampManage:GetCampTb(nCampID)
	for i = 1,getn(tAllCamp) do
		if tAllCamp[i].CampID == nCampID then
			return tAllCamp[i];
		end
	end
	return 0;
end

function tCampManage:GetFirstEmptyCampFlagTaskID()
	--清除过期的CampFlag
	local nDate = tonumber(date("%Y%m%d"));
	for i = 1,getn(tbTaskList.tbCampFlag) do
		local nCurCampID = GetTask(tbTaskList.tbCampFlag[i]);
		if nCurCampID ~= 0 then
			local tCampTemp = tCampManage:GetCampTb(nCurCampID);
			if tCampTemp == 0 then
				print("[Camp Clear] Error:tCampTemp is number!!(CampID:"..nCurCampID..")");
				SetTask(tbTaskList.tbCampFlag[i],0);
			end
			if tCampTemp.DateEnd < nDate then
				SetTask(tbTaskList.tbCampFlag[i],0);
			end
		end
	end
	
	for i = 1,getn(tbTaskList.tbCampFlag) do
		local nCurCampID = GetTask(tbTaskList.tbCampFlag[i]);
		if nCurCampID == 0 then
			return tbTaskList.tbCampFlag[i]
		end
	end
	return 0;
end

function tCampManage:CheckCampID()
	local nTotalCamp = getn(tAllCamp);
	for i=1,nTotalCamp-1 do
		for j = i+1,nTotalCamp do
			if tAllCamp[i].CampID == tAllCamp[j].CampID then
				print("[task manage] error:CampID reuse!!!ID:"..tAllCamp[i].CampID..".");
			end
		end
	end
end

--任务变量管理
tbTaskList = {
	tbCampFlag = {3000,3001,3002,3003,3004,3005,3006,3007,3008,3009,}, --记录角色参与的活动ID（CampID），最多9个活动一起！！！！！！！！
	tbCampList = createTvList({{3010,3200},}),                                       --循环使用的任务变量池，如果是table则表示集合
};

tCamp_A = {
	CampID = 1,             --活动ID
	IDNum = 40,             --需要用到的变量数，暂时没用到
	DateState = 20101223,   --活动开始的时间
	DateEnd = 20110128,     --活动结束的时间（清除变量时间），一般比活动规定结束时间延后1个月，（注意：这段变量必须在活动结束后，才可被重用，再次重用时，才会清变量！！！）
	tbTaskID = createTvList({{3010,3050},}), --活动用到的变量，从tbCampList池中选取，注意活动之间的冲突	
};
tCamp_A = inherit(tCampBase,tCamp_A);

tCamp_B = {
	CampID = 2,             --活动ID
	IDNum = 35,             --需要用到的变量数
	DateState = 20110120,   --活动开始的时间
	DateEnd = 20110306,     --活动结束的时间（清除变量时间），一般比活动规定结束时间延后1个月，（注意：这段变量必须在活动结束后，才可被重用，再次重用时，才会清变量！！！）
	tbTaskID = createTvList({{3051,3085},}), --活动用到的变量，从tbCampList池中选取，注意活动之间的冲突	
};
tCamp_B = inherit(tCampBase,tCamp_B);


tCamp_C = {
	CampID = 3,
	IDNum = 25,
	DateState = 20110324,
	DateEnd = 20110521,
	tbTaskID = createTvList({{3086,3110},}),
};
tCamp_C = inherit(tCampBase, tCamp_C);

tCamp_2014_01 = {
	CampID = 43,
	IDNum =	 55,
	DateState = 20140121,
	DateEnd   = 20140326,
	tbTaskID = createTvList({{3176, 3200}, {3010, 3039}});
};
tCamp_2014_01 = inherit(tCampBase, tCamp_2014_01);

tCamp_2014_02 = {
	CampID = 44,
	IDNum =	 44,
	DateState = 20140220,
	DateEnd   = 20140426,
	tbTaskID = createTvList({{3040, 3083}});
};
tCamp_2014_02 = inherit(tCampBase, tCamp_2014_02);

tCamp_2014_03 = {
	CampID = 45,
	IDNum =	 50,
	DateState = 20140320,
	DateEnd   = 20140530,
	tbTaskID = createTvList({{3084, 3133}});
};
tCamp_2014_03 = inherit(tCampBase, tCamp_2014_03);

tCamp_2014_04 = {
	CampID = 46,
	IDNum =  30,
	DateState = 20140424,
	DateEnd   = 20140628,
	tbTaskID = createTvList({{3134, 3163}});
};
tCamp_2014_04 = inherit(tCampBase, tCamp_2014_04);

tCamp_treasure_legend = {
	CampID = 47,
	IDNum =	 30,
	DateState = 20140424,
	DateEnd   = 20140618,
	tbTaskID = createTvList({{3164, 3193}});
};
tCamp_treasure_legend = inherit(tCampBase, tCamp_treasure_legend);

tCamp_2014_05 = {
	CampID = 48,
	IDNum =  45,
	DateState = 20140522,
	DateEnd   = 20140725,
	tbTaskID = createTvList({{3010, 3054}});
};
tCamp_2014_05 = inherit(tCampBase, tCamp_2014_05);

tCamp_2014_xinfu = {
	CampID = 49,
	IDNum =  25,
	DateState = 20140522,
	DateEnd   = 20141129,
	tbTaskID = createTvList({{3055, 3079}});
};
tCamp_2014_xinfu = inherit(tCampBase, tCamp_2014_xinfu);


tCamp_2014_06 = {
	CampID = 50,
	IDNum =  50,
	DateState = 20140619,
	DateEnd   = 20140830,
	tbTaskID = createTvList({{3080, 3129}});
};
tCamp_2014_06 = inherit(tCampBase, tCamp_2014_06);


tCamp_2014_07 = {
	CampID = 51,
	IDNum =  60,
	DateState = 20140724,
	DateEnd   = 20140923,
	tbTaskID = createTvList({{3130, 3189}});
};
tCamp_2014_07 = inherit(tCampBase, tCamp_2014_07);

tCamp_2014_08 = {
	CampID = 52,
	IDNum =  38,
	DateState = 20140821,
	DateEnd   = 20141102,
	tbTaskID = createTvList({{3190, 3200}, {3010, 3036}});
};
tCamp_2014_08 = inherit(tCampBase, tCamp_2014_08);

tCamp_2014_09 = {
	CampID = 53,
	IDNum =  68,
	DateState = 20140925,
	DateEnd   = 20141129,
	tbTaskID = createTvList({{3037, 3054}, {3080,3129}});
};
tCamp_2014_09 = inherit(tCampBase, tCamp_2014_09);

tCamp_treasure_legend_14_10 = {
	CampID = 54,
	IDNum =	 30,
	DateState = 20141023,
	DateEnd   = 20141117,
	tbTaskID = createTvList({{3130, 3159}});
};
tCamp_treasure_legend_14_10 = inherit(tCampBase, tCamp_treasure_legend_14_10);

tCamp_2014_10 = {
	CampID = 55,
	IDNum =  30,
	DateState = 20141023,
	DateEnd   = 20141228,
	tbTaskID = createTvList({{3160, 3189}});
};
tCamp_2014_10 = inherit(tCampBase, tCamp_2014_10);

tCamp_2014_1111 = {
	CampID = 56,
	IDNum =  15,
	DateState = 20141101,
	DateEnd   = 20141118,
	tbTaskID = createTvList({{3010, 3025}});
};
tCamp_2014_1111 = inherit(tCampBase, tCamp_2014_1111);

tCamp_2014_11 = {
	CampID = 57,
	IDNum =  15,
	DateState = 20141120,
	DateEnd   = 20150120,
	tbTaskID = createTvList({{3190, 3200}, {3026,3036},{3130,3159}});
};
tCamp_2014_11 = inherit(tCampBase, tCamp_2014_11);

tCamp_2014_12 = {
	CampID = 58,
	IDNum =  68,
	DateState = 20141211,
	DateEnd   = 20150210,
	tbTaskID = createTvList({{3037, 3105}});
};
tCamp_2014_12 = inherit(tCampBase, tCamp_2014_12);

tCamp_qx_14_12 = {
	CampID = 59,
	IDNum =  1,
	DateState = 20141211,
	DateEnd   = 20150210,
	tbTaskID = createTvList({3010});
};
tCamp_qx_14_12 = inherit(tCampBase, tCamp_qx_14_12);

tCamp_2015_01 = {
	CampID = 60,
	IDNum =  19,
	DateState = 20150115,
	DateEnd   = 20150311,
	tbTaskID = createTvList({
		{3023, 3025},
		{3106, 3121},
		{3123, 3124},
		--{3106, 3129},
		--{3160, 3189},
	}),
}
tCamp_2015_01 = inherit(tCampBase, tCamp_2015_01);

tCamp_2015_01_HappyState = {
	CampID = 61,
	IDNum =  13,
	DateState = 20150115,
	DateEnd   = 20150311,
	tbTaskID = createTvList({
		{3011, 3022},
		{3122, 3122},
	}),
}
tCamp_2015_01_HappyState = inherit(tCampBase, tCamp_2015_01_HappyState);

tCamp_2015_02 = {
	CampID = 62,
	IDNum =  44,
	DateState = 20150210,
	DateEnd   = 20150425,
	tbTaskID = createTvList({
		{3125, 3168},
	}),
}
tCamp_2015_02 = inherit(tCampBase, tCamp_2015_02);


tAllCamp = {
	--tCamp_A,
	--tCamp_B,
	--tCamp_C,
	--tCamp_D,

	tCamp_2014_01,
	tCamp_2014_02,
	tCamp_2014_03,
	tCamp_2014_04,
	tCamp_treasure_legend,
	tCamp_2014_05,
	tCamp_2014_xinfu,
	tCamp_2014_06,
	tCamp_2014_07,
	tCamp_2014_08,
	tCamp_2014_09,
	tCamp_treasure_legend_14_10,
	tCamp_2014_10,
	tCamp_2014_1111,
	tCamp_2014_11,
	tCamp_2014_12,
	tCamp_qx_14_12,
	tCamp_2015_01,
	tCamp_2015_01_HappyState,
	tCamp_2015_02,
};

tCampManage:CheckCampTaskID();
tCampManage:CheckCampID();
