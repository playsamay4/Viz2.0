ShitHeadlines = {
    FadeColor = {1,1,1,0},
    lookN = {
        showing = false,
        HeadBox = {
            text = "LOOK NORTH",
            color = {185/255,0,0,1},
            x = 268,
            y = 781,
            w = 390,
            h = 50,
            logo = love.graphics.newImage("images/WhiteLogoTransparent.png"),
            font = love.graphics.newFont("fonts/ReithSansBd.ttf",35)
        },
        Text = {
            text = "Tortured and skinned alive!",
            x = 268,
            y = 840,
            font = love.graphics.newFont("fonts/ReithSerifRg.ttf",110)
        },
        LeftBarRed = {
            color = {185/255,0,0,1},
            x = 220,
            y = 781,
            w = 10,
            h = 200,
        },

        LeftBarWhite = {
            color = {1,1,1,1},
            x = 220,
            y = 781,
            w = 10,
            h = 200,
        },

        scissor = {
            x = 258,
            y= 840,
            w = 1920, 
            h= 160,
        }
    }
}



function DrawShitHeadlines()
    love.graphics.setColor(ShitHeadlines.FadeColor)
    love.graphics.draw(Fader,0,0,0,1.5,1.5)

    love.graphics.setScissor(268,781,1920,50)
        love.graphics.setColor(ShitHeadlines.lookN.HeadBox.color)
        love.graphics.rectangle("fill", ShitHeadlines.lookN.HeadBox.x, ShitHeadlines.lookN.HeadBox.y, ShitHeadlines.lookN.HeadBox.font:getWidth(Headline.BBCText.Text) + 150,ShitHeadlines.lookN.HeadBox.h)

        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(ShitHeadlines.lookN.HeadBox.logo, ShitHeadlines.lookN.HeadBox.x+11, ShitHeadlines.lookN.HeadBox.y+7,0, 0.048,0.048)
        love.graphics.setFont(ShitHeadlines.lookN.HeadBox.font)
        love.graphics.print(Headline.BBCText.Text,ShitHeadlines.lookN.HeadBox.x+144, ShitHeadlines.lookN.HeadBox.y)
    love.graphics.setScissor()

    love.graphics.setScissor(ShitHeadlines.lookN.scissor.x,ShitHeadlines.lookN.scissor.y,ShitHeadlines.lookN.scissor.w,ShitHeadlines.lookN.scissor.h)
        love.graphics.setFont(ShitHeadlines.lookN.Text.font)
        love.graphics.print(ShitHeadlines.lookN.Text.text, ShitHeadlines.lookN.Text.x,ShitHeadlines.lookN.Text.y)
    love.graphics.setScissor()

    love.graphics.setColor(ShitHeadlines.lookN.LeftBarWhite.color)
    love.graphics.rectangle("fill", ShitHeadlines.lookN.LeftBarWhite.x, ShitHeadlines.lookN.LeftBarWhite.y, ShitHeadlines.lookN.LeftBarWhite.w,ShitHeadlines.lookN.LeftBarWhite.h)

    love.graphics.setColor(ShitHeadlines.lookN.LeftBarRed.color)
    love.graphics.rectangle("fill", ShitHeadlines.lookN.LeftBarRed.x, ShitHeadlines.lookN.LeftBarRed.y, ShitHeadlines.lookN.LeftBarRed.w,ShitHeadlines.lookN.LeftBarRed.h)
    --love.graphics.print("x"..ShitHeadlines.lookN.HeadBox.x.."-y"..ShitHeadlines.lookN.HeadBox.y.."-w"..ShitHeadlines.lookN.HeadBox.w.."-h"..ShitHeadlines.lookN.HeadBox.h)
end

function ShowShitHeadlines(text, region)
    if ShitHeadlines.lookN.showing == true then 
        HideShitHeadlines()
        Timer.after(0.7, function()
            ShowShitHeadlines(text)
        end)
        return
    end
    ShitHeadlines.lookN.Text.text = text
        
    ShitHeadlines.lookN.showing = true
    ShitHeadlines.lookN.HeadBox.y = 831
    Anim.to(ShitHeadlines.lookN.HeadBox,0.7, {y= 781}):ease("linear")
    
    ShitHeadlines.lookN.LeftBarRed.h = 0
    ShitHeadlines.lookN.LeftBarWhite.h = 0
    Anim.to(ShitHeadlines.lookN.LeftBarRed,0.5, {h=200}):ease("linear"):delay(0.2)
    Anim.to(ShitHeadlines.lookN.LeftBarWhite,0.7, {h=200}):ease("linear")

    ShitHeadlines.lookN.scissor.h = 0
    ShitHeadlines.lookN.scissor.y = 890
    ShitHeadlines.lookN.Text.y = 910

    Anim.to(ShitHeadlines.lookN.scissor,0.7, {h=200, y = 840}):ease("linear")
    Anim.to(ShitHeadlines.lookN.Text,0.7, {y = 840}):ease("linear")

    Anim.to(ShitHeadlines.FadeColor,1, {1,1,1,1})
    

end

function HideShitHeadlines()
    ShowTransition()
    Timer.after(0.65, function()
        ShitHeadlines.lookN.showing = false
        ShitHeadlines.FadeColor = {1,1,1,0}
        ShitHeadlines.lookN.scissor.h = 0
        ShitHeadlines.lookN.scissor.y = 890
        ShitHeadlines.lookN.Text.y = 910
        ShitHeadlines.lookN.LeftBarRed.h = 0
        ShitHeadlines.lookN.LeftBarWhite.h = 0
        ShitHeadlines.lookN.HeadBox.y = 831
    end)    
end

function RemoveShitHeadline()
        ShitHeadlines.lookN.showing = false
        ShitHeadlines.FadeColor = {1,1,1,0}
        ShitHeadlines.lookN.scissor.h = 0
        ShitHeadlines.lookN.scissor.y = 890
        ShitHeadlines.lookN.Text.y = 910
        ShitHeadlines.lookN.LeftBarRed.h = 0
        ShitHeadlines.lookN.LeftBarWhite.h = 0
        ShitHeadlines.lookN.HeadBox.y = 831
end

ShitHeadlines.FadeColor = {1,1,1,0}
ShitHeadlines.lookN.scissor.h = 0
ShitHeadlines.lookN.scissor.y = 890
ShitHeadlines.lookN.Text.y = 910
ShitHeadlines.lookN.LeftBarRed.h = 0
ShitHeadlines.lookN.LeftBarWhite.h = 0
ShitHeadlines.lookN.HeadBox.y = 831
