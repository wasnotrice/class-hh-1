Shoes.app do
  background dimgray
  fill darkgreen
  nostroke
  rect 0, 400, 600, 100
  left = 300
  top = 112
  mateo = image "/Users/eric/mateo.png", :top => top, :left => left
  walk = animate 8 do |frame|
    left -= Math.sin(frame/4) * 20
    mateo.move left.round, top.round
  end
  
  message = banner ""
    
  shrink = animate do
    if mateo.width > 20
      mateo.width -= 2
    end
  end
  
  grow = animate do
    if mateo.width < 172
      mateo.width += 2
    end
  end
  
  # Stop doesn't seem to work unless you call start first :(
  shrink.start
  shrink.stop
  grow.start
  grow.stop
  
  growing = true
 
  # Release of mouse button (i.e. it was already clicked, and now
  # it was released) 
  release do |button, left, top|
    # Click on Mateo
    if left > mateo.left && left < mateo.left + mateo.width && 
      top > mateo.top && top < mateo.top + mateo.height
      if growing
        message.replace "Good night, Mateo!"
        grow.stop
        shrink.start
        growing = false
      else
        message.replace "Wake up, Mateo!"
        shrink.stop
        grow.start
        growing = true
      end
    else
      walk.toggle
    end
  end
end