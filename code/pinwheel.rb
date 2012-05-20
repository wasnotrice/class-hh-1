Shoes.app do
  stroke goldenrod
  strokewidth 3
  fill hotpink
  oval 100, 200, 200
  fill yellowgreen
  rect 200, 100, 150, 150
  fill lightsteelblue
  sirius = star 400, 150
  animate do |frame|
    sirius.remove
    rotate frame
    sirius = star 400, 150
  end
end