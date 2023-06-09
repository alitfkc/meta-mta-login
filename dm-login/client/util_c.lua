
function goto_register()
    if source == gui.goto_register_button.elm then
        guiSetEnabled(gui.goto_register_button.elm,false)
        guiAlphaTo(gui.main.elm,0,"Linear",500)
        guiSetAlpha(gui.register_panel.elm,0)
        guiAlphaTo(gui.register_panel.elm,1,"Linear",1000,500)
        setTimer(function()
            guiSetEnabled(gui.goto_register_button.elm,true)
            guiSetVisible(gui.main.elm,false)
            guiSetVisible(gui.register_panel.elm,true)
        end,500,1)
    end
end

function goto_login()
    if source == gui.go_to_login_button.elm then
        guiSetEnabled(gui.go_to_login_button.elm,false)
        guiAlphaTo(gui.register_panel.elm,0,"Linear",500)
        guiSetAlpha(gui.main.elm,0)
        guiAlphaTo(gui.main.elm,1,"Linear",1000,500)
        setTimer(function()
            guiSetEnabled(gui.go_to_login_button.elm,true)
            guiSetVisible(gui.register_panel.elm,false)
            guiSetVisible(gui.main.elm,true)
        end,500,1)
    end
end


function clickLogin()
    if source == gui.login_button.elm then
        if editBox[1].text =="" then
            guiAlertAnim(gui.login_account_name_lbl.elm,true) 
            guiAlertAnim(editBox[1].back,false)
            return 
        end
        if editBox[2].text =="" then 
            guiAlertAnim( gui.login_password_lbl.elm,true) 
            guiAlertAnim(editBox[2].back,false)
            return 
        end
        triggerServerEvent("dm-login:setLogin",localPlayer,editBox[1].text,editBox[2].text,guiCheckBoxGetSelected(gui.remember_me_chk.elm),sound_state,language_selection)
    end
end

function loggedIn()
 
    for k,v in pairs(editBox) do 
        destroyElement(v.back)
        destroyElement(v.label_text)
        destroyElement(v.label_warning_text)
        destroyElement(v.ierror)
        destroyElement(v.line_active)
    end
    for k,v in pairs(gui) do
        guiStopAniming(v.elm)
        destroyElement(v.elm)
        if v.label_elm then 
            destroyElement(v.label_elm)
        end
    end

    setCameraTarget(localPlayer)
    showChat(true)  
    showCursor(false)
end

------------------------------------------
--save data load
------------------------------------------
function loadSaveData(t)

    guiCheckBoxSetSelected(gui.remember_me_chk.elm,true)
    editBox[1].text = t.account_name
    editBox[2].text = t.password
    local p = ""
    for i=1,string.len(t.password) do 
        p = p.."•"
    end
    guiSetText(editBox[1].label_text,t.account_name)
    guiSetText(editBox[2].label_text,p)
    sound_state = t.music_state
    sound_effect()
    language_selection = t.language
    triggerEvent("language:change",localPlayer,t.language)

end

-----------------------------------------
-- Register Acccount
-----------------------------------------
function registerAccount()
    if source == gui.register_button.elm then 
        if editBox[3].text == "" then
            guiAlertAnim(gui.register_account_name_lbl.elm,true) 
            guiAlertAnim(editBox[3].back,false)
            return 
        end
        if editBox[4].text =="" then 
            guiAlertAnim( gui.register_password_lbl.elm,true) 
            guiAlertAnim(editBox[4].back,false)
            return 
        end
        if editBox[5].text =="" then 
            guiAlertAnim( gui.register_mail_lbl.elm,true) 
            guiAlertAnim(editBox[5].back,false)
            return 
        end
        triggerServerEvent("dm-login:registerAccount",localPlayer,editBox[3].text,editBox[4].text,editBox[5].text,guiCheckBoxGetSelected(gui.remember_me_chk.elm))
    end
end
----------------------------------------
-- set language
----------------------------------------
function setLanguageTR()
    triggerEvent("language:change",localPlayer,"tr")
end
function setLanguageEN()
    triggerEvent("language:change",localPlayer,"en")
end
----------------------------------------
-- fforgotPassword
----------------------------------------
function forgotPassword()
    if source == gui.forgot_password.elm then 
        if editBox[1].text =="" then
            guiAlertAnim(gui.login_account_name_lbl.elm,true) 
            guiAlertAnim(editBox[1].back,false)
            return 
        end
        triggerServerEvent("dm-login:forgotPassword",localPlayer,editBox[1].text)
    end
end


-------------------------------------------------------------------
-- sound enabled or disabled ( - sesi aktif et veya deaktif et - )
-------------------------------------------------------------------

sound_state = true
local music = false
local vol_timer = false
--guiSetVisible(browser,false)
function sound_effect()
    if sound_state then 
        if gui.sound_btn then
            guiStaticImageLoadImage(gui.sound_btn.elm,"imgs/sound_on.png")
        end
        sound_add()
    else
        if gui.sound_btn then
            guiStaticImageLoadImage(gui.sound_btn.elm,"imgs/sound_off.png")
        end

        sound_remove()
    end
end


function sound_add()
    if not music then
        local url = table.random(music_urls)
        music = playSound(url[1],true)
        setSoundVolume(music,0)
        vol_timer = setTimer(function()
            if not music then 
                killTimer(vol_timer)
                vol_timer = false 
            end
            if isElement(music) then
                setSoundVolume(music,getSoundVolume(music)+0.1)
            end
        end,1000,(volume/0.1))
    end
end


function sound_remove()
    if music then 
        destroyElement(music)
        music = false
    end
end

function table.random ( theTable )
    return theTable[math.random ( #theTable )]
end
sound_effect()
----------------------------------------
--Add Gui Events
----------------------------------------
function   start_functions()

    functions_client = {
        -------------
        --Panel on/off
        ["goto_register"] =goto_register,
        ["goto_login"] = goto_login,
        ["login_btn"] = clickLogin,
        ["register_btn"] = registerAccount,
        ["forgot_password"] = forgotPassword,
    }
    
    --we add bindkey for panel 


    for k,v in pairs(gui) do
        if v.language_row and functions_client[v.language_row] then 
            addEventHandler("onClientGUIClick",v.elm,functions_client[v.language_row])
            --[[
            here i used the language row name to choose which guin goes to which function. 
            Otherwise, there would be another unnecessary variable.
            ]]--
        end
    end
    addEventHandler("onClientGUIClick",gui.tr_button.elm,setLanguageTR)
    addEventHandler("onClientGUIClick",gui.en_button.elm,setLanguageEN)    

end
addEventHandler("onClientResourceStart",resourceRoot,function()

    events = {
        {event_name="dm-login:connectPlayer",func =loadSaveData},
        {event_name = "dm-login:loggedin",func = loggedIn},
    }
    
    for k,v in ipairs(events) do
        if v.event_name and v.func then 
            addEvent(v.event_name,true)
            addEventHandler(v.event_name,localPlayer,v.func)
        end
    end
    
end)
