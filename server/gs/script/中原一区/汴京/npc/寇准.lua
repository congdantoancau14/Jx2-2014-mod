--function main()
--Say ("<color=green>寇准<color>：寇某受命掌管理藩院，一切有关奖品、礼物事宜均有我负责，有什么可以帮到你的？",2,"请帮我兑换奖品/jiangpin","暂时没有/no")
--end

--function jiangpin()
--Say ("<color=green>寇准<color>：对不起，你没有什么奖品好领。",0)  --调用界面
--end;


--function no()
--Say ("<color=green>寇准<color>：鄙人最欣赏象你这样的诚实君子。",0)  
--end;

--任务：画中画功能演示
--地点： 任务：
--策划：樊万松  2004.03.
--append by lizhi
--2005-8-8 11:20

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_汴京\\task_main.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\201203\\kuizheng\\kuizeng.lua")

function main()
    local nLevel;
    local nStep;
    nLevel = GetLevel();
    nStep = GetTask(TASK_BJ_ID);
    local nXbValue = GetTask(TASK_XB_ID)
    
	if nXbValue == 100 then
		nXbValue = 0
	end
    --领取西北任务01西夏暗涌 要求 等级》= 70
    if nXbValue == 0 and nLevel >= 70 then
  		task_001_01_0();
  		return  	
    end
    
    --西北任务01西夏暗涌，还没与百晓生对话
    if nXbValue == 1 then
    	task_001_01_1();
    	return 
    end

    
    ---------------------------------- 西北区29枭雄之宴------------------------------------------
    
    --询问关于龙门宴请柬的事情
    if GetTask(TASK_XB_ID_01) == 69 then
  		task_029_02_0();
  		return  	
    end
    
    --还未向店小二取得请柬
    if GetTask(TASK_XB_ID_01) == 70 then
  		task_029_02_1();
  		return  	
    end
    
    --还未打败李元庆
    if GetTask(TASK_XB_ID_01) == 71 then
  		task_029_02_2();
  		return  	
    end
    
    --已经打败李元庆与寇准对话
    if GetTask(TASK_XB_ID_01) == 72 then
  		task_029_04_0();
  		return  	
    end
    
    --已经打败李元庆领取兑换装备
    if GetTask(TASK_XB_ID_01) == 73 then
  		task_029_04_0_2();
  		return  	
    end
    
    --已经兑换了装备，兑换储物箱
    if GetTask(TASK_XB_ID_01) == 74 then
  		task_029_04_0_5();
  		return
    end
     
    --尚未领取到兑换装备（Bug修复）
    if GetTask(TASK_XB_ID_01) == 75 then
  		task_029_04_0_100();
  		return
    end
    
    --领取到兑换装备后对话（Bug修复）
    if GetTask(TASK_XB_ID_01) == 76 then
  		task_029_05_0();
  		return  	
    end
    
    ---------------------------------------------------------------------------------------------
    
    if GetTask(1) >= 25 and GetTask(1) < 100 then
        if (nStep == 0) then
            task_000_00();
            SetTask(131,2);
            if GetTask(130) == 2 and GetTask(132) == 2 then
                SetTask(1, 26); --如果完成新手任务的送信任务(最后一步)，则关闭任务面板
            end;
            return
        elseif (nStep == 13) then
            task_013_00();
            return
        elseif (nStep == 14) then
            task_014_00();
            return
        end;
    end;

	--2012年4月共力活动
	if gf_CheckEventDateEx(60) == 1 then
		gf_Say(VET_201203_KuiZeng_tbTalkDialog);
	else
		Talk(1,"","L穙 phu y tuy kh玭g ra kh醝 Bi謓 Kinh nh璶g chuy謓 trong thi猲 h� ta u bi誸 c�.");
	end

end;

function  pipcap()
--	ClosePiP()
	Pn2 = GetCaptainName()
	if( Pn2 == 0) then
			Talk(1,"","Ti誧 cho ngi kh玭g c� i trng!")
	else	
			Talk(1,"","襲 ngi mu鑞 bi誸 y, hi hi!")
			SetPiPView(Pn2,1)
	end;
end;

function  pipwhere()
--	ClosePiP()
	Talk(1,"","襲 ngi mu鑞 bi誸 y, hi hi!")
	SetPiPView(314,1582,2903)
end;

function  pipkz()
--	ClosePiP()
	Talk(1,"","襲 ngi mu鑞 bi誸 y!")
	SetPiPView(200,1426,2741)
end;

function  closepip()
		ClosePiP()
		Talk(1,"","Mai m鑤 ng xem thng ta n鱝 nh�!")
end;