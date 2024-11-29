Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
function OnUse()

INVINCIBILITY_TIME = 5;
nTbIdx = 5;

		RemoveState(9908);
		RemoveState(9909);
		RemoveState(9910);
		RemoveState(9911);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);

		CastState("state_p_attack_percent_add",tXueHen[nTbIdx][2],2*60*18,1,9908,1);
		CastState("state_m_attack_percent_add",tXueHen[nTbIdx][2],2*60*18,1,9909,1);
		CastState("state_life_max_percent_add",tXueHen[nTbIdx][3],2*60*18,1,9910,1);	
		CastState("state_buff_resist",tXueHen[nTbIdx][4],2*60*18,1,9911,1);
		SyncCustomState(1,9908,1,tXueHen[nTbIdx][5]);
		Msg2Player("B�n nh�n ���c "..tXueHen[nTbIdx][5].."Hi�u qu�: "..tXueHen[nTbIdx][6].."Duy tr� 2 ph�t.");

end

tXueHen = {
	{21,150,300,14,"Tuy�t H�n c�p 10","C�ng k�ch t�ng 150%, gi�i h�n sinh m�nh t�ng 300%, mi�n d�ch tr�ng th�i b� h�i 14 l�n. "},
	{19,150,300,14,"Tuy�t H�n c�p 10","C�ng k�ch t�ng 150%, gi�i h�n sinh m�nh t�ng 300%, mi�n d�ch tr�ng th�i b� h�i 14 l�n. "},
	{17,135,270,14,"Tuy�t H�n c�p 9","C�ng k�ch t�ng 135%, gi�i h�n sinh m�nh t�ng 270%, mi�n d�ch tr�ng th�i b� h�i 14 l�n. "},
	{15,120,240,13,"Tuy�t H�n c�p 8","C�ng k�ch t�ng 120%, gi�i h�n sinh m�nh t�ng 240%, mi�n d�ch tr�ng th�i b� h�i 13 l�n. "},
	{13,105,210,13,"Tuy�t H�n c�p 7","C�ng k�ch t�ng 105%, gi�i h�n sinh m�nh t�ng 210%, mi�n d�ch tr�ng th�i b� h�i 13 l�n. "},
	{11,90 ,180,12,"Tuy�t H�n c�p 6","C�ng k�ch t�ng 90%, gi�i h�n sinh m�nh t�ng 180%, mi�n d�ch tr�ng th�i b� h�i 12 l�n. "},
	{9 ,75 ,150,12,"Tuy�t H�n c�p 5","C�ng k�ch t�ng 75%, gi�i h�n sinh m�nh t�ng 150%, mi�n d�ch tr�ng th�i b� h�i 12 l�n. "},
	{7 ,60 ,120,10,"Tuy�t H�n c�p 4","C�ng k�ch t�ng 60%, gi�i h�n sinh m�nh t�ng 120%, mi�n d�ch tr�ng th�i b� h�i 10 l�n. "},
	{5 ,45 ,90 , 5,"Tuy�t H�n c�p 3","C�ng k�ch t�ng 45%, gi�i h�n sinh m�nh t�ng 90%, mi�n d�ch tr�ng th�i b� h�i 5 l�n. "},
	{3 ,30 ,60 , 3,"Tuy�t H�n c�p 2","C�ng k�ch t�ng 30%, gi�i h�n sinh m�nh t�ng 60%, mi�n d�ch tr�ng th�i b� h�i 3 l�n. "},
	{1 ,15 ,30 , 1,"Tuy�t H�n c�p 1","C�ng k�ch t�ng 15%, gi�i h�n sinh m�nh t�ng 30%, mi�n d�ch tr�ng th�i b� h�i 1 l�n. "},
};