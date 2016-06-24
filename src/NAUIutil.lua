function W_createCheckbutton(id, parent, x_loc, y_loc, displayname, tooltip)
  local checkbutton = CreateFrame("CheckButton", id, parent, "OptionsCheckButtonTemplate");
  checkbutton:SetPoint("TOPLEFT", x_loc, y_loc-10);
  getglobal(checkbutton:GetName() .. 'Text'):SetText(displayname);
  return checkbutton;
end

function W_createNCBtn(id,n,parent,label,top, left)
  local theFrame=CreateFrame("Frame","Frame"..id,parent)

  theFrame:SetPoint("TOPLEFT",parent,"TOPLEFT",left, top)
  theFrame:SetWidth(20*n)
  theFrame:SetHeight(16)

  theFrame.Label=theFrame:CreateFontString(nil,"OVERLAY","GameFontNormal")
  theFrame.Label:SetTextColor(1,1,1,1)
  theFrame.Label:SetText(" "..label)
  theFrame.Label:SetPoint("LEFT",theFrame,"LEFT",0,0)

  for i=0,n-1 do
    local name = id..i;
    theFrame[name]=CreateFrame("CheckButton",name,theFrame)
    theFrame[name]:SetWidth(20);
    theFrame[name]:SetHeight(20);
    --		theFrame[name]:SetScript("OnClick",function(this)
    --			if this:GetChecked() then this:SetChecked(true)
    --			else this:SetChecked(false) end
    --		end);
    theFrame[name]:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up");
    theFrame[name]:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down");
    theFrame[name]:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled");
    theFrame[name]:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check");
    theFrame[name]:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight");
  end

  for i=0,n-2 do
    theFrame[id..i]:SetPoint("RIGHT",theFrame[id..i+1],"LEFT",0,0);
  end
  theFrame[id..n-1]:SetPoint("RIGHT",theFrame[id..n-1]:GetParent(),"RIGHT",theFrame.Label:GetWidth(),0);

  theFrame:Show();
  return theFrame;
end

function W_createLabelFrame(id,parent,label,top, left, width, height)
  local theFrame=CreateFrame("Frame","Frame"..id,parent)

  theFrame:SetPoint("TOPLEFT",parent,"TOPLEFT",left, top)
  theFrame:SetWidth(width)
  theFrame:SetHeight(height)

  theFrame.Label=theFrame:CreateFontString(nil,"OVERLAY","GameFontNormal")
  theFrame.Label:SetTextColor(1,1,1,1)
  theFrame.Label:SetText(label)
  theFrame.Label:SetPoint("LEFT",theFrame,"LEFT",0,0)

  theFrame:Show();
  return theFrame;
end

function W_UpdateLabelText(id, label)
  local obj = getglobal(id);
  if(obj ~= nil)then
    obj:SetText(label);
  end
end
