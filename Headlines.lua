Single = true
HeadlineShowing = false

HeadlineFadeColor = {1,1,1,0.4}

HeadlinesTable = {
    --{Single, Text, ComingUp, ComingUpOnlyBox}
    {single = true, textLo = "Construction resumed"},
    {single = false, textHi = "Hellow", textLo = "Test"},
    {single = true,textLo = "22:30 The Papers", comingUp = true},
    {single = true,textLo = "Coming up on Breakfast", comingUp = true, comingUpOnlyBox = true},
}
HeadlinesIndex = 1

Headline = {

    LeftBarPurple = {
        x = 240,
        y = 780,
        w = 5,
        h = 205,
        col = ThemeColor
    },

    LeftBarWhite = {
        x = 240,
        y = 780,
        w = 5,
        h = 205,
    },

    BBCBox = {
        x = 270,
        y = 780,
        
        w = 215,
        h = 44,
        col = ThemeColor
    },

    comingUp = false,

    comingUpBox = {
        x = 485,
        y = 780,
        w = 190,
        h = 44,
        col = {0.95,0.95,0.95,1}
    },

    comingUpText = {
        x = 493,
        y = 780,
        text = "COMING UP",
        col = {73/255,73/255,73/255,1}
    },

    comingUpOnly = false,

    BBCText = {
        x = 390,
        y = 780,
        w = 250,
        h = 42,
        col = {1,1,1,1},
        Text = "NEWS"
    },

    BBCLogo = {
        x = 280,
        y = 787,
    },
    

    TextXLo = 270,
    TextYLo = 820,
    TextLo = "Test",

    TextXHi = 270,
    TextYHi = 680,
    TextHi = "Testing",


}
local function lines(str)
    local result = {}
    for line in str:gmatch '[^\n]+' do
      table.insert(result, line)
    end
    return result
  end

--Function that splits a string into a table by the carrot symbol
local function split(str, pat)
    local t = {}  -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pat
    local last_end = 1
    local s, e, cap = str:find(fpat, 1)
    while s do
      if s ~= 1 or cap ~= "" then
        table.insert(t,cap)
      end
      last_end = e+1
      s, e, cap = str:find(fpat, last_end)
    end
    if last_end <= #str then
      cap = str:sub(last_end)
      table.insert(t, cap)
    end
    return t
  end



function AdvHeadline()
    if HeadlineShowing then
        if Single then HideHeadlineSingle() else HideHeadlineDouble() end
        ShowTransition()
        Timer.after(1, function() AdvHeadline() end)
    elseif TitleLogo.Showing then
        HideTitleLogo()
        Timer.after(1, function() AdvHeadline() end)
    else
        if HeadlinesIndex > #HeadlinesTable then HeadlinesIndex = 1 end

        --Coming up box
        if HeadlinesTable[HeadlinesIndex].comingUp == true then
            Headline.comingUp = true
        else
            Headline.comingUp = false
        end

        --Coming up only box
        if HeadlinesTable[HeadlinesIndex].comingUpOnlyBox then
            Headline.comingUpOnly = true
        else
            Headline.comingUpOnly = false
        end

        --Single or double
        if HeadlinesTable[HeadlinesIndex].single then
            Single = true
            Headline.TextLo = HeadlinesTable[HeadlinesIndex].textLo
            ShowHeadlineSingle()
        else
            Single = false
            Headline.TextHi = HeadlinesTable[HeadlinesIndex].textHi
            Headline.TextLo = HeadlinesTable[HeadlinesIndex].textLo
            ShowHeadlineDouble()
        end
        HeadlinesIndex = HeadlinesIndex + 1
    end
