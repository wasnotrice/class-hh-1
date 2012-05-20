Shoes.app do
  background dimgray
  fill darkgreen
  nostroke
  rect 0, 400, 600, 100
  top = 112
  left = 300
  mateo = image "/Users/eric/mateo.png", :top => top, :left => left
  walk = animate 8 do |frame|
    left -= Math.sin(frame/4) * 20
    mateo.move left.round, top.round
  end
end