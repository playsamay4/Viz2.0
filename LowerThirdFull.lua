local BBCTextReithSansBold = love.graphics.newFont("fonts/ReithSansBd.ttf",35)


LowerThirdFull = {
    WhitePart = {
        x = 0,
        y = 988,
        w = 1920,
        h = 98,
        col = {254/255, 251/255, 254/255, 0.85}
    },

    ClearPart = {
        x = 0,
        y = 940,
        w = 1920,
        h = 48,
        col = {0, 0, 0, 0.8}
    },

    ClearPartScissor = {
        x = 0,
        y = 940,
        w = 1920,
        h = 48,
    },

    PresenterNameScissor = {
        x = 270,
        y = 860,
        w = 1920,
        h = 48+32,
    },
    

    BBCBox = {
        x = 277,
        y = 940,
        w = 255,
        h = 48,
        col = ThemeColor
    },

    BBCText = {
        x = 413,
        y = 934,
        w = 255,
        h = 48,
        col = {1, 1, 1, 1},
        Text = "NEWS"
    },
    LowerThirdShowing = true,

    --Breaking box should span the width of the screen and should always be on top of clear part
    BreakingBox = {
        x = 0,
        y = 988,
        w = 1920,
        h = 0,
        col = {184/255, 0, 0, 1},
        Text1 = "BREAKING",
        Text1Showing = false,
        Text1Y = 0,
        Text2 = "U.S. Journalist arrested in Russia",
        Text2Showing = false,
        Text2Y = 0,
        Font1 = love.graphics.newFont("fonts/ReithSansBd.ttf",95),
        Font2 = love.graphics.newFont("fonts/ReithSerifMd.ttf",90),
    },

    SingleText = {
        x = 0,
        y = 988,
        w = 1920,
        h = 0,
        col = {184/255, 0, 0, 1},
        Text2 = "U.S. Journalist arrested in Russia",
        Showing = false,
        Text2Y = 0,
        Font2 = love.graphics.newFont("fonts/ReithSerifMd.ttf",90),
    },

    --Presenter Name text
    PresenterName = {
        x = 280,
        y = 940,
        w = 1920,
        h = 48,
        col = {1, 1, 1, 1},
        Text = "Jack Kennedy\nMother of three"
    },

    PresenterSubtitle = {
        x = 281,
        y = 1100,
        w = 1920,
        h = 48,
        col = {1, 1, 1, 1},
        Font = love.graphics.newFont("fonts/ReithSansMd.ttf", 40),
    },
    PresenterNameShowing = false,

    --Ticker
    TickerText = {
        x = 310,
        y = 986,
        col = {0.2,0.2,0.2,0},
        Text = "BBC.com/news"
    },

    TickerBlock = {
        x = 288,
        y = 1005,
        w = 10,
        h = 12,
        col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],0}
    },
    TickerScissor = false,


    LowerThirdTitle = {
        x = 290,
        y = 980,
        col = {1,1,1,1},
        Text = "",
        Text2 = "",
        Text1Y = 0,
        Text2Y = 100,
        TextShowing = 1,

    },
    LowerThirdTitleChanging = false,

    LowerThirdSubtitle1 = {
        x = 290,
        y = 1060,
        col = {1,1,1,1},
        Text = "Lower Third Subtitle 1"
    },

    LowerThirdSubtitle2 = {
        x = 290,
        y = 1110,
        col = {1,1,1,1},
        Text = "Lower Third Subtitle 2"
    },
    OnSubtitle = 1,

    LowerThirdTitleShowing = false,

    LowerThirdSubtitleFont = love.graphics.newFont("fonts/ReithSansMd.ttf",40),

    ProgramBadge = {
        scissorX = 0,
        scissorY = 940,
        scissorW = 1920,
        scissorH = 48,
        x = 1430,
        y = 940,
        w = 150,
        h = 48,
        bcol = {0,0,0,0},
        tcol = {1,1,1,1},
        alpha = 1,
        Text = "",
        Font = love.graphics.newFont("fonts/ReithSansMd.ttf",30),
        BoxYOffset = 0,
        TextYOffset = 0,
        ClearPartOffset = 0,
        ClearPartCol = {0,0,0,0.8},
    },
    ProgramBadgeShowing = false,
    ProgramBadgeShouldShow = false,

    --This one is next to the BBC News Box on the lower third
    LowerThirdBox = {
        x = 530,
        y = -49,
        w = 210,
        h = 48,
        bCol = {1,1,1,1},
        tCol = {60/255,60/255,60/255,1},
        Font = love.graphics.newFont("fonts/ReithSansMd.ttf",33),
        scissorX = 0,
        scissorY = 0,
        scissorW = 1920,
        scissorH = 48,
        Text = "COMING UP",
        Showing = false,
    }
}

local yAdjusted = 820