end

 
function HideHeadlineSingle()
    Anim.to(HeadlineFadeColor, 1.8, {1,1,1,0})
    HeadlineShowing = false
    --Move whole logo box up
    Anim.to(Headline.BBCBox, .5, {y = 780-50}):ease("quartout")
    Anim.to(Headline.BBCText, .5, {y = 780-50}):ease("quartout")
    Anim.to(Headline.BBCLogo, .5, {y = 787-50}):ease("quartout")
    Anim.to(Headline.comingUpBox, .5, {y = 780-50}):ease("quartout")
    Anim.to(Headline.comingUpText, .5, {y = 780-50}):ease("quartout")

    --Make Left Bar Purple and White shrink downwards
    LeftBarPurpleAnim = Anim.to(Headline.LeftBarPurple, 0.8, {y = 780+205}):ease("quartout")
    LeftBarWhiteAnim = Anim.to(Headline.LeftBarWhite, 0.8, {y = 780+205}):ease("quartout")

    --Move Text up
    Anim.to(Headline, 0.8, {TextYLo = 820-215}):ease("quartout"):delay(0.05)

end

function ShowHeadlineSingle()

    --if logo is showing, hide it
    if TitleLogo.Showing then
        HideTitleLogo()
        Timer.after(1, function() ShowHeadlineSingle() end)
        return
    end

    Single = true
    Anim.to(HeadlineFadeColor, 1.5, {1,1,1,1})
    HeadlineShowing = true
    --Clear left bar anim
    if LeftBarPurpleAnim ~= nil then
        LeftBarPurpleAnim:stop()
        LeftBarWhiteAnim:stop()
    end

    --Set Double height for left bars
    Headline.LeftBarWhite.h = 205
    Headline.LeftBarPurple.h = 205

    --Move whole logo box up
    Headline.BBCBox.y = 780+50
    Headline.BBCText.y = 780+50
    Headline.BBCLogo.y = 787+50
    Headline.comingUpBox.y = 780+50
    Headline.comingUpText.y = 780+50
    Anim.to(Headline.BBCBox, 1, {y = 780}):ease("quartout"):delay(0.2)
    Anim.to(Headline.BBCText, 1, {y = 780}):ease("quartout"):delay(0.2)
    Anim.to(Headline.BBCLogo, 1, {y = 787}):ease("quartout"):delay(0.2)
    Anim.to(Headline.comingUpBox, 1, {y = 780}):ease("quartout"):delay(0.2)
    Anim.to(Headline.comingUpText, 1, {y = 780}):ease("quartout"):delay(0.2)

    --Make Left bar white grow downwards
    Headline.LeftBarWhite.y = 780-205
    Anim.to(Headline.LeftBarWhite, 1, {y = 780}):ease("quartout")

    --Make Left Bar Purple grow downwards
    Headline.LeftBarPurple.y = 780-205
    Anim.to(Headline.LeftBarPurple, 1, {y = 780}):ease("quartout"):delay(0.2)

    --Move Text up
    Headline.TextYLo = 820+215
    Anim.to(Headline, 1, {TextYLo = 820}):ease("quartout"):delay(0.05)
end


