local function iconbrowser()
	local frame = vgui.Create("DFrame")
	frame:SetSize(400, 300)
	frame:SetPos(5, ScrH() - 305)
	frame:SetTitle("Icon Browser")
	frame:MakePopup()
	frame:SetIcon("icon16/folder_picture.png")

	local path_pnl = vgui.Create("EditablePanel",frame)
	path_pnl:Dock(TOP)
	path_pnl:DockMargin(4, 0, 4, 4)
	path_pnl:SetTall(24)

	local path = vgui.Create("DTextEntry",path_pnl)
	path:SetText("")
	path:Dock(FILL)
	path:SetEditable(false)

	local copy = vgui.Create("DButton",path_pnl)
	copy:Dock(RIGHT)
	copy:SetWide(24)
	copy:SetImage("icon16/page_copy.png")
	copy:SetText("")
	function copy:DoClick()
		SetClipboardText(path:GetText())
	end

	local browser = vgui.Create("DIconBrowser",frame)
	browser:Dock(FILL)
	browser:DockMargin(4, 0, 4, 4)
	function browser:OnChange()
		path:SetText(self:GetSelectedIcon())
	end
end

concommand.Add("menu_iconbrowser", iconbrowser)