function DrawLowerThirdFull()
    LowerThirdFull.BBCBox.w = 137 + BBCTextReithSansBold:getWidth(LowerThirdFull.BBCText.Text) + 10

    love.graphics.setScissor(LowerThirdFull.ClearPartScissor.x,LowerThirdFull.ClearPartScissor.y,LowerThirdFull.ClearPartScissor.w,LowerThirdFull.ClearPartScissor.h)
        love.graphics.setColor(LowerThirdFull.ClearPart.col)
        love.graphics.rectangle("fill",LowerThirdFull.ClearPart.x,LowerThirdFull.ClearPart.y,LowerThirdFull.ClearPart.w,LowerThirdFull.ClearPart.h)

        --Presenter name
        
        love.graphics.setScissor(LowerThirdFull.PresenterNameScissor.x,LowerThirdFull.PresenterNameScissor.y,LowerThirdFull.PresenterNameScissor.w,LowerThirdFull.PresenterNameScissor.h)
            love.graphics.setColor(LowerThirdFull.PresenterName.col)
            love.graphics.setFont(PresenterName)
            --Put text into array by lines
            local PresenterNameText = {}
            for line in LowerThirdFull.PresenterName.Text:gmatch("[^\n]+") do
                table.insert(PresenterNameText, line)
            end
            love.graphics.printf(PresenterNameText[1],LowerThirdFull.PresenterName.x,LowerThirdFull.PresenterName.y,LowerThirdFull.PresenterName.w,"left")

            --Presenter subtitle
            love.graphics.setColor(LowerThirdFull.PresenterSubtitle.col)
            love.graphics.setFont(LowerThirdFull.PresenterSubtitle.Font)
            if PresenterNameText[2] ~= nil then love.graphics.printf(PresenterNameText[2],LowerThirdFull.PresenterSubtitle.x,LowerThirdFull.PresenterSubtitle.y,LowerThirdFull.PresenterSubtitle.w,"left") end
            
        
        --Set scissor for subtitles
        --TO DO
        --Subtitle 1
        love.graphics.setScissor(290,940,1920,48)
            love.graphics.setColor(LowerThirdFull.LowerThirdSubtitle1.col)
            love.graphics.setFont(LowerThirdFull.LowerThirdSubtitleFont)
            love.graphics.printf(LowerThirdFull.LowerThirdSubtitle1.Text,LowerThirdFull.LowerThirdSubtitle1.x,LowerThirdFull.LowerThirdSubtitle1.y,1920,"left")

            --Subtitle 2
            if LowerThirdFull.LowerThirdSubtitle2.Text ~= nil then 
                love.graphics.setColor(LowerThirdFull.LowerThirdSubtitle2.col)
                love.graphics.setFont(LowerThirdFull.LowerThirdSubtitleFont)
                love.graphics.printf(LowerThirdFull.LowerThirdSubtitle2.Text,LowerThirdFull.LowerThirdSubtitle2.x,LowerThirdFull.LowerThirdSubtitle2.y,1920,"left")
            end


        --Reset to big scissor
        love.graphics.setScissor(LowerThirdFull.ClearPartScissor.x,LowerThirdFull.ClearPartScissor.y,LowerThirdFull.ClearPartScissor.w,LowerThirdFull.ClearPartScissor.h)


        love.graphics.setColor(LowerThirdFull.BBCBox.col)
        love.graphics.rectangle("fill",LowerThirdFull.BBCBox.x,LowerThirdFull.BBCBox.y,LowerThirdFull.BBCBox.w,LowerThirdFull.BBCBox.h)

        --Breaking News stuff first
        love.graphics.setColor(LowerThirdFull.BreakingBox.col)
        love.graphics.rectangle("fill",LowerThirdFull.BreakingBox.x,LowerThirdFull.BreakingBox.y,LowerThirdFull.BreakingBox.w,LowerThirdFull.BreakingBox.h)
        love.graphics.setScissor(0,736+130,1920,122)
            love.graphics.setColor(1,1,1,1)
            love.graphics.setFont(LowerThirdFull.BreakingBox.Font1)
            love.graphics.print(LowerThirdFull.BreakingBox.Text1,LowerThirdFull.BreakingBox.x+286,LowerThirdFull.BreakingBox.y+39+LowerThirdFull.BreakingBox.Text1Y)
            love.graphics.setFont(LowerThirdFull.BreakingBox.Font2)
            love.graphics.print(LowerThirdFull.BreakingBox.Text2,LowerThirdFull.BreakingBox.x+286,LowerThirdFull.BreakingBox.y+39+LowerThirdFull.BreakingBox.Text2Y)

            --Draw our own copy of the subtitles
            love.graphics.setScissor(290,940,1920,48)
                love.graphics.setColor(LowerThirdFull.LowerThirdSubtitle1.col)
                love.graphics.setFont(LowerThirdFull.LowerThirdSubtitleFont)
                love.graphics.printf(LowerThirdFull.LowerThirdSubtitle1.Text,LowerThirdFull.LowerThirdSubtitle1.x,LowerThirdFull.LowerThirdSubtitle1.y,1920,"left")

                --Subtitle 2
                if LowerThirdFull.LowerThirdSubtitle2.Text ~= nil then 
                    love.graphics.setColor(LowerThirdFull.LowerThirdSubtitle2.col)
                    love.graphics.setFont(LowerThirdFull.LowerThirdSubtitleFont)
                    love.graphics.printf(LowerThirdFull.LowerThirdSubtitle2.Text,LowerThirdFull.LowerThirdSubtitle2.x,LowerThirdFull.LowerThirdSubtitle2.y,1920,"left")
                end
        love.graphics.setScissor(LowerThirdFull.ClearPartScissor.x,LowerThirdFull.ClearPartScissor.y,LowerThirdFull.ClearPartScissor.w,LowerThirdFull.ClearPartScissor.h)
        
        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(BBCSmall,LowerThirdFull.BBCBox.x+13,LowerThirdFull.BBCBox.y+7, 0 , 0.045, 0.045)

        love.graphics.setColor(LowerThirdFull.BBCText.col)
        love.graphics.setFont(BBCTextReithSansBold)
        love.graphics.print(LowerThirdFull.BBCText.Text, LowerThirdFull.BBCText.x, LowerThirdFull.BBCText.y+5)

        --Lower Third Title
        -- love.graphics.setColor(0.5,0,0,0.5)
        -- love.graphics.setScissor()
        if LowerThirdFull.LowerThirdTitleChanging == true then 
            love.graphics.setScissor(0,50+LowerThirdFull.ClearPart.y,1920,70)
        else
            love.graphics.setScissor(0,850,1920,140)
        end
            love.graphics.setColor(LowerThirdFull.LowerThirdTitle.col)
            love.graphics.setFont(PresenterName)
            love.graphics.printf(LowerThirdFull.LowerThirdTitle.Text,LowerThirdFull.LowerThirdTitle.x,LowerThirdFull.LowerThirdTitle.y+LowerThirdFull.LowerThirdTitle.Text1Y,1920,"left")
            love.graphics.printf(LowerThirdFull.LowerThirdTitle.Text2,LowerThirdFull.LowerThirdTitle.x,LowerThirdFull.LowerThirdTitle.y+LowerThirdFull.LowerThirdTitle.Text2Y,1920,"left")
            love.graphics.setFont(LowerThirdFull.SingleText.Font2)
            love.graphics.print(LowerThirdFull.SingleText.Text2,LowerThirdFull.SingleText.x+286,LowerThirdFull.SingleText.y+39+LowerThirdFull.SingleText.Text2Y)
        love.graphics.setScissor()

    --Lower Third Box
    love.graphics.setScissor(LowerThirdFull.LowerThirdBox.scissorX,LowerThirdFull.LowerThirdBox.scissorY+LowerThirdFull.BBCBox.y,LowerThirdFull.LowerThirdBox.scissorW,LowerThirdFull.LowerThirdBox.scissorH)
        love.graphics.setColor(LowerThirdFull.LowerThirdBox.bCol)
        love.graphics.rectangle("fill",LowerThirdFull.BBCBox.x+LowerThirdFull.BBCBox.w,LowerThirdFull.LowerThirdBox.y+LowerThirdFull.BBCBox.y,LowerThirdFull.LowerThirdBox.w,LowerThirdFull.LowerThirdBox.h)
        love.graphics.setFont(LowerThirdFull.LowerThirdBox.Font)
        love.graphics.setColor(LowerThirdFull.LowerThirdBox.tCol)
        love.graphics.printf(LowerThirdFull.LowerThirdBox.Text,LowerThirdFull.BBCBox.x+LowerThirdFull.BBCBox.w,LowerThirdFull.LowerThirdBox.y+1+LowerThirdFull.BBCBox.y,LowerThirdFull.LowerThirdBox.w,"center")
    love.graphics.setScissor()

        

    love.graphics.setColor(LowerThirdFull.WhitePart.col)
    love.graphics.rectangle("fill",LowerThirdFull.WhitePart.x,LowerThirdFull.WhitePart.y,LowerThirdFull.WhitePart.w,LowerThirdFull.WhitePart.h)

    --Ticker
    if LowerThirdFull.TickerScissor then
        love.graphics.setScissor(280,995,1260,40)
        
    end
        love.graphics.setColor(LowerThirdFull.TickerText.col)
        if LowerThirdFull.TickerText.Text == "HEADLINES" or LowerThirdFull.TickerText.Text == "INTERACTIVE" then love.graphics.setFont(TickerFontBold) else love.graphics.setFont(TickerFont) end
        if LowerThirdFull.TickerText.Text ~= nil then love.graphics.printf(LowerThirdFull.TickerText.Text, LowerThirdFull.TickerText.x, LowerThirdFull.TickerText.y+5, 1700-LowerThirdFull.TickerText.x, "left") end
        

        love.graphics.setColor(LowerThirdFull.TickerBlock.col)
        love.graphics.rectangle("fill",LowerThirdFull.TickerBlock.x,LowerThirdFull.TickerBlock.y,LowerThirdFull.TickerBlock.w,LowerThirdFull.TickerBlock.h) 

    if LowerThirdFull.TickerScissor then
        love.graphics.setScissor()
    end

    love.graphics.setScissor()
    
    --Program Badge and Info Badge
    love.graphics.setScissor(LowerThirdFull.ProgramBadge.scissorX,LowerThirdFull.ProgramBadge.scissorY,LowerThirdFull.ProgramBadge.scissorW,LowerThirdFull.ProgramBadge.scissorH)
        love.graphics.setColor(LowerThirdFull.ProgramBadge.ClearPartCol)
        love.graphics.rectangle("fill", LowerThirdFull.ProgramBadge.x, LowerThirdFull.ProgramBadge.y+LowerThirdFull.ProgramBadge.ClearPartOffset, LowerThirdFull.ProgramBadge.w, 48)
        love.graphics.setColor(LowerThirdFull.ProgramBadge.bcol)
        love.graphics.rectangle("fill",LowerThirdFull.ProgramBadge.x,LowerThirdFull.ProgramBadge.y+LowerThirdFull.ProgramBadge.BoxYOffset,LowerThirdFull.ProgramBadge.w,LowerThirdFull.ProgramBadge.h)
        love.graphics.setColor(LowerThirdFull.ProgramBadge.tcol)
        love.graphics.setFont(LowerThirdFull.ProgramBadge.Font)
        love.graphics.printf(LowerThirdFull.ProgramBadge.Text,LowerThirdFull.ProgramBadge.x,LowerThirdFull.ProgramBadge.y+3+LowerThirdFull.ProgramBadge.TextYOffset,LowerThirdFull.ProgramBadge.w,"center")
    love.graphics.setScissor()
end

function HideLowerThirdFull()
    if LowerThirdFull.LowerThirdShowing == false then return end
    local timeAfter = 0.5
    LowerThirdFullShowing = false
    StopTicker()

    if LowerThirdFull.BreakingBox.h > 0 then
        HideBreakingLowerThird()
        Timer.after(1, function() HideLowerThirdFull() end)
        return
    end

    if LowerThirdFull.ProgramBadgeShowing == true then
        HideProgramBadge()
        timeAfter = 0.7
        Timer.after(0.4, function() HideLowerThirdClock() end)
    else
        HideLowerThirdClock()
    end
    Timer.after(timeAfter, function()
        if LowerThirdFull.PresenterNameShowing == true then
            HidePresenterName()
            Timer.after(0.7, function() HideLowerThirdFull() end)
            return
        elseif LowerThirdFull.LowerThirdTitleShowing == true then
            HideLowerThirdText()
            Timer.after(0.7, function() HideLowerThirdFull() end)
            return
        end
        

        --Move the White part down
        Anim.to(LowerThirdFull.WhitePart, 0.8, {y = 1080}):ease("cubicinout")

        --Move the clear part down
        Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 1080}):ease("cubicinout")

        --Move the clearpart scissor down
        Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 1036}):ease("cubicinout")

        --Move the BBC box down
        Anim.to(LowerThirdFull.BBCBox, 0.8, {y = 1080}):ease("cubicinout")

        --Move the BBC text down
        Anim.to(LowerThirdFull.BBCText, 0.8, {y = 1071}):ease("cubicinout")
    
        LowerThirdFull.LowerThirdShowing = false

    end)
