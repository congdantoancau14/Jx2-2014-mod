--作者：严军
--创建日期：07年11月13日14:50
--接引弟子脚本
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
g_szInforHeader = "<color=green>Ti誴 d蒼  t�<color>: ";

function main()
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	local nDiff = BR_GetCurDiff();
	local nStage = BR_GetCurStage();
	local selTab = {
				"M� rng ch鴄 /open_box",
				"Xem trang b� hi謓 t筰 c� th� v祇 秈 k� ti誴 hay kh玭g /#check_equipment("..nDiff..","..nStage..")",
				"Xem h筺 ch� khi猽 chi課/BR_KnowLimit",
				"\nB総 u vt 秈/start_stage",
				"Ta mu鑞 r阨 kh醝 m藅 th蕋/leave_stage",
				}
	local szSay = "";
	if nPlayerState == MS_STATE_END_WAITING then
		tremove(selTab,1);
		tremove(selTab,1);
		tremove(selTab,1);
		tremove(selTab,1);
		szSay = "B筺 mu鑞 r阨 kh醝 n琲 vt 秈 ph秈 kh玭g?";
	else
		szSay = "B筺 s緋 v祇 <color=yellow>"..TB_DIFF_NAME[nDiff].."<color> 秈 <color=yellow>"..nStage.." <color>."
	end;
	if DEBUG_VERSION == 1 and nPlayerState == MS_STATE_STARTED then
		tinsert(selTab,"V祇 秈 k� ti誴 (th� luy謓)/next_stage");
	end;
	tinsert(selTab,"Kh玭g c� g�/nothing");
	Say(g_szInforHeader..szSay,getn(selTab),selTab);
end;

function next_stage()
	BR_EndStage();
end;

function leave_stage()
	local selTab = {
				"ng! Ta mu鑞 r阨 kh醝/leave_confirm",
				"Ta mu鑞 ti誴 t鬰 � l筰 y/nothing",
				}
	Say(g_szInforHeader.."B筺 mu鑞 r阨 kh醝 m藅 th蕋?",getn(selTab),selTab);				
end;

function start_stage()
	local nDiff,nStage = 0,0;
	nDiff = BR_GetCurDiff();
	nStage = BR_GetCurStage();
--	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
--		Say("Tr筺g th竔 hi謓 t筰 c馻 b筺 kh玭g  甶襲 ki謓  v祇 秈, xin h穣 ki觤 tra gi韎 h筺 vt 秈.",0)
--		return 0;
--	end;
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	if nPlayerState == MS_STATE_READY or DEBUG_VERSION == 1 then
		BR_NextStage();
	end;
end;

function leave_confirm()
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	if nPlayerState == MS_STATE_END_WAITING then

	end;
	BR_CloseStage();
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInforHeader.."Ngi v蒼 ch璦 thu閏 v� rng c馻 m譶h.");
		return 0;
	end;
	OpenBox();
end;

function check_equipment(nDiff,nStage)
	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
		Say("Tr筺g th竔 hi謓 t筰 c馻 b筺 kh玭g  甶襲 ki謓  v祇 秈, xin h穣 ki觤 tra gi韎 h筺 vt 秈.",0)
	else
		Say("Tr筺g th竔 hi謓 t筰 c馻 b筺  甶襲 ki謓  v祇 秈.",0);
	end;
end;
