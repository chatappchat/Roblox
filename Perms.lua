--[[
    Made by dizzywig2000, for public use.

    You may use this script in any way.

    MAKE SURE TO PUT THE CODE IN A LOCAL-SCRIPT IN "StarterPlayerGui"!
]]

local Player = game.Players.LocalPlayer
local Service = game:GetService("GroupService")
local GroupID = 10240219 --Change this to the ID of your group
local permissionList = {
    [243] = true,GroupID;
    [244] = true,GroupID;
    [245] = true,GroupID;
}

function getPerms(Player,GID)
    for i = 1,#permissionList do
        for v = 2,#permissionList do
            if i then if v == GID then return true else return false end else return false end
        end
    end
end

if Player then
    if permissionList[GetRankInGroup(GroupID)] then
        if getPerms(Player, GroupID) then
            if not Player:FindFirstChild("Role") then
                local f = Instance.new("StringValue")
                f.Name = "Role"
                f.Value = Player:GetRoleInGroup(GroupID)
                f.Parent = Player
                print("[INFO] : Loaded permissions for "..Player.Name.." ! Their rank is "..Player.Role.Value)
            end
        end
    end
else warn("[ERROR] : Failed to load permissions because player did not load. (LocalScript:Load Perms:Line 9,27)") end