end

function ShowLowerThirdFull()
    if LowerThirdFull.LowerThirdShowing == true then return end

    if TitleLogo.Showing == true then
        HideTitleLogo()
        Timer.after(0.6, function() ShowLowerThirdFull() end)
        return
    end

    --If the headline is showing, hide it
    if HeadlineShowing == true then
        HideHeadline()
        Timer.after(1, function() ShowLowerThirdFull() end)
        return
    end

    LowerThirdFullShowing = true

    
    if LowerThirdFull.ProgramBadgeShouldShow == true then
        --make sure program badge is in the right place
        LowerThirdFull.ProgramBadge.y = 940+48
        LowerThirdFull.ProgramBadge.scissorY = 940
        Timer.after(0.9, function() ShowProgramBadge(LowerThirdFull.ProgramBadge.Text, LowerThirdFull.ProgramBadge.tcol, LowerThirdFull.ProgramBadge.bcol) end)
    end

    Timer.after(0.3, function () ShowLowerThirdClock() end)

    --Move the White part up
    Anim.to(LowerThirdFull.WhitePart, 0.8, {y = 988}):ease("cubicout")

    --Move the clear part up
    Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940}):ease("cubicout")

    --Move the clearpart scissor up
    Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940}):ease("cubicout")

    --Move the BBC box up
    Anim.to(LowerThirdFull.BBCBox, 0.8, {y = 940}):ease("cubicout")

    --Move the BBC text up
    Anim.to(LowerThirdFull.BBCText, 0.8, {y = 934}):ease("cubicout")

    Timer.after(0.5, function()
        TickerI = 0
        StartTicker()
    end)

    LowerThirdFull.LowerThirdShowing = true
end

function ShowTickerOnly()
    if LowerThirdFull.LowerThirdShowing == true then return end




    if TitleLogo.Showing == true then
        HideTitleLogo()
        Timer.after(1, function() ShowLowerThirdFull() end)
        return
    end

    LowerThirdFullShowing = true

    Timer.after(0.3, function () ShowLowerThirdClock() end)

    --Move the White part up
    Anim.to(LowerThirdFull.WhitePart, 0.8, {y = 988}):ease("cubicout")

    Timer.after(0.5, function()
        TickerI = 0
        StartTicker()
    end)

    LowerThirdFull.LowerThirdShowing = true
end


function HideTickerOnly()
    if LowerThirdFull.LowerThirdShowing == false then return end

    LowerThirdFullShowing = false
    StopTicker()
    HideLowerThirdClock()

    Timer.after(0.5, function()
        if LowerThirdFull.PresenterNameShowing == true then
            HidePresenterName()
            Timer.after(0.7, function() HideLowerThirdFull() end)
            return
        elseif LowerThirdFull.LowerThirdTitleShowing == true then
            HideLowerThirdText()
            Timer.after(0.7, function() HideLowerThirdFull() end)
            return
        end

        --Move the White part down
        Anim.to(LowerThirdFull.WhitePart, 0.8, {y = 1080}):ease("cubicinout")
    
        LowerThirdFull.LowerThirdShowing = false

    end)
end


function HideLowerThirdFullInstant()
    --Move the White part down
    LowerThirdFull.WhitePart.y = 1080

    --Move the clear part down
    LowerThirdFull.ClearPart.y = 1080

    --Move the clearpart scissor down
    LowerThirdFull.ClearPartScissor.y = 1036

    --Move the BBC box down
    LowerThirdFull.BBCBox.y = 1080

    --Move the BBC text down
    LowerThirdFull.BBCText.y = 1071

    LowerThirdFull.LowerThirdShowing = false
end


function ShowPresenterName()
    if LowerThirdFull.PresenterNameShowing == true then return end

    --If lowerthird is not showing, show presenter name only
    if LowerThirdFull.LowerThirdShowing == false then
        ShowPresenterNameSolo()
        return
    end

        --If badge is showing fade output its clear part
    if LowerThirdFull.ProgramBadgeShowing == true then
        Timer.tween(0.5,LowerThirdFull.ProgramBadge.ClearPartCol, {0,0,0,0.0})
    end

    --If breaking text is showing, hide it
    if LowerThirdFull.BreakingBox.h > 0 then
        HideBreakingLowerThird()
        Timer.after(0.9, function() ShowPresenterName() end)
        return
    end

    --If lower third text is showing, hide it
    if LowerThirdFull.LowerThirdTitleShowing == true then
        HideLowerThirdText()
        Timer.after(1.3, function() ShowPresenterName() end)
        return
    end



    --If text has one line then
    if LowerThirdFull.PresenterName.Text:find("\n") == nil then
        --Set scissor height and y
        LowerThirdFull.PresenterNameScissor.y = 860
        LowerThirdFull.PresenterNameScissor.h = 80

        LowerThirdFull.PresenterNameShowing = true

        LowerThirdFull.PresenterName.y = 940
    
        --Expand clear part up
        Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940-75, h = 125}):ease("cubicout") 
    
        --Expand clear part scissor up
        Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940-140, h = 190}):ease("cubicout")
    
        --Move presenter name up
        Anim.to(LowerThirdFull.PresenterName, 0.8, {y = 860}):ease("cubicout"):delay(0.1)
    else    
        --Set scissor height and y
        LowerThirdFull.PresenterNameScissor.y = 760
        LowerThirdFull.PresenterNameScissor.h = 180

        LowerThirdFull.PresenterNameShowing = true

        LowerThirdFull.PresenterName.y = 940

        --Expand clear part up
        Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940-120, h = 170}):ease("cubicout") 

        --Expand clear part scissor up
        Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940-180, h = 230}):ease("cubicout")

        --Move presenter name up
        Anim.to(LowerThirdFull.PresenterName, 0.8, {y = 813}):ease("cubicout"):delay(0.1)

        --Move subtitle up
        Anim.to(LowerThirdFull.PresenterSubtitle, 1, {y = 880}):ease("cubicout")

    end
end

function ShowPresenterNameSolo()
    if LowerThirdFull.PresenterNameShowing == true then return end

    --if LowerThirdFull.ProgramBadgeShowing == true then
        --Timer.tween(0.8, LowerThirdFull.ProgramBadge.ClearPartCol, {0,0,0,0})
    --end

    --Show lowerthird BBC News box
    --Move the BBC box up
    Anim.to(LowerThirdFull.BBCBox, 0.8, {y = 940}):ease("cubicout")

    --Move the BBC text up
    Anim.to(LowerThirdFull.BBCText, 0.8, {y = 934}):ease("cubicout")


    --If text has one line then
    if LowerThirdFull.PresenterName.Text:find("\n") == nil then
            --Set clearpart scissor height and y
            LowerThirdFull.ClearPartScissor.y = 790
            LowerThirdFull.ClearPartScissor.h = 198

        --Set scissor height and y
        LowerThirdFull.PresenterNameScissor.y = 860
        LowerThirdFull.PresenterNameScissor.h = 80

        LowerThirdFull.PresenterNameShowing = true

        LowerThirdFull.PresenterName.y = 940
    
        --Expand clear part up
        Anim.to(LowerThirdFull.ClearPart, 1.1, {y = 940-75, h = 123}):ease("cubicout") 
   
        --Move presenter name up
        Anim.to(LowerThirdFull.PresenterName, 0.9, {y = 860}):ease("cubicout"):delay(0.45)
    else    

            --Set clearpart scissor height and y
    LowerThirdFull.ClearPartScissor.y = 790
    LowerThirdFull.ClearPartScissor.h = 200


        --Set scissor height and y
        --LowerThirdFull.PresenterNameScissor.y = 760
        --LowerThirdFull.PresenterNameScissor.h = 180

        Anim.to(LowerThirdFull.PresenterNameScissor, 0.8, {y = 820, h = 120}):ease("cubicout"):delay(0.23)


        LowerThirdFull.PresenterNameShowing = true

        LowerThirdFull.PresenterName.y = 1080

        --Expand clear part up
        Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940-120, h = 168}):ease("cubicout") 

        

        --Move presenter name up
        Anim.to(LowerThirdFull.PresenterName, 0.8, {y = 813}):ease("cubicout"):delay(0.23)

        --Move subtitle up
        Anim.to(LowerThirdFull.PresenterSubtitle, 1, {y = 880}):ease("cubicout"):delay(0.23)

    end
end

