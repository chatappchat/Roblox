--[[
    Made by dizzywig2000, for public use.

    You may use this script in any way.

    MAKE SURE TO PUT THE CODE IN "ServerScriptService"!
]]

local req = 4320590 --ID of the Anti-Cheat script, do not change unless you know what you are doing.
local LOADED = false --Do not touch

local whitelistOptions = { --Options for the whitelist (don't touch if you don't want a whitelist)
  ["WhitelistEnabled"] = false; --Not reccomended, whitelisted users are not affected by the anti cheat.
  ["UsePlayerIdForWhitelist"] = true;
  ["UserPlayerNameForWhitelist"] = false; --Not reccomended, if the user changes their name it will not work.
}

local PlayerIdWhitelist = { --Make sure to set "WhitelistEnabled" and "UsePlayerIdForWhitelist" to true, and "UsePlayerNameForWhitelist" to false.
    [4309534] = true; --You may copy-paste paste this to add players. Replace 4309534 with the player's ID.
}

local PlayerNameWhitelist = { --Make sure to set "WhitelistEnabled" and "UsePlayerNameForWhitelist" to true, and "UsePlayerIdForWhitelist" to false.
    ["Name"] = true; --You may copy-paste paste this to add players. Replace "Name" with the player's username.
}

local function load()
    if LOADED then
       require(req) 
    end
end

game.Players.PlayerAdded:Connect(function(Player)
        local a = Instance.new("StringValue")
        a.Name = "AllowChange"
        if whitelistOptions["WhitelistEnabled"] then
            
            if whitelistOptions["UsePlayerIdForWhitelist"] then
               if PlayerIdWhitelist[Player.UserId] then
                    a.Value = "Whitelisted" 
                    LOADED = true
                else
                    a.Value = "false"
                    LOADED = true
                end 
            end
            
            if whitelistOptions["UsePlayerNameForWhitelist"] then
               if PlayerNameWhitelist[Player.Name] then
                    a.Value = "Whitelisted" 
                    LOADED = true
                else
                    a.Value = "false"
                    LOADED = true
                end 
            end
            
        else
            a.Value = "false"
            LOADED = true
        end
        
        load()
        
end)
