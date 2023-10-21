PlaceName = {
    LIVE = false,

    Box = {
        x = 280,
        y = 50,
        w = 100,
        h = 40,
        c = {0,0,0,0.7}
    },

    BottomBar = {
        x = 280,
        y = 90,
        w = 100,
        h = 5,
        c = ThemeColor
    },

    liveBox = {
        x = 280,
        y = 50,
        w = 85,
        h = 40,
        c = ThemeColor
    },

    Name = "LIVE   Newsroom",

    TimeOffset = 0,

    timeBox = {
        x = 300,
        y = -90,
        w = 85,
        h = 40,
        c = ThemeColor,
        text = "00:00",
    }
}

PlaceNameShowing = false

function DrawPlaceName()

    love.graphics.setScissor(280,50,1920,PlaceName.Box.h + PlaceName.BottomBar.h)
        --if first 4 letters of name are "LIVE" then set LIVE to true
        if string.sub(PlaceName.Name,1,4) == "LIVE" then PlaceName.LIVE = true else PlaceName.LIVE = false end

        PlaceName.timeBox.text = os.date("%H:%M", os.time() + PlaceName.TimeOffset)

        PlaceName.Box.w, PlaceName.BottomBar.w = ReithSansRegular:getWidth(PlaceName.Name) + 20, ReithSansRegular:getWidth(PlaceName.Name) + 20
        PlaceName.timeBox.w = ReithSansRegular:getWidth(PlaceName.timeBox.text) + 20
        PlaceName.timeBox.x = PlaceName.Box.w + PlaceName.Box.x + 10

        --Place Name Box
        love.graphics.setColor(PlaceName.Box.c)
        love.graphics.rectangle("fill",PlaceName.Box.x,PlaceName.Box.y,PlaceName.Box.w,PlaceName.Box.h)

        --Place Name liveBox
        if PlaceName.LIVE then
            love.graphics.setColor(ThemeColor)
            love.graphics.rectangle("fill",PlaceName.liveBox.x,PlaceName.liveBox.y,PlaceName.liveBox.w,PlaceName.liveBox.h)
        end

        --Place Name Bottom Bar
        love.graphics.setColor(ThemeColor)
        love.graphics.rectangle("fill",PlaceName.BottomBar.x,PlaceName.BottomBar.y,PlaceName.BottomBar.w,PlaceName.BottomBar.h)

        --Place Name Text
        love.graphics.setFont(ReithSansRegular)
        love.graphics.setColor(1,1,1,1)
        love.graphics.print(PlaceName.Name,PlaceName.Box.x + 10,PlaceName.Box.y)

        --Time box
        love.graphics.setColor(PlaceName.Box.c)
        love.graphics.rectangle("fill", PlaceName.timeBox.x, PlaceName.timeBox.y, PlaceName.timeBox.w, PlaceName.timeBox.h)

        --Place Name Bottom Bar
        love.graphics.setColor(ThemeColor)
        love.graphics.rectangle("fill",PlaceName.timeBox.x,PlaceName.timeBox.y+PlaceName.timeBox.h,PlaceName.timeBox.w,PlaceName.BottomBar.h)
        

        --Time Text
        love.graphics.setFont(ReithSansRegular)
        love.graphics.setColor(1,1,1,1)
        love.graphics.print(PlaceName.timeBox.text,PlaceName.timeBox.x + 10,PlaceName.timeBox.y)

    love.graphics.setScissor()
end

function ShowPlaceName(text)
    if PlaceNameShowing then 
        HidePlaceName()
        Timer.after(0.5, function() ShowPlaceName(text) end)
    return
    end

    PlaceNameShowing = true
    PlaceName.Name = text
    PlaceName.Box.y = 50+50
    PlaceName.BottomBar.y = 90+50
    PlaceName.liveBox.y = 50+50

    --Move Place Name Box up
    Anim.to(PlaceName.Box,0.5,{y = 50}):ease("quartout")
    Anim.to(PlaceName.BottomBar,0.5,{y = 90}):ease("quartout")
    Anim.to(PlaceName.liveBox,0.5,{y = 50}):ease("quartout")
    
end

function ShowPlaceNameWithTime(text, TimeOffset)


    if PlaceNameShowing then 
        HidePlaceName()
        Timer.after(0.5, function() ShowPlaceNameWithTime(text, TimeOffset) end)
    return
    end

    PlaceName.TimeOffset = TimeOffset*3600

    PlaceNameShowing = true
    PlaceName.Name = text
    PlaceName.Box.y = 50+50
    PlaceName.BottomBar.y = 90+50
    PlaceName.timeBox.y = 90+50
    PlaceName.liveBox.y = 50+50

    --Move Place Name Box up
    Anim.to(PlaceName.Box,0.5,{y = 50}):ease("quartout")
    Anim.to(PlaceName.BottomBar,0.5,{y = 90}):ease("quartout")
    Anim.to(PlaceName.liveBox,0.5,{y = 50}):ease("quartout")
    
    Anim.to(PlaceName.timeBox,0.5,{y = 50}):ease("quartout")
    Anim.to(PlaceName.BottomBar,0.5,{y = 90}):ease("quartout")
    
    
end 

function HidePlaceName()
    PlaceNameShowing = false
    --Move Place Name Box up
    Anim.to(PlaceName.Box,0.5,{y = -90}):ease("quartin")

    --Move Place Name Bottom Bar up
    Anim.to(PlaceName.BottomBar,0.5,{y = -90}):ease("quartin")

    --Move Place Name liveBox up
    Anim.to(PlaceName.liveBox,0.5,{y = -90}):ease("quartin")

    Anim.to(PlaceName.timeBox,0.5,{y = -90}):ease("quartin")

end

function HidePlaceNameInstant()
    PlaceName.Box.y = -90
    PlaceName.BottomBar.y = -90
    PlaceName.liveBox.y = -90
end