function HidePresenterName()
    if LowerThirdFull.PresenterNameShowing == false then
        return
    end

    --If lowerthird is not showing, hide presenter name only
    if LowerThirdFull.LowerThirdShowing == false then
        HidePresenterNameSolo()
        return
    end


    
    LowerThirdFull.PresenterNameShowing = false
    --Shrink clear part down
    Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940, h = 50}):ease("cubicinout")

    --Shrink clear part scissor down
    Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940, h = 50}):ease("cubicinout")

    --Move presenter name down
    Anim.to(LowerThirdFull.PresenterName, 0.8, {y = 932}):ease("cubicinout")

    --Move subtitle down
    Anim.to(LowerThirdFull.PresenterSubtitle, 1, {y = 1100}):ease("cubicinout")
end

function HidePresenterNameSolo()

    if LowerThirdFull.PresenterNameShowing == false then
        return
    end


    --If badge is showing fade in its clear part
    if LowerThirdFull.ProgramBadgeShowing == true then
        Timer.tween(0.5,LowerThirdFull.ProgramBadge.ClearPartCol, {0,0,0,0.8})
    end


    Anim.to(LowerThirdFull.PresenterNameScissor, 0.6, {y = 1000-48, h = 50}):ease("cubicinout")

    LowerThirdFull.PresenterNameShowing = false
    --Shrink clear part down
    Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 1080, h = 50}):ease("cubicinout"):delay(0.03)

    --Shrink clear part scissor down
    --Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940, h = 50}):ease("cubicinout")

    --Move presenter name down
    Anim.to(LowerThirdFull.PresenterName, 0.8, {y = 1059}):ease("cubicinout")

    --Move subtitle down
    Anim.to(LowerThirdFull.PresenterSubtitle, 0.7, {y = 1100}):ease("cubicinout")

    --Move the BBC box down
    Anim.to(LowerThirdFull.BBCBox, 0.8, {y = 1080}):ease("cubicinout")

    --Move the BBC text down
    Anim.to(LowerThirdFull.BBCText, 0.8, {y = 1071}):ease("cubicinout")

    Timer.after(0.8, function() 
        LowerThirdFull.ClearPartScissor = {
            x = 0,
            y = 1036,
            w = 1920,
            h = 48,
        }
     end)
end

function ShowLowerThirdText(Title, Subtitles, boxText, boxTcolor, boxBcolor)

    if Subtitles[1] == nil or Subtitles[1] == "" or Subtitles[1] == "NOP" then LowerThirdFull.SingleText.Showing = true ShowLowerThirdTextSingle(Title, boxText, boxTcolor, boxBcolor) return end

    if LowerThirdFull.LowerThirdShowing == false then
        ShowLowerThirdTextSolo(Title, Subtitles, boxText, boxTcolor, boxBcolor)
        return
    elseif LowerThirdFull.PresenterNameShowing == true then
        HidePresenterName()
        Timer.after(0.8, function() ShowLowerThirdText(Title, Subtitles, boxText, boxTcolor, boxBcolor) end)
        return
    end

    if boxText ~= nil then
        if LowerThirdFull.LowerThirdBox.Showing == false then
            Timer.after(0.8,function() ShowLowerThirdBox(boxText, boxTcolor, boxBcolor) end)
        end
    end

    LowerThirdFull.LowerThirdTitleShowing = true

    LowerThirdFull.LowerThirdTitle.Text = Title

    LowerThirdFull.LowerThirdSubtitle1.Text = Subtitles[1]
    LowerThirdFull.LowerThirdSubtitle2.Text = Subtitles[2]

    LowerThirdFull.LowerThirdTitle.y = 980

    if Subtitles[2] ~= nil and Subtitles[2] ~= "" then LoopBetweenSubtitles() end


    --Move clear part up and heighen it
    Anim.to(LowerThirdFull.ClearPart, 1, {y = 940-120, h = 170}):ease("cubicinout")
    --And its scissor
    Anim.to(LowerThirdFull.ClearPartScissor, 1, {y = 940-185, h = 235}):ease("cubicinout")

    --Move BBC box up
    Anim.to(LowerThirdFull.BBCBox, 1, {y = 940-120}):ease("cubicinout")

    --Move BBC text up
    Anim.to(LowerThirdFull.BBCText, 1, {y = 934-120}):ease("cubicinout")


    --Move the title up
    Anim.to(LowerThirdFull.LowerThirdTitle, 1, {y = 940-80}):ease("cubicinout"):delay(0.02)

    --Move the subtitle 1 up
    Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 980-50}):ease("cubicinout"):delay(0.04)

    --Move the subtitle 2 up
    Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 980}):ease("cubicinout"):delay(0.06)

    if LowerThirdFull.ProgramBadgeShowing == true then
        --Move the program badge up
        Anim.to(LowerThirdFull.ProgramBadge, 1, {y = 940-120}):ease("cubicinout")
 
        --Move program badge scissors up
        Anim.to(LowerThirdFull.ProgramBadge, 1, {scissorY = 940-120}):ease("cubicinout")
    end

end

function ShowLowerThirdTextSolo(Title, Subtitles, boxText, boxTcolor, boxBcolor)

    if Subtitles[1] == nil or Subtitles[1] == "" then LowerThirdFull.SingleText.Showing = true ShowLowerThirdTextSingle(Title, boxText, boxTcolor, boxBcolor) return end

    --if LowerThirdFull.LowerThirdShowing == false then
        --ShowLowerThirdFull()
        --Timer.after(0.7, function() ShowLowerThirdText(Title, Subtitles, boxText, boxTcolor, boxBcolor) end)
    --    return
    if LowerThirdFull.PresenterNameShowing == true then
        HidePresenterName()
        Timer.after(0.8, function() ShowLowerThirdText(Title, Subtitles, boxText, boxTcolor, boxBcolor) end)
        return
    end

    if boxText ~= nil then
        if LowerThirdFull.LowerThirdBox.Showing == false then
            Timer.after(0.8,function() ShowLowerThirdBox(boxText, boxTcolor, boxBcolor) end)
        end
    end


    LowerThirdFull.ClearPartScissor.y = 790
    LowerThirdFull.ClearPartScissor.h = 200

     --Move BBC box down
     LowerThirdFull.BBCBox.y = 990
     --Move BBC text down
     LowerThirdFull.BBCText.y = 984

    --Move clear part down and shrink it
    LowerThirdFull.ClearPart.y, LowerThirdFull.ClearPart.h = 990, 50
    
    LowerThirdFull.LowerThirdTitle.y = 1010

    
    LowerThirdFull.LowerThirdTitleShowing = true

    LowerThirdFull.LowerThirdTitle.Text = Title

    LowerThirdFull.LowerThirdSubtitle1.Text = Subtitles[1]
    LowerThirdFull.LowerThirdSubtitle2.Text = Subtitles[2]

    if Subtitles[2] ~= nil and Subtitles[2] ~= "" then LoopBetweenSubtitles() end


    --Move clear part up and heighen it
    Anim.to(LowerThirdFull.ClearPart, 1, {y = 940-120, h = 170}):ease("cubicinout")
    --And its scissor
    --Anim.to(LowerThirdFull.ClearPartScissor, 1, {y = 940-185, h = 235}):ease("cubicinout")

    --Move BBC box up
    Anim.to(LowerThirdFull.BBCBox, 1, {y = 940-120}):ease("cubicinout")

    --Move BBC text up
    Anim.to(LowerThirdFull.BBCText, 1, {y = 934-120}):ease("cubicinout")


    --Move the title up
    Anim.to(LowerThirdFull.LowerThirdTitle, 1, {y = 940-80}):ease("cubicinout"):delay(0.02)

    --Move the subtitle 1 up
    Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 980-50}):ease("cubicinout"):delay(0.04)

    --Move the subtitle 2 up
    Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 980}):ease("cubicinout"):delay(0.06)

    if LowerThirdFull.ProgramBadgeShowing == true then
        --Move the program badge up
        Anim.to(LowerThirdFull.ProgramBadge, 1, {y = 940-120}):ease("cubicinout")
 
        --Move program badge scissors up
        Anim.to(LowerThirdFull.ProgramBadge, 1, {scissorY = 940-120}):ease("cubicinout")
    end

end


