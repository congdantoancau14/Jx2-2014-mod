--С�������ʯ
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
  		return 0;
	end
	if DelItem(2,1,30404,1) == 1 then
		AddItem(2,1,30403,10);
	end
end