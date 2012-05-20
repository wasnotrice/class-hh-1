Shoes.app do
  b = button ":P" do
    left = rand(width)
    top = rand(height)
    b.move left, top
  end
end