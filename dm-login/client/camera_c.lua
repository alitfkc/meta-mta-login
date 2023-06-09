

function createLoginSystem()
    local fadeout_img =guiCreateStaticImage(0,0,1,1,"imgs/fade.png",true)
    guiSetProperty(fadeout_img,"ImageColours","tl:ff".."000000".." tr:ff".."000000".." bl:ff".."000000".." br:ff".."000000".."")
    guiSetAlpha(fadeout_img,0)
    guiSetEnabled(fadeout_img,false)
    setTimer(function()
        guiAlphaTo(fadeout_img,1,"Linear",3000)
    end,7000,1)

    setTimer(function(fadeout_img)
        destroyLoading()
        guiAlphaTo(fadeout_img,0,"Linear",5000)
        removeEventHandler("onClientRender", root, cinematicAnim)
        --gui start
        guiSetVisible(gui.main.elm,true)
        guiSetVisible(gui.tr_button.elm,true)
        guiSetVisible(gui.en_button.elm,true)
        dgsSetVisible(gui.background.elm,true)
        ---------
        guiBringToFront(fadeout_img)
        guiBringToFront(gui.sound_btn.elm)
        setTimer(function(fadeout_img)
            guiSetVisible(fadeout_img,false)
        end,6000,1,fadeout_img)
    end,10000,1,fadeout_img)

end

setTimer(function()
    createLoginSystem()
end,2000,1)