function HideLowerThirdTextSolo()

    
    if LowerThirdFull.SingleText.Showing == true then
        LowerThirdFull.SingleText.Showing = false
        HideLowerThirdTextSingle()
        return
    end


    LowerThirdFull.LowerThirdTitleShowing = false

    if OnSub1Timer ~= nil then Timer.cancel(OnSub1Timer) end
    if OnSub2Timer ~= nil then Timer.cancel(OnSub2Timer) end
    if OnSub1EndTimer ~= nil then Timer.cancel(OnSub1EndTimer) end
    if OnSub2TimerEnd ~= nil then Timer.cancel(OnSub2TimerEnd) end

    LowerThirdFull.OnSubtitle = 1


    if LowerThirdFull.LowerThirdBoxShowing == true then
        HideLowerThirdBox()
        Timer.after(0.5, function() HideLowerThirdText() end)
        return
    end

    --Move clear part down and shrink it
    Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 990, h = 50}):ease("cubicinout")
    --And its scissor
    Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940, h = 50}):ease("cubicinout")

    --Move BBC box down
    Anim.to(LowerThirdFull.BBCBox, 0.8, {y = 990}):ease("cubicinout")

    --Move BBC text down
    Anim.to(LowerThirdFull.BBCText, 0.8, {y = 984}):ease("cubicinout")

    --Move the title down
    Anim.to(LowerThirdFull.LowerThirdTitle, 0.8, {y = 1010}):ease("cubicinout")

    --Move the subtitle 1 down
    Anim.to(LowerThirdFull.LowerThirdSubtitle1, 0.8, {y = 1060}):ease("cubicinout")

    --Move the subtitle 2 down
    Anim.to(LowerThirdFull.LowerThirdSubtitle2, 0.8, {y = 1110}):ease("cubicinout")

    Timer.after(0.8, function() 
        LowerThirdFull.LowerThirdTitle.Text = ""

        LowerThirdFull.ClearPartScissor = {
            x = 0,
            y = 1036,
            w = 1920,
            h = 48,
        }

        --Move the White part down
    LowerThirdFull.WhitePart.y = 1080

    --Move the clear part down
    LowerThirdFull.ClearPart.y = 1080

    --Move the clearpart scissor down
    LowerThirdFull.ClearPartScissor.y = 1036

    --Move the BBC box down
    LowerThirdFull.BBCBox.y = 1080

    --Move the BBC text down
    LowerThirdFull.BBCText.y = 1071

    end)

    if LowerThirdFull.ProgramBadgeShowing == true then
        --Move the program badge down
        Anim.to(LowerThirdFull.ProgramBadge, 0.8, {y = 940}):ease("cubicinout")

        --Move program badge scissors down
        Anim.to(LowerThirdFull.ProgramBadge, 0.8, {scissorY = 940}):ease("cubicinout")
    end
    
end


function ShowLowerThirdTextSingle(Title, boxText, boxTcolor, boxBcolor)

    if LowerThirdFull.LowerThirdShowing == false then
        ShowLowerThirdFull()
        Timer.after(0.7, function() ShowLowerThirdTextSingle(Title, boxText, boxTcolor, boxBcolor) end)
        return
    elseif LowerThirdFull.PresenterNameShowing == true then
        HidePresenterName()
        Timer.after(0.8, function() ShowLowerThirdText(Title, boxText, boxTcolor, boxBcolor) end)
        return
    end

    if boxText ~= nil then
        if LowerThirdFull.LowerThirdBox.Showing == false then
            Timer.after(0.8,function() ShowLowerThirdBox(boxText, boxTcolor, boxBcolor) end)
        end
    end

    LowerThirdFull.LowerThirdTitleShowing = true

    LowerThirdFull.SingleText.Text2 = Title
    LowerThirdFull.SingleText.Text2Y = 0
    --Adjust font size dynamically 
    local fontSize = 90
    yAdjusted = 820
    local textWidth = 0
    local fontSizeMet = false

    while not fontSizeMet do


        LowerThirdFull.SingleText.Font2 = nil
        collectgarbage()
        LowerThirdFull.SingleText.Font2 = love.graphics.newFont("fonts/ReithSerifMd.ttf", fontSize)


        if LowerThirdFull.SingleText.Font2:getWidth(Title) > 1400 then
            fontSize = fontSize - 1
            --Adjust the Y value 
            yAdjusted = yAdjusted + 0.7
        else 
            fontSizeMet = true
            -- print("Font size "..fontSize )
        end

    end

    


    --Move clear part up and heighen it
    Anim.to(LowerThirdFull.ClearPart, 1, {y = 940-120, h = 170}):ease("cubicinout")
    --And its scissor
    Anim.to(LowerThirdFull.ClearPartScissor, 1, {y = 940-185, h = 235}):ease("cubicinout")

    --Move BBC box up
    Anim.to(LowerThirdFull.BBCBox, 1, {y = 940-120}):ease("cubicinout")

    --Move BBC text up
    Anim.to(LowerThirdFull.BBCText, 1, {y = 934-120}):ease("cubicinout")


    --Move the title up
    Anim.to(LowerThirdFull.SingleText, 1, {y = yAdjusted}):ease("cubicinout"):delay(0.02)

    if LowerThirdFull.ProgramBadgeShowing == true then
        --Move the program badge up
        Anim.to(LowerThirdFull.ProgramBadge, 1, {y = 940-120}):ease("cubicinout")
 
        --Move program badge scissors up
        Anim.to(LowerThirdFull.ProgramBadge, 1, {scissorY = 940-120}):ease("cubicinout")
    end

end


function HideLowerThirdTextSingle()

    LowerThirdFull.LowerThirdTitleShowing = false

    if OnSub1Timer ~= nil then Timer.cancel(OnSub1Timer) end
    if OnSub2Timer ~= nil then Timer.cancel(OnSub2Timer) end
    if OnSub1EndTimer ~= nil then Timer.cancel(OnSub1EndTimer) end
    if OnSub2TimerEnd ~= nil then Timer.cancel(OnSub2TimerEnd) end

    LowerThirdFull.OnSubtitle = 1


    if LowerThirdFull.LowerThirdBoxShowing == true then
        HideLowerThirdBox()
        Timer.after(0.5, function() HideLowerThirdTextSingle() end)
        return
    end

    --Move clear part down and shrink it
    Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940, h = 50}):ease("cubicinout")
    --And its scissor
    Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940, h = 50}):ease("cubicinout")

    --Move BBC box down
    Anim.to(LowerThirdFull.BBCBox, 0.8, {y = 940}):ease("cubicinout")

    --Move BBC text down
    Anim.to(LowerThirdFull.BBCText, 0.8, {y = 934}):ease("cubicinout")

    --Move the title down
    Anim.to(LowerThirdFull.SingleText, 0.8, {y = yAdjusted + 120}):ease("cubicinout")

    Timer.after(0.8, function() 
        LowerThirdFull.SingleText.Text2 = ""
    end)

    if LowerThirdFull.ProgramBadgeShowing == true then
        --Move the program badge down
        Anim.to(LowerThirdFull.ProgramBadge, 0.8, {y = 940}):ease("cubicinout")

        --Move program badge scissors down
        Anim.to(LowerThirdFull.ProgramBadge, 0.8, {scissorY = 940}):ease("cubicinout")
    end
    
end

function UpdateLowerThirdText(text, subtitles)
    if OnSub1Timer ~= nil then Timer.cancel(OnSub1Timer) end
    if OnSub2Timer ~= nil then Timer.cancel(OnSub2Timer) end
    if OnSub1EndTimer ~= nil then Timer.cancel(OnSub1EndTimer) end
    if OnSub2TimerEnd ~= nil then Timer.cancel(OnSub2TimerEnd) end

    if subtitles[2] == nil or subtitles[2] == "NOP" then
        if LowerThirdFull.OnSubtitle == 1 then
            LowerThirdFull.LowerThirdSubtitle2.y = 980+20
            LowerThirdFull.OnSubtitle = 2
            LowerThirdFull.LowerThirdSubtitle2.Text = subtitles[1]
            Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 930-55}):ease("cubicinout")
            Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 960-30}):ease("cubicinout"):oncomplete(function() LowerThirdFull.LowerThirdSubtitle1.Text = "" end)
        elseif LowerThirdFull.OnSubtitle == 2 then
            LowerThirdFull.LowerThirdSubtitle1.y = 980+20
            LowerThirdFull.OnSubtitle = 1
            LowerThirdFull.LowerThirdSubtitle1.Text = subtitles[1]
            Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 980-50}):ease("cubicinout")
            Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 980-105}):ease("cubicinout"):oncomplete(function() LowerThirdFull.LowerThirdSubtitle2.Text = "" end)
        end
    else
        if LowerThirdFull.OnSubtitle == 1 then
            --If we're currently showing Subtitle 1, then update subtitle 2 and move it up
            LowerThirdFull.OnSubtitle = 2
            LowerThirdFull.LowerThirdSubtitle2.Text = subtitles[1]
            Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 930-55}):ease("cubicinout")
            Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 960-30}):ease("cubicinout")

            LowerThirdFull.OnSubtitle = 2
            OnSub1EndTimer = Timer.after(1, function() 
                --Move subtitle 1 to the bottom
                LowerThirdFull.LowerThirdSubtitle1.Text = subtitles[2]
                LowerThirdFull.LowerThirdSubtitle1.y = 980+20
                LoopBetweenSubtitles() 
            end)

            -- LoopBetweenSubtitles()
        elseif LowerThirdFull.OnSubtitle == 2 then
            LowerThirdFull.OnSubtitle = 1
            LowerThirdFull.LowerThirdSubtitle1.Text = subtitles[1]
            Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 980-50}):ease("cubicinout")
            Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 980-105}):ease("cubicinout")

            LowerThirdFull.OnSubtitle = 1
            OnSub2TimerEnd = Timer.after(1, function() 
                --Move subtitle 2 to the bottom
                LowerThirdFull.LowerThirdSubtitle2.Text = subtitles[2]
                LowerThirdFull.LowerThirdSubtitle2.y = 980+20
                LoopBetweenSubtitles() 
            end)

        end
    end

    
        --Update the text
        LowerThirdFull.LowerThirdTitle.Text2Y = 60
        LowerThirdFull.LowerThirdTitle.Text2 = text
        LowerThirdFull.LowerThirdTitleChanging = true
        Anim.to(LowerThirdFull.LowerThirdTitle, 0.6, {Text1Y = -80})
        Anim.to(LowerThirdFull.LowerThirdTitle, 0.8, {Text2Y = 0})
        Timer.after(0.8, function() 
            LowerThirdFull.LowerThirdTitleChanging = false 
            LowerThirdFull.LowerThirdTitle.Text = text
            LowerThirdFull.LowerThirdTitle.Text2 = "" 
            LowerThirdFull.LowerThirdTitle.Text1Y = 0
            LowerThirdFull.LowerThirdTitle.Text2Y = -90

        end)

