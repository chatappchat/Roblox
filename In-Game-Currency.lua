local Service = game:GetService("DataStoreService")
local DataStore = Service:GetDataStore("Money")
local Data

local PreKey = "CHANGE THIS TO SOMETHING RANDOM" --Change this variable to something completely random
local Key = "-"..PreKey

game.Players.PlayerAdded:Connect(function(Player)
    local e = Instance.new("IntValue")
    e.Name = "Money"
    e.Value = 0
    e.Parent = Player
    
    local success, errormessage = pcall(function()
        Data = DataStore:GetAsync(Player.UserId..Key)
    end)
      
      if success then
        Player.Money.Value = Data
        print("Loaded data successfully for "..Player.Name)
      else
        print("There was an error loading data for "..Player.Name)
        warn("Error Message: "..errormessage)
      end
  end)
  
  game.Players.PlayerRemoving:Connect(function(Player)
    local success, errormessage = pcall(function()
        DataStore:SetAsync(Player.UserId..Key..Player.Money.Value)
    end)
    
    if success then
      print("Successfully saved data for "..Player.Name)
    else
      print("There was an error saving data for "..Player.Name)
      warn("Error Message: "..errormessage)
    end
  end)
