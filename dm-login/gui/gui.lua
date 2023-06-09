loadstring(exports["MahLib"]:getFunctions("animations"))()
loadstring(exports.dgs:dgsImportFunction())()  


gui = {}
elm_colors = {}
local sx,sy = guiGetScreenSize()
function createLoginPanel()

    local browser = dgsCreateMediaBrowser(1920,1080) 
    gui.browser = {
        elm = browser,
    }
    local load_media dgsMediaLoadMedia(browser,"imgs/background.gif","image")  
    gui.load_media = {
        elm = load_media
    }

    local background = dgsCreateImage(0,0,1,1,browser,true) 
    gui.background = {
        elm = background,
    }

    local main = guiCreateStaticImage(0.365,0.28,0.25,0.4,"imgs/main.png",true)

    guiSetProperty(main,"ImageColours","tl:BB".."000000".." tr:BB".."000000".." bl:65".."000000".." br:65".."000000".."")

    gui.main = {
        elm = main,
    }

    ---------------------------------
    --account name edit
    ---------------------------------
    local login_account_name_lbl = guiCreateLabel(0.1,0.05,0.8,0.1,language[language_selection]["account_name_tooltip"],true,main)
    guiLabelSetHorizontalAlign(login_account_name_lbl,"center")
    guiSetFont(login_account_name_lbl,"default-bold-small")
    gui.login_account_name_lbl = {
        elm = login_account_name_lbl,
        language_row = "account_name_tooltip",
    }
    local account_name_edit = createEditBox(1,0.1,0.09,"",main)
    
    gui.account_name_edit = {
        elm = account_name_edit,
    }


    ---------------------------------
    --password edit
    ---------------------------------
    local login_password_lbl = guiCreateLabel(0.1,0.24,0.8,0.1,language[language_selection]["password_tooltip"],true,main)
    guiLabelSetHorizontalAlign(login_password_lbl,"center")
    guiSetFont(login_password_lbl,"default-bold-small")
    gui.login_password_lbl = {
        elm = login_password_lbl,
        language_row = "password_tooltip",
    }
    local password_edit = createEditBox(2,0.1,0.28,"",main,true)

    gui.password_edit = {
        elm = password_edit,
    }

    ---------------------------------
    --login button
    ---------------------------------
    
    local login_button = guiCreateStaticImage(0.1,0.68,0.8,0.1,"imgs/btn.png",true,main)
    local login_button_lbl = guiCreateLabel(0,-0.08,1,1,language[language_selection]["login_btn"],true,login_button)
    guiSetEnabled(login_button_lbl,false)
    guiSetProperty(login_button,"ImageColours","tl:FF".."ef3038".." tr:FF".."e61919".." bl:65".."ef3038".." br:65".."e61919".."")
    guiLabelSetColor(login_button_lbl,255,255,255)
    guiLabelSetHorizontalAlign(login_button_lbl,"center")
    guiLabelSetVerticalAlign(login_button_lbl,"center")
    gui.login_button = {
        elm = login_button,
        language_row = "login_btn",
        label_elm = login_button_lbl,
    }



    elm_colors[login_button_lbl] = {
        hover_color = "tl:FF".."e61919".." tr:FF".."ef3038".." bl:65".."e61919".." br:65".."ef3038".."",
        normal_color = "tl:FF".."ef3038".." tr:FF".."e61919".." bl:65".."ef3038".." br:65".."e61919".."",
        click_color = "tl:AA".."ef3038".." tr:AA".."e61919".." bl:35".."ef3038".." br:35".."e61919".."",
        elm = login_button,
        x = 0.1,
        y = 0.68,
        w = 0.8,
        h = 0.1,
        anim = true,
        size = 0.02,
    }

    elm_colors[login_button] = {
        hover_color = "tl:FF".."e61919".." tr:FF".."ef3038".." bl:65".."e61919".." br:65".."ef3038".."",
        normal_color = "tl:FF".."ef3038".." tr:FF".."e61919".." bl:65".."ef3038".." br:65".."e61919".."",
        click_color = "tl:AA".."ef3038".." tr:AA".."e61919".." bl:35".."ef3038".." br:35".."e61919".."",
        elm = login_button,
        x = 0.1,
        y = 0.68,
        w = 0.8,
        h = 0.1,
        anim = true,
        size = 0.02,
    }

    ---------------------------------
    --Register panel on off button
    ---------------------------------
    local goto_register_button = guiCreateStaticImage(0.1,0.81,0.8,0.1,"imgs/btn.png",true,main)
    local goto_register_button_lbl = guiCreateLabel(0,-0.08,1,1,language[language_selection]["goto_register"],true,goto_register_button)
    guiSetProperty(goto_register_button,"ImageColours","tl:FF".."808080".." tr:FF".."000000".." bl:65".."808080".." br:65".."000000".."")
    guiSetEnabled(goto_register_button_lbl,false)
    guiLabelSetColor(goto_register_button_lbl,255,255,255)
    guiLabelSetHorizontalAlign(goto_register_button_lbl,"center")
    guiLabelSetVerticalAlign(goto_register_button_lbl,"center")
    gui.goto_register_button = {
        elm = goto_register_button,
        language_row = "goto_register",
        label_elm = goto_register_button_lbl,
    }


    elm_colors[goto_register_button] = {
        hover_color = "tl:FF".."000000".." tr:FF".."808080".." bl:65".."000000".." br:65".."808080".."",
        normal_color = "tl:FF".."808080".." tr:FF".."000000".." bl:65".."808080".." br:65".."000000".."",
        click_color = "tl:AA".."808080".." tr:AA".."000000".." bl:35".."808080".." br:35".."000000".."",
        elm = goto_register_button,
        x = 0.1,
        y = 0.81,
        w = 0.8,
        h = 0.1,
        anim = true,
        size = 0.02,
    }
    elm_colors[goto_register_button_lbl] = {
        hover_color = "tl:FF".."000000".." tr:FF".."808080".." bl:65".."000000".." br:65".."808080".."",
        normal_color = "tl:FF".."808080".." tr:FF".."000000".." bl:65".."808080".." br:65".."000000".."",
        click_color = "tl:AA".."808080".." tr:AA".."000000".." bl:35".."808080".." br:35".."000000".."",
        elm = goto_register_button,
        x = 0.1,
        y = 0.81,
        w = 0.8,
        h = 0.1,
        anim = true,
        size = 0.02,
    }



    ---------------------
    --Remember me check
    ---------------------
    local remember_me_chk = guiCreateCheckBox(0.1,0.38,0.3,0.1,language[language_selection]["remember_me"],false,true,main)
    gui.remember_me_chk = {
        elm = remember_me_chk,
        language_row = "remember_me",
    }
    ---------------------
    --forgot password
    ---------------------
    local forgot_password = guiCreateLabel(0.5,0.41,0.4,0.1,language[language_selection]["forgot_password"],true,main)
    guiLabelSetHorizontalAlign(forgot_password,"right")
    gui.forgot_password = {
        elm = forgot_password,
        language_row = "forgot_password",
    }

    ----------------------------------
    --Rules Label
    ----------------------------------
    local rules_lbl = guiCreateLabel(0.1,0.47,0.8,0.25,language[language_selection]["rules"],true,main)
    gui.rules = {
        elm = rules_lbl,
        language_row = "rules",
    }


    ----------------------------------
    --Language Select Button
    ----------------------------------
    local tr_button = guiCreateStaticImage(0.435,0.8,0.05,0.05,"imgs/tr.png",true)
    gui.tr_button = {
        elm = tr_button,
    }
    elm_colors[tr_button] = {
        x = 0.435,
        y = 0.8,
        w = 0.05,
        h = 0.05,
        anim = true,
        elm = tr_button,
        size = 0.005,
    }
    local en_button = guiCreateStaticImage(0.505,0.8,0.05,0.05,"imgs/en.png",true)
    gui.en_button = {
        elm = en_button,
    }
    elm_colors[en_button] = {
        x = 0.505,
        y = 0.8,
        w = 0.05,
        h = 0.05,
        anim = true,
        elm = en_button,
        size = 0.005,
    }




    ---------------------------------------------------------------
    ------------ Register Pannel
    ---------------------------------------------------------------
    local register_panel = guiCreateStaticImage(0.365,0.28,0.25,0.4,"imgs/main.png",true)

    guiSetProperty(register_panel,"ImageColours","tl:BB".."000000".." tr:BB".."000000".." bl:65".."000000".." br:65".."000000".."")

    gui.register_panel = {
        elm = register_panel,
    }

    ---------------------------------
    --account name edit
    ---------------------------------
    local register_account_name_lbl = guiCreateLabel(0.1,0.05,0.8,0.1,language[language_selection]["account_name_tooltip"],true,register_panel)
    guiLabelSetHorizontalAlign(register_account_name_lbl,"center")
    guiSetFont(register_account_name_lbl,"default-bold-small")
    gui.register_account_name_lbl = {
        elm = register_account_name_lbl,
        language_row = "account_name_tooltip",
    }
    local register_account_name_edit = createEditBox(3,0.1,0.09,"",register_panel)


    ---------------------------------
    --password edit
    ---------------------------------
    local register_password_lbl = guiCreateLabel(0.1,0.27,0.8,0.1,language[language_selection]["password_tooltip"],true,register_panel)
    guiLabelSetHorizontalAlign(register_password_lbl,"center")
    guiSetFont(register_password_lbl,"default-bold-small")
    gui.register_password_lbl = {
        elm = register_password_lbl,
        language_row = "password_tooltip",
    }
    local register_password_edit = createEditBox(4,0.1,0.31,"",register_panel)

    ---------------------------------
    --gmail
    ---------------------------------
    local register_mail_lbl = guiCreateLabel(0.1,0.45,0.8,0.1,language[language_selection]["mail_tooptip"],true,register_panel)
    guiLabelSetHorizontalAlign(register_mail_lbl,"center")
    guiSetFont(register_mail_lbl,"default-bold-small")
    gui.register_mail_lbl = {
        elm = register_mail_lbl,
        language_row = "mail_tooptip",
    }
    local register_gmail_edit =  createEditBox(5,0.1,0.49,"",register_panel)


    ---------------------------------
    --go to login button
    ---------------------------------
    
    local go_to_login_button = guiCreateStaticImage(0.1,0.81,0.8,0.1,"imgs/btn.png",true,register_panel)
    local go_to_login_button_lbl = guiCreateLabel(0,-0.08,1,1,language[language_selection]["goto_login"],true,go_to_login_button)
    guiSetProperty(go_to_login_button,"ImageColours","tl:FF".."ef3038".." tr:FF".."e61919".." bl:65".."ef3038".." br:65".."e61919".."")
    guiSetEnabled(go_to_login_button_lbl,false)
    guiLabelSetColor(go_to_login_button_lbl,255,255,255)
    guiLabelSetHorizontalAlign(go_to_login_button_lbl,"center")
    guiLabelSetVerticalAlign(go_to_login_button_lbl,"center")
    gui.go_to_login_button = {
        elm = go_to_login_button,
        language_row = "goto_login",
        label_elm = go_to_login_button_lbl,
    }

    elm_colors[go_to_login_button_lbl] = {
        hover_color = "tl:FF".."e61919".." tr:FF".."ef3038".." bl:65".."e61919".." br:65".."ef3038".."",
        normal_color = "tl:FF".."ef3038".." tr:FF".."e61919".." bl:65".."ef3038".." br:65".."e61919".."",
        click_color = "tl:AA".."ef3038".." tr:AA".."e61919".." bl:35".."ef3038".." br:35".."e61919".."",
        elm = go_to_login_button,
        x = 0.1,
        y = 0.81,
        w = 0.8,
        h = 0.1,
        anim = true,
        size = 0.02,
    }

    elm_colors[go_to_login_button] = {
        hover_color = "tl:FF".."e61919".." tr:FF".."ef3038".." bl:65".."e61919".." br:65".."ef3038".."",
        normal_color = "tl:FF".."ef3038".." tr:FF".."e61919".." bl:65".."ef3038".." br:65".."e61919".."",
        click_color = "tl:AA".."ef3038".." tr:AA".."e61919".." bl:35".."ef3038".." br:35".."e61919".."",
        elm = go_to_login_button,
        x = 0.1,
        y = 0.81,
        w = 0.8,
        h = 0.1,
        anim = true,
        size = 0.02,
    }

    ---------------------------------
    --Register click
    ---------------------------------
    local register_button = guiCreateStaticImage(0.1,0.68,0.8,0.1,"imgs/btn.png",true,register_panel)
    local register_button_lbl = guiCreateLabel(0,-0.08,1,1,language[language_selection]["register_btn"],true,register_button)
    guiSetProperty(register_button,"ImageColours","tl:FF".."808080".." tr:FF".."000000".." bl:65".."808080".." br:65".."000000".."")
    guiLabelSetColor(register_button_lbl,255,255,255)
    guiSetEnabled(register_button_lbl,false)
    guiLabelSetHorizontalAlign(register_button_lbl,"center")
    guiLabelSetVerticalAlign(register_button_lbl,"center")
    gui.register_button = {
        elm = register_button,
        language_row = "register_btn",
        label_elm = register_button_lbl,
    }
    elm_colors[register_button] = {
        hover_color = "tl:FF".."000000".." tr:FF".."808080".." bl:65".."000000".." br:65".."808080".."",
        normal_color = "tl:FF".."808080".." tr:FF".."000000".." bl:65".."808080".." br:65".."000000".."",
        click_color = "tl:AA".."808080".." tr:AA".."000000".." bl:35".."808080".." br:35".."000000".."",
        elm = register_button,
        x = 0.1,
        y = 0.68,
        w = 0.8,
        h = 0.1,
        anim = true,
        size = 0.02,
    }
    elm_colors[register_button_lbl] = {
        hover_color = "tl:FF".."000000".." tr:FF".."808080".." bl:65".."000000".." br:65".."808080".."",
        normal_color = "tl:FF".."808080".." tr:FF".."000000".." bl:65".."808080".." br:65".."000000".."",
        click_color = "tl:AA".."808080".." tr:AA".."000000".." bl:35".."808080".." br:35".."000000".."",
        elm = register_button,
        x = 0.1,
        y = 0.68,
        w = 0.8,
        h = 0.1,
        anim = true,
        size = 0.02,
    }

    showCursor(true)
    guiSetVisible(register_panel,false)
    showChat(false)
    start_functions()
    guiSetVisible(main,false)
    guiSetVisible(tr_button,false)
    guiSetVisible(en_button,false)
    dgsSetVisible(background,false)