end


function LoopBetweenSubtitles()

    if LowerThirdFull.OnSubtitle == 1 then 
        OnSub1Timer = Timer.after(7, function()
            --Move subtitle 1 up
            Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 930-55}):ease("cubicinout")

            --Move subtitle 2 up
            Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 960-30}):ease("cubicinout")

            LowerThirdFull.OnSubtitle = 2
            OnSub1EndTimer = Timer.after(1, function() 
                --Move subtitle 1 to the bottom
                LowerThirdFull.LowerThirdSubtitle1.y = 980+20
                LoopBetweenSubtitles() 
            end)
        end)
    end

    if LowerThirdFull.OnSubtitle == 2 then 
        OnSub2Timer = Timer.after(7, function()
            --Move subtitle 1 down
            Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 980-50}):ease("cubicinout")

            --Move subtitle 2 up
            Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 980-105}):ease("cubicinout")

            LowerThirdFull.OnSubtitle = 1
            OnSub2TimerEnd = Timer.after(1, function() 
                --Move subtitle 2 to the bottom
                LowerThirdFull.LowerThirdSubtitle2.y = 980+20
                LoopBetweenSubtitles() 
            end)
        end)
    end
end

function HideLowerThirdTextSolo()

    
    if LowerThirdFull.SingleText.Showing == true then
        LowerThirdFull.SingleText.Showing = false
        HideLowerThirdTextSingle()
        return
    end


    LowerThirdFull.LowerThirdTitleShowing = false

    if OnSub1Timer ~= nil then Timer.cancel(OnSub1Timer) end
    if OnSub2Timer ~= nil then Timer.cancel(OnSub2Timer) end
    if OnSub1EndTimer ~= nil then Timer.cancel(OnSub1EndTimer) end
    if OnSub2TimerEnd ~= nil then Timer.cancel(OnSub2TimerEnd) end

    LowerThirdFull.OnSubtitle = 1


    if LowerThirdFull.LowerThirdBoxShowing == true then
        HideLowerThirdBox()
        Timer.after(0.5, function() HideLowerThirdText() end)
        return
    end

    --Move clear part down and shrink it
    Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 990, h = 50}):ease("cubicinout")
    --And its scissor
    Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940, h = 50}):ease("cubicinout")

    --Move BBC box down
    Anim.to(LowerThirdFull.BBCBox, 0.8, {y = 990}):ease("cubicinout")

    --Move BBC text down
    Anim.to(LowerThirdFull.BBCText, 0.8, {y = 984}):ease("cubicinout")

    --Move the title down
    Anim.to(LowerThirdFull.LowerThirdTitle, 0.8, {y = 1010}):ease("cubicinout")

    --Move the subtitle 1 down
    Anim.to(LowerThirdFull.LowerThirdSubtitle1, 0.8, {y = 1060}):ease("cubicinout")

    --Move the subtitle 2 down
    Anim.to(LowerThirdFull.LowerThirdSubtitle2, 0.8, {y = 1110}):ease("cubicinout")

    Timer.after(0.8, function() 
        LowerThirdFull.LowerThirdTitle.Text = ""

        LowerThirdFull.ClearPartScissor = {
            x = 0,
            y = 1036,
            w = 1920,
            h = 48,
        }

        --Move the White part down
    LowerThirdFull.WhitePart.y = 1080

    --Move the clear part down
    LowerThirdFull.ClearPart.y = 1080

    --Move the clearpart scissor down
    LowerThirdFull.ClearPartScissor.y = 1036

    --Move the BBC box down
    LowerThirdFull.BBCBox.y = 1080

    --Move the BBC text down
    LowerThirdFull.BBCText.y = 1071

    end)

    if LowerThirdFull.ProgramBadgeShowing == true then
        --Move the program badge down
        Anim.to(LowerThirdFull.ProgramBadge, 0.8, {y = 940}):ease("cubicinout")

        --Move program badge scissors down
        Anim.to(LowerThirdFull.ProgramBadge, 0.8, {scissorY = 940}):ease("cubicinout")
    end
    
end


function HideLowerThirdText()

    
    if LowerThirdFull.LowerThirdShowing == false then
        HideLowerThirdTextSolo()
        return
    end
    
    if LowerThirdFull.SingleText.Showing == true then
        LowerThirdFull.SingleText.Showing = false
        HideLowerThirdTextSingle()
        return
    end



    LowerThirdFull.LowerThirdTitleShowing = false

    if OnSub1Timer ~= nil then Timer.cancel(OnSub1Timer) end
    if OnSub2Timer ~= nil then Timer.cancel(OnSub2Timer) end
    if OnSub1EndTimer ~= nil then Timer.cancel(OnSub1EndTimer) end
    if OnSub2TimerEnd ~= nil then Timer.cancel(OnSub2TimerEnd) end

    LowerThirdFull.OnSubtitle = 1


    if LowerThirdFull.LowerThirdBoxShowing == true then
        HideLowerThirdBox()
        Timer.after(0.5, function() HideLowerThirdText() end)
        return
    end

    --Move clear part down and shrink it
    Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940, h = 50}):ease("cubicinout")
    --And its scissor
    Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940, h = 50}):ease("cubicinout")

    --Move BBC box down
    Anim.to(LowerThirdFull.BBCBox, 0.8, {y = 940}):ease("cubicinout")

    --Move BBC text down
    Anim.to(LowerThirdFull.BBCText, 0.8, {y = 934}):ease("cubicinout")

    --Move the title down
    Anim.to(LowerThirdFull.LowerThirdTitle, 0.8, {y = 980}):ease("cubicinout")

    --Move the subtitle 1 down
    Anim.to(LowerThirdFull.LowerThirdSubtitle1, 0.8, {y = 1060}):ease("cubicinout")

    --Move the subtitle 2 down
    Anim.to(LowerThirdFull.LowerThirdSubtitle2, 0.8, {y = 1110}):ease("cubicinout")

    Timer.after(0.8, function() 
        LowerThirdFull.LowerThirdTitle.Text = ""
    end)

    if LowerThirdFull.ProgramBadgeShowing == true then
        --Move the program badge down
        Anim.to(LowerThirdFull.ProgramBadge, 0.8, {y = 940}):ease("cubicinout")

        --Move program badge scissors down
        Anim.to(LowerThirdFull.ProgramBadge, 0.8, {scissorY = 940}):ease("cubicinout")
    end
    
end

