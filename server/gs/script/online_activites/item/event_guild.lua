Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\online_activites\\2010_11\\activity_02\\head.lua");
Include("\\script\\online\\qingming\\qingming_head.lua");

function OnUse(nItemIdx)
	local tbSay = {
		"Ho�t ��ng Truy t�m l�ng ��n may m�n/get_mooncake_info",	
		"Ho�t ��ng D�ng t�ng hoa H��ng D��ng/get_sunflower_info",
		"Ho�t ��ng ti�t Thanh Minh/get_qingming_info",
	}
	
	tinsert(tbSay, "��ng c�m nang/nothing");
	Say("C�m nang n�y ch� ghi ch�p s� s�i v� m�t s� ho�t ��ng. Xin h�y ��n t�m ��i s� ho�t ��ng �� v�n th�m v� c�c ho�t ��ng kh�c.",getn(tbSay),tbSay);
end

function nothing() end
