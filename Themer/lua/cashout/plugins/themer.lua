Cashout.Plugins:AddOption("themer", "theme", "gmoddefault")
Cashout.Plugins:AddMenuItem("themer", "Refresh Theme", function() RunConsoleCommand("menu_themer_refresh") end)

local function ColorHack()
    local DMenuOption = table.Copy(vgui.GetControlTable("DMenuOption"))
    DMenuOption.Init = function(self)
        self:SetContentAlignment(4)
        self:SetTextInset(30,0)
        self:SetTextColor(self:GetSkin().Colours.Label.Dark)
        self:SetChecked(false)
    end

    derma.DefineControl( "DMenuOption", "Menu Option Line", DMenuOption, "DButton" )
end

local function Init()
    include("skins/themer_menu.lua")
    derma.RefreshSkins()
    function derma.GetDefaultSkin()
        return derma.GetNamedSkin("themer_menu")
    end
end
Init()
ColorHack()

concommand.Add("menu_themer_refresh",Init)