function DrawHeadlineSingle()
    if Headline.comingUpOnly ~= true then 
        Headline.BBCBox.w = 118 + ReithSansBold:getWidth(Headline.BBCText.Text) + 10
        Headline.comingUpBox.x = Headline.BBCBox.x + Headline.BBCBox.w
        Headline.comingUpText.x = Headline.comingUpBox.x + 8
    else
        Headline.BBCBox.w = 0
        Headline.comingUpBox.x = Headline.BBCBox.x + Headline.BBCBox.w
        Headline.comingUpText.x = Headline.comingUpBox.x + 8
    end

        --Fader
        love.graphics.setColor(HeadlineFadeColor)
        love.graphics.draw(Fader,0,0,0,1.5,1.5)

    love.graphics.setScissor(0,845,love.graphics.getWidth(),ReithSerif:getHeight(Headline.TextLo)-30)
         --Headline Text (1 line, lower)
         love.graphics.setColor(1,1,1,1)
         love.graphics.setFont(ReithSerif)
         love.graphics.print(Headline.TextLo,Headline.TextXLo,Headline.TextYLo)
     love.graphics.setScissor()

    love.graphics.setScissor(270,780,900,44)
         
        if Headline.comingUpOnly ~= true then
        --BBC Box       
         love.graphics.setColor(Headline.BBCBox.col)
         love.graphics.rectangle("fill",Headline.BBCBox.x,Headline.BBCBox.y,Headline.BBCBox.w,Headline.BBCBox.h)

        --BBC Box Text
         love.graphics.setColor(1,1,1,1)
         love.graphics.setFont(ReithSansBold)
         love.graphics.print(Headline.BBCText.Text,Headline.BBCText.x,Headline.BBCText.y)
 
         --BBC Logo 
         love.graphics.setColor(1,1,1,1)
         love.graphics.draw(BBCSmall,Headline.BBCLogo.x,Headline.BBCLogo.y,0,0.04,0.04)
        end

        --Coming Up Box
        if Headline.comingUp then
            love.graphics.setColor(Headline.comingUpBox.col)
            love.graphics.rectangle("fill",Headline.comingUpBox.x,Headline.comingUpBox.y,Headline.comingUpBox.w,Headline.comingUpBox.h)
            love.graphics.setColor(Headline.comingUpText.col)
            love.graphics.setFont(ReithSansBold)
            love.graphics.print(Headline.comingUpText.text,Headline.comingUpText.x,Headline.comingUpText.y)
        end
     love.graphics.setScissor()



     love.graphics.setScissor(240,780,5,205)
         --Left Bar White
         love.graphics.setColor(1,1,1,1)
         love.graphics.rectangle("fill",Headline.LeftBarWhite.x,Headline.LeftBarWhite.y,Headline.LeftBarWhite.w,Headline.LeftBarWhite.h)

         --Left Bar Purple
         love.graphics.setColor(Headline.LeftBarPurple.col)
         love.graphics.rectangle("fill",Headline.LeftBarPurple.x,Headline.LeftBarPurple.y,Headline.LeftBarPurple.w,Headline.LeftBarPurple.h)
     love.graphics.setScissor()
               

end


function HideHeadline()
    if Single == true then
        HideHeadlineSingle()
    else
        HideHeadlineDouble()
    end
end


function HideHeadlineDouble()
    Anim.to(HeadlineFadeColor, 1.8, {1,1,1,0})
    HeadlineShowing = false
    --Move whole logo box up
    Anim.to(Headline.BBCBox, .5, {y = 650-50}):ease("quartout")
    Anim.to(Headline.BBCText, .5, {y = 650-50}):ease("quartout")
    Anim.to(Headline.BBCLogo, .5, {y = 650-50}):ease("quartout")
    Anim.to(Headline.comingUpBox, .5, {y = 650-50}):ease("quartout")
    Anim.to(Headline.comingUpText, .5, {y = 650-50}):ease("quartout")

    --Make Left Bar Purple and White shrink downwards
    LeftBarPurpleAnim = Anim.to(Headline.LeftBarPurple, 1, {y = 650+350}):ease("quartout")
    LeftBarWhiteAnim = Anim.to(Headline.LeftBarWhite, 1, {y = 650+350}):ease("quartout")

    --Move Lower Text up
    Anim.to(Headline, 0.8, {TextYLo = 820-215}):ease("quartout"):delay(0.15)

    --Move Upper Text up
    Anim.to(Headline, 0.8, {TextYHi = 680-215}):ease("quartout"):delay(0.10)

end

