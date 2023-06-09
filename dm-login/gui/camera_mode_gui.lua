local loading = {}

function createLoadingPanel()

    local browser = dgsCreateMediaBrowser(1920,1080,true) 
    loading.browser = {
        elm = browser,
    }
    local load_media dgsMediaLoadMedia(browser,"imgs/test.gif","image")  
    loading.load_media = {
        elm = load_media
    }

    local background = dgsCreateImage(0,0,1,1,browser,true) 
    loading.background = {
        elm = background,
    }
    local sound_btn = guiCreateStaticImage(0.965,0.92,0.03,0.05,"imgs/sound_on.png",true)
    gui.sound_btn = {
        elm = sound_btn,
    }
    ----------------------------------------
    --Sound
    ----------------------------------------
    function change_sound_state()
        sound_state = not sound_state
        sound_effect()
    end
    addEventHandler("onClientGUIClick",gui.sound_btn.elm,change_sound_state)
    guiBringToFront(sound_btn)
    showCursor(true)
end




addEventHandler("onClientResourceStart",resourceRoot,createLoadingPanel)

function destroyLoading()
    for k,v in  pairs(loading) do 
        destroyElement(v.elm)
    end
    loading = {}
end


--------------------------------------------------------------------------------
----------------- CAMERA MODE 
--------------------------------------------------------------------------------
positions = {
    [1] = {-1731.3446044922, 261.22158813477, 22.152299880981, -1730.4549560547, 261.62857055664, 21.945381164551, -1626.5502929688, 415.65701293945, 25.359699249268, -1626.4285888672, 414.69241333008, 25.1256980896},
    [2] = {-1591.8863525391, 445.59948730469, 25.565200805664, -1591.1021728516, 446.16333007812, 25.30597114563, -1494.3171386719, 536.82312011719, 27.119899749756, -1494.9230957031, 536.21105957031, 26.61181640625},
    [3] = {-1523.46875, 480.58880615234, 20.376800537109, -1522.6628417969, 480.09875488281, 20.044647216797, -1405.3454589844, 457.76489257812, 20.886400222778, -1406.1809082031, 458.17611694336, 20.521715164185},
    [4] = {-1494.8216552734, 533.13317871094, 36.387901306152, -1493.9285888672, 532.75213623047, 36.14884185791, -1219.4709472656, 544.50207519531, 39.840999603271, -1220.3778076172, 544.18487548828, 39.563385009766},
    [5] = {-1305.7930908203, 525.15600585938, 16.172500610352, -1306.677734375, 524.77764892578, 15.899889945984, -1385.7735595703, 526.41510009766, 17.21960067749, -1384.9294433594, 525.94775390625, 16.957023620605},
    [6] = {-1406.2291259766, 508.00650024414, 34.581199645996, -1405.3531494141, 507.62557983398, 34.285297393799, -1302.7254638672, 515.10852050781, 32.556301116943, -1303.5057373047, 514.59020996094, 32.206207275391},
    [7] = {-1300.1094970703, 499.97360229492, 29.632699966431, -1300.69921875, 499.23239135742, 29.312032699585, -1320.8863525391, 393.26119995117, 16.90060043335, -1321.1583251953, 394.22158813477, 16.839731216431},
    [8] = {-1310.1041259766, 299.76629638672, 30.181100845337, -1310.9676513672, 300.0856628418, 29.790706634521, -1453.7229003906, 273.53671264648, 22.523700714111, -1453.8259277344, 274.46084594727, 22.155788421631},
    [9] = {88.690101623535, 1778.4514160156, 34.900299072266, 89.279594421387, 1779.2153320312, 34.637718200684, 96.839599609375, 1873.1739501953, 31.084299087524, 97.545700073242, 1872.6599121094, 30.597290039062},
    [10] = {132.5166015625, 1876.7685546875, 26.618299484253, 132.06390380859, 1876.0053710938, 26.157266616821, 135.07800292969, 1836.7778320312, 26.335300445557, 134.74555969238, 1837.6281738281, 25.927400588989},
    [11] = {242.26879882812, 1909.0419921875, 35.028499603271, 241.55332946777, 1909.6574707031, 34.697982788086, 169.98599243164, 1910.4327392578, 37.01549911499, 170.72444152832, 1910.9610595703, 36.596538543701},
    [12] = {359.28280639648, 2067.6120605469, 30.567100524902, 358.71597290039, 2066.8129882812, 30.36697769165, 299.35369873047, 1905.5645751953, 27.672500610352, 299.96987915039, 1906.3432617188, 27.554594039917},
    [13] = {-152.5066986084, 1814.8477783203, 57.609901428223, -152.30435180664, 1815.7564697266, 57.244655609131, -147.67190551758, 2032.5090332031, 46.233699798584, -148.02770996094, 2031.625, 45.930595397949},
    [14] = {-149.16889953613, 2007.8511962891, 45.108501434326, -148.3757019043, 2008.4388427734, 44.948753356934, -75.556900024414, 2093.6687011719, 53.625499725342, -74.811248779297, 2093.2436523438, 53.112419128418},
    [15] = {-52.257999420166, 2071.7766113281, 26.108600616455, -51.338130950928, 2071.4714355469, 25.86222076416, 108.35659790039, 2072.689453125, 27.130100250244, 107.63000488281, 2072.1105957031, 26.760011672974}
}

currentIndex = 1
tick = getTickCount()
sinanimDuration = 5000
function cinematicAnim ( )

    if getTickCount() >= tick + sinanimDuration then
        if currentIndex + 1 > #positions then
            currentIndex = 0
        end
        currentIndex = currentIndex + 1
        tick = getTickCount()
    end
    local x, y, z, lx, ly, lz = createAnim(tick, positions[currentIndex][1], positions[currentIndex][2], positions[currentIndex][3], positions[currentIndex][4], positions[currentIndex][5], positions[currentIndex][6], positions[currentIndex][7], positions[currentIndex][8], positions[currentIndex][9], positions[currentIndex][10], positions[currentIndex][11], positions[currentIndex][12])
    setCameraMatrix(x, y, z, lx, ly, lz)
end
addEventHandler("onClientRender", root, cinematicAnim)

setCameraTarget(localPlayer)

function createAnim ( tick, a1, a2, a3, a4, a5, a6, a1_, a2_, a3_, a4_, a5_, a6_)
    a1 = tonumber(a1) or 0
    a1_ = tonumber(a1_) or 0
    a2 = tonumber(a2) or 0
    a2_ = tonumber(a2_) or 0
    a3 = tonumber(a3) or 0
    a3_ = tonumber(a3_) or 0
    a4 = tonumber(a4) or 0
    a4_ = tonumber(a4_) or 0
    a5 = tonumber(a5) or 0 
    a5_ = tonumber(a5_) or 0
    a6 = tonumber(a6) or 0
    a6_ = tonumber(a6_) or 0
    a1,a2,a3 = interpolateBetween( a1, a2, a3, a1_, a2_, a3_, ( getTickCount() - tick ) / sinanimDuration, "Linear" )
    a4,a5,a6 = interpolateBetween( a4, a5, a6, a4_, a5_, a6_, ( getTickCount() - tick ) / sinanimDuration, "Linear" )
    return a1,a2,a3,a4,a5,a6
end

addCommandHandler("getcamera", function()
    local x, y, z, lx, ly, lz = getCameraMatrix ()
    text = x..", "..y..", "..z..", "..lx..", "..ly..", "..lz
    outputChatBox(text)
    setClipboard(text)
end)