function ShowBreakingTitle(text)
    --Hide program badge if showing
    if LowerThirdFull.ProgramBadgeShowing == true then
        HideProgramBadge()
    end

    --Hide lower third text if showing
    if LowerThirdFull.LowerThirdTitleShowing == true then
        HideLowerThirdText()
        Timer.after(0.2, function() ShowBreakingTitle(text) end)
        return
    end

    --Hide presenter name if showing
    if LowerThirdFull.PresenterNameShowing == true then
        HidePresenterName()
        Timer.after(0.2, function() ShowBreakingTitle(text) end)
        return
    end

    --Adjust font size dynamically 
    local fontSize = 90
    yAdjusted = 0
    local textWidth = 0
    local fontSizeMet = false

    while not fontSizeMet do


        LowerThirdFull.BreakingBox.Font2 = nil
        collectgarbage()
        LowerThirdFull.BreakingBox.Font2 = love.graphics.newFont("fonts/ReithSerifMd.ttf", fontSize)


        if LowerThirdFull.BreakingBox.Font2:getWidth(text) > 1400 then
            fontSize = fontSize - 1
            --Adjust the Y value 
            yAdjusted = yAdjusted + 0.7
        else 
            fontSizeMet = true
            -- print("Font size "..fontSize )
        end

    end

    Timer.after(0.8, function ()

        --Expand the breaking part up

        
        LowerThirdFull.BreakingBox.Text1Y = 0
        LowerThirdFull.LowerThirdTitle.Text = ""
        LowerThirdFull.BreakingBox.Text1 = "BREAKING"
        LowerThirdFull.BreakingBox.Text1Showing = true
        LowerThirdFull.BreakingBox.Text2 = text
        LowerThirdFull.BreakingBox.Text2Y = 110+yAdjusted

        --Move clear part up and heighen it
        Anim.to(LowerThirdFull.ClearPart, 1, {y = 940-120, h = 170}):ease("cubicout")
        Anim.to(LowerThirdFull.BreakingBox, 1, {y = 940-120, h = 170}):ease("cubicout")
        --And its scissor
        Anim.to(LowerThirdFull.ClearPartScissor, 1, {y = 940-185, h = 235}):ease("cubicout")

        --Move BBC box up
        Anim.to(LowerThirdFull.BBCBox,1, {y = 940-120}):ease("cubicout")

        --Move BBC text up
        Anim.to(LowerThirdFull.BBCText,1, {y = 934-120}):ease("cubicout")

        if LowerThirdFull.ProgramBadgeShowing == true then
            --Move the program badge up
            Anim.to(LowerThirdFull.ProgramBadge, 1, {y = 940-120}):ease("cubicout")

            --Move program badge scissors up
            Anim.to(LowerThirdFull.ProgramBadge, 1, {scissorY = 940-120}):ease("cubicout")
        end
    end)
end

function AdvanceBreakingTitle()
    --Change offsetts
    if LowerThirdFull.BreakingBox.Text1Showing == true then
        LowerThirdFull.BreakingBox.Text2Y = 110+yAdjusted

        Anim.to(LowerThirdFull.BreakingBox, 0.8, {Text1Y = -110}):ease("cubicout")
        Anim.to(LowerThirdFull.BreakingBox, 0.8, {Text2Y = yAdjusted}):ease("cubicout")
        LowerThirdFull.BreakingBox.Text1Showing = false
        LowerThirdFull.BreakingBox.Text2Showing = true
    else
        LowerThirdFull.BreakingBox.Text1Y = 110

        Anim.to(LowerThirdFull.BreakingBox, 0.8, {Text1Y = 0}):ease("cubicout")
        Anim.to(LowerThirdFull.BreakingBox, 0.8, {Text2Y = -110}):ease("cubicout")
        LowerThirdFull.BreakingBox.Text1Showing = true
        LowerThirdFull.BreakingBox.Text2Showing = false
    end
    
end

function ShowBreakingLowerThird(text, subtitles)

    --if the lower third is showing, hide it
    if LowerThirdFull.LowerThirdTitleShowing == true then
        HideLowerThirdText()
        Timer.after(1.3, function() ShowBreakingLowerThird(text, subtitles) end)
        return
    end

    --if the presenter name is showing, hide it
    if LowerThirdFull.PresenterNameShowing == true then
        HidePresenterName()
        Timer.after(0.8, function() ShowBreakingLowerThird(text, subtitles) end)
        return
    end

    

    if LowerThirdFull.BreakingBox.Text1Showing == true then
        Anim.to(LowerThirdFull.BreakingBox, 0.8, {Text1Y = -110}):ease("cubicinout")
        LowerThirdFull.BreakingBox.Text1Showing = false
    else
        Anim.to(LowerThirdFull.BreakingBox, 0.8, {Text2Y = -110}):ease("cubicinout")
        LowerThirdFull.BreakingBox.Text2Showing = false
    end

    --If the breaking part was not showig, show it
    if LowerThirdFull.BreakingBox.h == 0 then
        
        --Move clear part up and heighen it
        LowerThirdFull.BreakingBox.Text1 = ""
        LowerThirdFull.BreakingBox.Text2 = ""
        Anim.to(LowerThirdFull.ClearPart, 1, {y = 940-120, h = 170}):ease("cubicout")
        Anim.to(LowerThirdFull.BreakingBox, 1, {y = 940-120, h = 170}):ease("cubicout")
        --And its scissor
        Anim.to(LowerThirdFull.ClearPartScissor, 1, {y = 940-185, h = 235}):ease("cubicout")

        --Move BBC box up
        Anim.to(LowerThirdFull.BBCBox,1, {y = 940-120}):ease("cubicout")

        --Move BBC text up
        Anim.to(LowerThirdFull.BBCText,1, {y = 934-120}):ease("cubicout")

        if LowerThirdFull.ProgramBadgeShowing == true then
            --Move the program badge up
            Anim.to(LowerThirdFull.ProgramBadge, 1, {y = 940-120}):ease("cubicout")

            --Move program badge scissors up
            Anim.to(LowerThirdFull.ProgramBadge, 1, {scissorY = 940-120}):ease("cubicout")
        end
    end

    Timer.after(0.3,function() ShowLowerThirdBox("BREAKING", {184/255,0,0,1},{1,1,1,1}) end)
    Timer.after(0.5, function()

        --Flash LowerThirdBox's text color
        Timer.after(0, function() Anim.to(LowerThirdFull.LowerThirdBox.tCol, 0.2, {184/255,0,0,1}):ease("cubicinout") end)
        Timer.after(0.2, function() Anim.to(LowerThirdFull.LowerThirdBox.tCol, 0.2, {184/255,0,0,0}):ease("cubicinout") end)
        Timer.after(0.4, function() Anim.to(LowerThirdFull.LowerThirdBox.tCol, 0.2, {184/255,0,0,1}):ease("cubicinout") end)
        Timer.after(0.6, function() Anim.to(LowerThirdFull.LowerThirdBox.tCol, 0.2, {184/255,0,0,0}):ease("cubicinout") end)
        Timer.after(0.8, function() Anim.to(LowerThirdFull.LowerThirdBox.tCol, 0.2, {184/255,0,0,1}):ease("cubicinout") end)
        Timer.after(1, function() Anim.to(LowerThirdFull.LowerThirdBox.tCol, 0.2, {184/255,0,0,0}):ease("cubicinout") end)
        Timer.after(1.2, function() Anim.to(LowerThirdFull.LowerThirdBox.tCol, 0.2, {184/255,0,0,1}):ease("cubicinout") end)

        

        LowerThirdFull.LowerThirdTitle.Text = text

        LowerThirdFull.LowerThirdSubtitle1.Text = subtitles[1]
        LowerThirdFull.LowerThirdSubtitle2.Text = subtitles[2]

        if subtitles[2] ~= nil and subtitles[2] ~= "NOP" then LoopBetweenSubtitles() end


        --Move the text up
        Anim.to(LowerThirdFull.LowerThirdTitle, 1, {y = 980-120}):ease("cubicinout")

        --Move the subtitle 1 up
        Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 980-50}):ease("cubicinout")

        --Move the subtitle 2 up
        Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 980}):ease("cubicinout")
    end)
    
end

function HideBreakingLowerThird()
    local delay = 0.2
    if LowerThirdFull.BreakingBox.Text1Showing == true then
        Anim.to(LowerThirdFull.BreakingBox, 0.8, {Text1Y = -100}):ease("cubicinout")
        LowerThirdFull.BreakingBox.Text1Showing = false
        delay = 0.8
    elseif LowerThirdFull.BreakingBox.Text2Showing == true then
        Anim.to(LowerThirdFull.BreakingBox, 0.8, {Text2Y = -100}):ease("cubicinout")
        LowerThirdFull.BreakingBox.Text2Showing = false
        delay = 0.8
    end

    LowerThirdFull.LowerThirdTitleShowing = false

    if OnSub1Timer ~= nil then Timer.cancel(OnSub1Timer) end
    if OnSub2Timer ~= nil then Timer.cancel(OnSub2Timer) end
    if OnSub1EndTimer ~= nil then Timer.cancel(OnSub1EndTimer) end
    if OnSub2TimerEnd ~= nil then Timer.cancel(OnSub2TimerEnd) end

    LowerThirdFull.OnSubtitle = 1

    HideLowerThirdBox()
    
    Timer.after(delay, function()
        
        LowerThirdFull.LowerThirdTitleShowing = false
        LowerThirdFull.BreakingBox.Text1 = ""
        LowerThirdFull.BreakingBox.Text2 = ""

        --Move the text down
        Anim.to(LowerThirdFull.LowerThirdTitle, 0.8, {y = 980}):ease("cubicinout")

        --Move the subtitle 1 down
        Anim.to(LowerThirdFull.LowerThirdSubtitle1, 0.8, {y = 980+70}):ease("cubicinout")

        --Move the subtitle 2 down
        Anim.to(LowerThirdFull.LowerThirdSubtitle2, 0.8, {y = 980+140}):ease("cubicinout")
    end)

     --Move clear part down and shrink it
     Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940, h = 50}):ease("cubicinout"):delay(delay)
     Anim.to(LowerThirdFull.BreakingBox, 0.8, {y = 988, h = 0}):ease("cubicinout"):delay(delay)
     --And its scissor
     Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940, h = 50}):ease("cubicinout"):delay(delay)
 
     --Move BBC box down
     Anim.to(LowerThirdFull.BBCBox, 0.8, {y = 940}):ease("cubicinout"):delay(delay)
 
     --Move BBC text down
     Anim.to(LowerThirdFull.BBCText, 0.8, {y = 934}):ease("cubicinout"):delay(delay)

     if LowerThirdFull.ProgramBadgeShouldShow == true then
        Timer.after(1.5, function() ShowProgramBadge(LowerThirdFull.ProgramBadge.Text, LowerThirdFull.ProgramBadge.tcol, LowerThirdFull.ProgramBadge.bcol) end)
     end