function ShowHeadlineDouble()

    --If logo is showing, hide it
    if HeadlineShowing == true then
        HideHeadlineDouble()
        Timer.after(1, function() ShowHeadlineDouble() end)
        return
    end

    Single = false
    Anim.to(HeadlineFadeColor, 1.5, {1,1,1,1})
    HeadlineShowing = true
    --Clear left bar anim
    if LeftBarPurpleAnim ~= nil then
        LeftBarPurpleAnim:stop()
        LeftBarWhiteAnim:stop()
    end

    --Set Double height for left bars
    Headline.LeftBarWhite.h = 350
    Headline.LeftBarPurple.h = 350

    --Move whole logo box up
    Headline.BBCBox.y = 650+50
    Headline.BBCText.y = 650+50
    Headline.BBCLogo.y = 657+50
    Headline.comingUpBox.y = 650+50
    Headline.comingUpText.y = 650+50
    Anim.to(Headline.BBCBox, 1, {y = 650}):ease("quartout"):delay(0.20)
    Anim.to(Headline.BBCText, 1, {y = 650}):ease("quartout"):delay(0.20)
    Anim.to(Headline.BBCLogo, 1, {y = 657}):ease("quartout"):delay(0.20)
    Anim.to(Headline.comingUpBox, 1, {y = 650}):ease("quartout"):delay(0.20)
    Anim.to(Headline.comingUpText, 1, {y = 650}):ease("quartout"):delay(0.20)

    --Make Left bar white grow downwards
    Headline.LeftBarWhite.y = 650-350
    --Anim.to(Headline.LeftBarWhite, 1, {y = 650}):ease("quartinout")
    Anim.to(Headline.LeftBarWhite, 1, {y = 650}):ease("quartout")

    --Make Left Bar Purple grow downwards
    Headline.LeftBarPurple.y = 650-350
    --Anim.to(Headline.LeftBarPurple, 1, {y = 650}):ease("quartinout"):delay(0.2)
    Anim.to(Headline.LeftBarPurple, 1, {y = 650}):ease("quartout"):delay(0.2)
    

    --Move Lower Text up
    Headline.TextYLo = 820+215
    Anim.to(Headline, 1, {TextYLo = 820}):ease("quartout"):delay(0.2)

    --Move Upper Text up
    Headline.TextYHi = 680+215
    Anim.to(Headline, 1, {TextYHi = 680}):ease("quartout"):delay(0.25)
end


function DrawHeadlineDouble() 
    if Headline.comingUpOnly ~= true then 
        Headline.BBCBox.w = 118 + ReithSansBold:getWidth(Headline.BBCText.Text) + 10
        Headline.comingUpBox.x = Headline.BBCBox.x + Headline.BBCBox.w
        Headline.comingUpText.x = Headline.comingUpBox.x + 8
    else
        Headline.BBCBox.w = 0
        Headline.comingUpBox.x = Headline.BBCBox.x + Headline.BBCBox.w
        Headline.comingUpText.x = Headline.comingUpBox.x + 8
    end


    --Fader
    love.graphics.setColor(HeadlineFadeColor)
    love.graphics.draw(Fader,0,0,0,1.5,1.5)

    love.graphics.setScissor(0,845,love.graphics.getWidth(),ReithSerif:getHeight(Headline.TextLo)-30)
         --Headline Text (1 line, lower)
         love.graphics.setColor(1,1,1,1)
         love.graphics.setFont(ReithSerif)
         love.graphics.print(Headline.TextLo,Headline.TextXLo,Headline.TextYLo)
    love.graphics.setScissor()

    love.graphics.setScissor(0,690,love.graphics.getWidth(),ReithSerif:getHeight(Headline.TextHi))
            --Headline Text (1 line, upper)
            love.graphics.setColor(1,1,1,1)
            love.graphics.setFont(ReithSerif)
            love.graphics.print(Headline.TextHi,Headline.TextXHi,Headline.TextYHi)
    love.graphics.setScissor()


    love.graphics.setScissor(270,650,900,44)
    if Headline.comingUpOnly ~= true then
        --BBC Box       
         love.graphics.setColor(Headline.BBCBox.col)
         love.graphics.rectangle("fill",Headline.BBCBox.x,Headline.BBCBox.y,Headline.BBCBox.w,Headline.BBCBox.h)

        --BBC Box Text
         love.graphics.setColor(1,1,1,1)
         love.graphics.setFont(ReithSansBold)
         love.graphics.print(Headline.BBCText.Text,Headline.BBCText.x,Headline.BBCText.y)
 
         --BBC Logo 
         love.graphics.setColor(1,1,1,1)
         love.graphics.draw(BBCSmall,Headline.BBCLogo.x,Headline.BBCLogo.y,0,0.04,0.04)
    end

        --Coming Up Box
        if Headline.comingUp == true then
            love.graphics.setColor(Headline.comingUpBox.col)
            love.graphics.rectangle("fill",Headline.comingUpBox.x,Headline.comingUpBox.y,Headline.comingUpBox.w,Headline.comingUpBox.h)
            love.graphics.setColor(Headline.comingUpText.col)
            love.graphics.setFont(ReithSansBold)
            love.graphics.print(Headline.comingUpText.text,Headline.comingUpText.x,Headline.comingUpText.y)
        end

     love.graphics.setScissor()



     love.graphics.setScissor(240,650,5,350)
         --Left Bar White
         love.graphics.setColor(1,1,1,1)
         love.graphics.rectangle("fill",Headline.LeftBarWhite.x,Headline.LeftBarWhite.y,Headline.LeftBarWhite.w,Headline.LeftBarWhite.h)

         --Left Bar Purple
         love.graphics.setColor(Headline.LeftBarPurple.col)
         love.graphics.rectangle("fill",Headline.LeftBarPurple.x,Headline.LeftBarPurple.y,Headline.LeftBarPurple.w,Headline.LeftBarPurple.h)
     love.graphics.setScissor()
               