end


addEventHandler("onClientResourceStart",resourceRoot,createLoginPanel)
---------------------------
--Button Hover animation
---------------------------
addEventHandler("onClientMouseEnter",root,function()
    if elm_colors[source] then 
        if elm_colors[source].hover_color then 
            guiSetProperty(elm_colors[source].elm,"ImageColours",elm_colors[source].hover_color)

        end
        if elm_colors[source].anim then 
            guiSizeTo(elm_colors[source].elm,elm_colors[source].w+elm_colors[source].size,elm_colors[source].h+elm_colors[source].size,true,"Linear",300)
            guiMoveTo(elm_colors[source].elm,elm_colors[source].x-(elm_colors[source].size/2),elm_colors[source].y-(elm_colors[source].size/2),true,"Linear",300)
        end
    end
end)
addEventHandler("onClientMouseLeave",root,function()
    if elm_colors[source] then 
        if elm_colors[source].normal_color then 
            guiSetProperty(elm_colors[source].elm,"ImageColours",elm_colors[source].normal_color)
        end
        if elm_colors[source].anim then 
            guiSizeTo(elm_colors[source].elm,elm_colors[source].w,elm_colors[source].h,true,"Linear",300)
            guiMoveTo(elm_colors[source].elm,elm_colors[source].x,elm_colors[source].y,true,"Linear",300)
        end
    end
end)
addEventHandler("onClientGUIMouseDown",root,function(key)
    if key == "left" then
        if elm_colors[source] then 
            if elm_colors[source].click67_color then 

                guiSetProperty(elm_colors[source].elm,"ImageColours",elm_colors[source].click_color)
            end
            if elm_colors[source].anim then 
                guiSizeTo(elm_colors[source].elm,elm_colors[source].w-elm_colors[source].size,elm_colors[source].h-elm_colors[source].size,true,"Linear",50)
                guiMoveTo(elm_colors[source].elm,elm_colors[source].x+(elm_colors[source].size/2),elm_colors[source].y+(elm_colors[source].size/2),true,"Linear",50)
            end
        end
    end
end)
addEventHandler("onClientGUIMouseUp",root,function(key)
    if key == "left" then
        if elm_colors[source] then 
            if elm_colors[source].hover_color then 
                guiSetProperty(elm_colors[source].elm,"ImageColours",elm_colors[source].hover_color)

            end
            if elm_colors[source].anim then 
                guiSizeTo(elm_colors[source].elm,elm_colors[source].w+elm_colors[source].size,elm_colors[source].h+elm_colors[source].size,true,"Linear",300)
                guiMoveTo(elm_colors[source].elm,elm_colors[source].x-(elm_colors[source].size/2),elm_colors[source].y-(elm_colors[source].size/2),true,"Linear",300)
            end
        end
    end
end)




--Change language Function
-------------------------------
function change_language(lng)
    language_selection = lng 
    ---------------------
    --Set Text for all gui
    ----------------------
    for k,v in pairs(gui) do 
        if v.language_row then 
            guiSetText(v.elm,language[lng][v.language_row])
        end
        if v.label_elm then 
            guiSetText(v.label_elm,language[lng][v.language_row])
        end
    end
    
end
addEvent("language:change",true)
addEventHandler("language:change",localPlayer,change_language)