end

function ShowProgramBadge(text, tcolor, bcolor) 
    LowerThirdFull.ProgramBadgeShouldShow = true

    if LowerThirdFull.ProgramBadgeShowing == true then 
        HideProgramBadge()
        Timer.after(0.7, function() ShowProgramBadge(text, tcolor, bcolor) end)
        return 
    end

    LowerThirdFull.ProgramBadgeShowing = true
    LowerThirdFull.ProgramBadge.Text = text
    LowerThirdFull.ProgramBadge.tcol = tcolor
    LowerThirdFull.ProgramBadge.bcol = bcolor
    LowerThirdFull.ProgramBadge.BoxYOffset = 0

    --Program badge X must be aligned to the right of the screen 100px from the edge
    TextWidth = LowerThirdFull.ProgramBadge.Font:getWidth(LowerThirdFull.ProgramBadge.Text)
    LowerThirdFull.ProgramBadge.w = TextWidth + 20
    LowerThirdFull.ProgramBadge.x = 1920-295 - TextWidth

    --Move program badge to the bottom
    LowerThirdFull.ProgramBadge.y = 940+48

    --Move program badge up
    Anim.to(LowerThirdFull.ProgramBadge, 0.5, {y = 940}):ease("cubicout")
end

function HideProgramBadge()
    LowerThirdFull.ProgramBadgeShowing = false
    
    Anim.to(LowerThirdFull.ProgramBadge, 0.5, {y = 892}):ease("cubicin")
end

function SetProgramBadge(text, tcolor, bcolor)
    LowerThirdFull.ProgramBadge.Text = text

    LowerThirdFull.ProgramBadge.tcol = stringToTable(tcolor)
    LowerThirdFull.ProgramBadge.bcol = stringToTable(bcolor)

    --Program badge X must be aligned to the right of the screen 100px from the edge
    TextWidth = LowerThirdFull.ProgramBadge.Font:getWidth(LowerThirdFull.ProgramBadge.Text)
    LowerThirdFull.ProgramBadge.w = TextWidth + 20
    LowerThirdFull.ProgramBadge.x = 1920-295 - TextWidth

    LowerThirdFull.ProgramBadgeShouldShow = true
end

function RemoveProgramBadge()
    HideProgramBadge()
    LowerThirdFull.ProgramBadgeShouldShow = false
end

function ShowInfoBadge(text)
    if LowerThirdFull.ProgramBadgeShowing == true then 
        HideInfoBadge()
        Timer.after(0.7, function() ShowInfoBadge(text) end)
        return 
    end

    --If the presenter name is showing, hide this clear part
    if LowerThirdFull.PresenterNameShowing == true or LowerThirdFullShowing == true then
        LowerThirdFull.ProgramBadge.ClearPartCol = {0,0,0,0}
    else
        LowerThirdFull.ProgramBadge.ClearPartCol = {0,0,0,0.8}
    end

    LowerThirdFull.ProgramBadgeShowing = true
    LowerThirdFull.ProgramBadge.Text = text
    LowerThirdFull.ProgramBadge.tcol = {1,1,1,1}
    LowerThirdFull.ProgramBadge.bcol = ThemeColor

    --Program badge X must be aligned to the right of the screen 100px from the edge
    TextWidth = LowerThirdFull.ProgramBadge.Font:getWidth(LowerThirdFull.ProgramBadge.Text)
    LowerThirdFull.ProgramBadge.w = TextWidth + 20
    LowerThirdFull.ProgramBadge.x = 1920-295 - TextWidth

    --Move program badge to the bottom
    LowerThirdFull.ProgramBadge.y = 940+48

    --Move program badge up
    Anim.to(LowerThirdFull.ProgramBadge, 0.5, {y = 940}):ease("cubicout")

    LowerThirdFull.ProgramBadge.TextYOffset = -5

    
    Timer.after(0.75, function() 
        LowerThirdFull.ProgramBadge.h = 5
    end)

    --Move program badge up back down
    Timer.after(0.3, function() 
       
        Anim.to(LowerThirdFull.ProgramBadge, 0.5, {BoxYOffset = 43}):ease("cubicinout")
    end)
end


function ShowCreditBadge(text)
    if LowerThirdFull.ProgramBadgeShowing == true then 
        HideInfoBadge()
        Timer.after(0.7, function() ShowCreditBadge(text) end)
        return 
    end

    --If the presenter name is showing, hide this clear part
    if LowerThirdFull.PresenterNameShowing == true or LowerThirdFullShowing == true then
        LowerThirdFull.ProgramBadge.ClearPartCol = {0,0,0,0}
    else
        LowerThirdFull.ProgramBadge.ClearPartCol = {0,0,0,0.8}
    end

    LowerThirdFull.ProgramBadgeShowing = true
    LowerThirdFull.ProgramBadge.Text = text
    LowerThirdFull.ProgramBadge.tcol = {1,1,1,1}
    LowerThirdFull.ProgramBadge.bcol = {0,0,0,0}

    --Program badge X must be aligned to the right of the screen 100px from the edge
    TextWidth = LowerThirdFull.ProgramBadge.Font:getWidth(LowerThirdFull.ProgramBadge.Text)
    LowerThirdFull.ProgramBadge.w = TextWidth + 20
    LowerThirdFull.ProgramBadge.x = 1920-295 - TextWidth

    --Move program badge to the bottom
    LowerThirdFull.ProgramBadge.y = 940+48

    --Move program badge up
    Anim.to(LowerThirdFull.ProgramBadge, 0.5, {y = 940}):ease("cubicout")

    LowerThirdFull.ProgramBadge.TextYOffset = -2

    
    Timer.after(0.75, function() 
        LowerThirdFull.ProgramBadge.h = 5
    end)

    --Move program badge up back down
    Timer.after(0.3, function() 
       
        Anim.to(LowerThirdFull.ProgramBadge, 0.5, {BoxYOffset = 43}):ease("cubicinout")
    end)
end











function HideInfoBadge()
    LowerThirdFull.ProgramBadgeShowing = false
    
    Anim.to(LowerThirdFull.ProgramBadge, 0.5, {y = 892}):ease("cubicin")

    Timer.after(0.5, function() 
        LowerThirdFull.ProgramBadge.TextYOffset = 0
        LowerThirdFull.ProgramBadge.BoxYOffset = 0

        LowerThirdFull.ProgramBadge.h = 48

    end)
end

function HideBadgesInstant()
    LowerThirdFull.ProgramBadgeShowing = false
    LowerThirdFull.ProgramBadge.y = 892
end

function ShowLowerThirdBox(text, textColor, bgColor) 
    LowerThirdFull.LowerThirdBoxShowing = true

    LowerThirdFull.LowerThirdBox.Text = text
    LowerThirdFull.LowerThirdBox.tCol = textColor
    LowerThirdFull.LowerThirdBox.bCol = bgColor

    --Calculate the width of the text
    TextWidth = LowerThirdFull.LowerThirdBox.Font:getWidth(LowerThirdFull.LowerThirdBox.Text)
    LowerThirdFull.LowerThirdBox.w = TextWidth + 20


    LowerThirdFull.LowerThirdBox.y = 49

    --Move the box up
    Anim.to(LowerThirdFull.LowerThirdBox, 0.5, {y = 0}):ease("cubicout")

end

function HideLowerThirdBox()
    LowerThirdFull.LowerThirdBoxShowing = false

    --Move the box down
    Anim.to(LowerThirdFull.LowerThirdBox, 0.5, {y = -49}):ease("cubicin")
end


function stringToTable(str)
    local tbl = {}
    for val in string.gmatch(str, "[^/]+") do
      table.insert(tbl, tonumber(val))
    end
    return tbl
  end
  