end

function PlayoutShowHeadline(text, style)
    HeadlineShow(text, style)
end

function PlayoutNextHeadline(text, style)
    ShowTransition()
    HeadlineShow(text, style)
end

function HeadlineShow(text, style)
    if HeadlineShowing == true then
        HideHeadline()
        Timer.after(1, function() 
            PlayoutShowHeadline(text, style)
        end)
    elseif LowerThirdFull.LowerThirdShowing == true then
        HideLowerThirdFull()
        Timer.after(1, function() 
            PlayoutShowHeadline(text, style)
        end)
    elseif TitleLogo.Showing == true then
        HideTitleLogo()
        Timer.after(1, function() 
            PlayoutShowHeadline(text,style)
        end)
    else

        ConfigureHeadlineStyle("clear")

        --Split string into lines array
        local textLines = {}
        textLines = split(text, "|")
        
        --If there is only two lines, show single line headline
        -- if #textLines == 2 then
        --     Headline.TextLo = textLines[1]
        --     ConfigureHeadlineStyle(textLines[2])
        --     ShowHeadlineSingle()
        -- end
    
        --If there is only one line, show single line headline
        if #textLines == 1 then
            Headline.TextLo = textLines[1]
            if style ~= nil then 
                ConfigureHeadlineStyle(style)
            else
                ConfigureHeadlineStyle("clear")
            end
            ShowHeadlineSingle()
        end
    
        --If there is more than two lines, show double line headline
        if #textLines == 2 then                 
            Headline.TextHi = textLines[1]
            Headline.TextLo = textLines[2]
            if style ~= nil then
                ConfigureHeadlineStyle(style)
            else
                ConfigureHeadlineStyle("clear")
            end
            ShowHeadlineDouble()
        end
    end
end    

function ConfigureHeadlineStyle(text)
    if text == "clear" or text == "" or text == nil then
        Headline.comingUp = false
        Headline.comingUpOnly = false
        return
    end

    local configurationWords = {}
    for w in text:gmatch("%S+") do table.insert(configurationWords, w) end

    for i,v in pairs(configurationWords) do
        if v == "ComingUp" then Headline.comingUp = true end
        if v == "ComingUpOnly" then Headline.comingUpOnly = true end
    end
end

function HideHeadlineInstant()
    HeadlineShowing = false
    HeadlineFadeColor = {0,0,0,0}
    Headline.TextYLo = 820+215
    Headline.TextYHi = 680+215
    Headline.BBCBox.y = 650-350
    Headline.BBCText.y = 650-350
    Headline.BBCLogo.y = 657-350
    Headline.comingUpBox.y = 650-350
    Headline.comingUpText.y = 650-350
    Headline.LeftBarWhite.y = 650-350
    Headline.LeftBarPurple.y = 650-350
end
