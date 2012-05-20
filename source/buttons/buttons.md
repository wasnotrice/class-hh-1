# Hackety ♥ Buttons #

## Hello button ##

``` ruby
button "Hi"
```

## Ok, so _do_ something ##

``` ruby
  title "What did the zero"
  title "say to the eight?"
  button "I give up" do
    banner "Nice belt."
  end
```

## Do something to others ##

``` ruby
  title "What did the zero"
  title "say to the eight?"
  punchline = banner "Nice belt."
  punchline.hide
  button "I give up" do
    punchline.show
  end
```

## Do something later ##

``` ruby
  title "What did the zero"
  title "say to the eight?"
  give_up = button "I give up"
  punchline = banner "Nice belt."
  punchline.hide
  give_up.click do
    punchline.show
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

