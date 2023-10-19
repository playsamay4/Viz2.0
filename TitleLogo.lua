TitleLogo = {
    image = newsTitle,
    c = {1,1,1,0},
    Showing = false,
}


Chameleon = {
    bimg = love.graphics.newImage("images/b.png"),
    cimg = love.graphics.newImage("images/c.png"),
    c = {1,1,1,1},
    Showing = false,
    vy = 74,
    by = 74,
    ny = 74,
    newsy = 895,
    newscol = {1,1,1,1},
    newsfont = love.graphics.newFont("fonts/ReithSansBd.ttf", 93),
    newstext = "NEWS",
}

Chameleon.bimg:setFilter("nearest","nearest")
Chameleon.cimg:setFilter("nearest","nearest")


function DrawTitleLogo()
    love.graphics.setColor(TitleLogo.c)
    love.graphics.draw(TitleLogo.image, 287, 780, 0, 0.77,0.77)

    love.graphics.setColor(Chameleon.c)
    love.graphics.draw(Chameleon.bimg, 794, Chameleon.vy, 0, 0.13)
    love.graphics.draw(Chameleon.bimg, 913, Chameleon.by, 0, 0.13)
    love.graphics.draw(Chameleon.cimg, 1032, Chameleon.ny, 0, 0.13)

    love.graphics.setColor(Chameleon.newscol)
    love.graphics.setFont(Chameleon.newsfont)
    love.graphics.print(Chameleon.newstext, 832, Chameleon.newsy)
end


function ShowTitleLogo()
    if HeadlineShowing then
        if Single then HideHeadlineSingle() else HideHeadlineDouble() end
        Timer.after(1, function() ShowTitleLogo() end)
    elseif LowerThirdFull.LowerThirdShowing then
        HideLowerThirdFull()
        Timer.after(1, function() ShowTitleLogo() end)
    else
        Anim.to(TitleLogo.c, 0.3, {1,1,1,1})
        TitleLogo.Showing = true
    end
end

function HideTitleLogo()
    Anim.to(TitleLogo.c, 0.8, {1,1,1,0})
    TitleLogo.Showing = false
end

function ShowTitleLogoInstant()
    HideLowerThirdFull()

    TitleLogo.c = {1,1,1,1}
    TitleLogo.Showing = true
end

function HideTitleLogoInstant()
	TitleLogo.c = {1,1,1,0}
	TitleLogo.Showing = false
end


function ShowChameleon()
    Anim.to(Chameleon , 0.7, {vy = 74}):ease("cubicout")
    Anim.to(Chameleon , 0.7, {by = 74}):delay(0.05):ease("cubicout")
    Anim.to(Chameleon , 0.7, {ny = 74}):delay(0.1):ease("cubicout")

    Anim.to(Chameleon , 0.7, {newsy = 895}):ease("cubicout")
    Anim.to(Chameleon.newscol , 0.7, {1,1,1,1})

    Chameleon.Showing = true
end

function HideChameleon()
    Anim.to(Chameleon , 0.7, {vy = -95}):ease("cubicin")
    Anim.to(Chameleon , 0.7, {by = -95}):delay(0.05):ease("cubicin")
    Anim.to(Chameleon , 0.7, {ny = -95}):delay(0.1):ease("cubicin")

    Anim.to(Chameleon , 0.7, {newsy = 920}):ease("cubicin")
    Anim.to(Chameleon.newscol , 0.7, {1,1,1,0})

    Chameleon.Showing = false
end

function HideChameleonInstant()
    Chameleon.vy = -95
    Chameleon.by = -95
    Chameleon.ny = -95
    Chameleon.newsy = 920
    Chameleon.newscol = {1,1,1,0}

    Chameleon.Showing = false
end 