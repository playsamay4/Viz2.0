Transition = {
    RedPart = {
        x = 0,
        y = 1080+500,
        w = 1920,
        h = 500,
    },

    WhitePart = {
        x = 0,
        y = 1080+1100,
        w = 1920,
        h = 1100,
    },
    col = ThemeColor
}

function DrawTransition()
    love.graphics.setColor(Transition.col[1],Transition.col[2],Transition.col[3],0.95)
    love.graphics.rectangle("fill",Transition.RedPart.x,Transition.RedPart.y,Transition.RedPart.w,Transition.RedPart.h)

    love.graphics.setColor(0.8,0.8,0.8,1)
    love.graphics.rectangle("fill",Transition.WhitePart.x,Transition.WhitePart.y,Transition.WhitePart.w,Transition.WhitePart.h)
end


function ShowTransition()
    if RedAnim then RedAnim:stop() end
    if WhiteAnim then WhiteAnim:stop() end

    Transition.RedPart.y = 1080+500
    Transition.WhitePart.y = 1080+1100

    RedAnim = Anim.to(Transition.RedPart,1.3,{y = -500})
    WhiteAnim = Anim.to(Transition.WhitePart,1.3,{y = -1100}):delay(0.1)
end