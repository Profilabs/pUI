--[[ iRepair -- VARIABLES CAN BE CHANGED AS YOU WANT ]]--
local 	iRepair_Chatter 	= true
local 	iRepair_GRF		= true
local 	iRepair_ROGR		= false

--[[ AUTO REPAIR SERVICES ]]--
local iRepair = CreateFrame("Frame", "iRepair")
	iRepair:RegisterEvent("MERCHANT_SHOW")
	iRepair:SetScript("OnEvent", function()
	local cost = GetRepairAllCost()
	local function iRepair_Guild()
		if iRepair_Chatter then
			print(" Guild Bank Auto Repair for: ".. GetCoinTextureString(cost) )
		end
		RepairAllItems(1)
	end
	local function iRepair_Self()
		if iRepair_Chatter then
			print(" Auto Repair Service You payed: ".. GetCoinTextureString(cost) )
		end
		RepairAllItems()
	end
	if IsModifierKeyDown() then
		return
	elseif CanMerchantRepair() and cost ~= 0 then
		if iRepair_GRF and CanGuildBankRepair() and cost <= GetGuildBankMoney() and (cost <= GetGuildBankWithdrawMoney() or GetGuildBankWithdrawMoney() == -1) then
			if iRepair_ROGR and GetNumRaidMembers() ~= 0 then
				iRepair_Guild()
			elseif not iRepair_ROGR then
				iRepair_Guild()
			elseif cost <= GetMoney() then
				iRepair_Self()
			else
				print(" Not enough Guild Funds to Auto Repair, Please Try Manually.")
			end
		elseif cost <= GetMoney() then
			iRepair_Self()
		else
			print(" Darn you don't have enough cash to Auto Repair. You need "..GetCoinTextureString(cost).." total to repair." )
		end
	end
end)
