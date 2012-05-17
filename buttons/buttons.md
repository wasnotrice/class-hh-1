# Hackety ♥ Buttons #

## Saucy buttons ##

``` ruby
button "Don't click"
```

## Ok, so _do_ something ##

``` ruby
button "Don't click" do
  alert "Hey! No fair!"
end
```

## Be the button ##

``` ruby
b = button "Don't click" do
  alert "Fine. Bye."
  b.remove
end
```

## Play hard to get ##

``` ruby
b = button ":P" do
  left = rand(width)
  top = rand(height)
  b.move left, top
end
```

