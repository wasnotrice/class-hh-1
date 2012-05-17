# Turtle Graphics #

# Starburst #

``` ruby
Turtle.start do
  background black
  pencolor white
  100.times do
    angle = rand(45)
    distance = rand(100)
    turnright angle
    forward distance
    backward distance
  end
end
```


