# Human versus Human Connect Four

Shoes.app :width => 640, :height => 640, :resizable => false do
  # Build the 8 by 8 board, a set of ovals!
  @board = Array.new(8) do |x| 
    Array.new(8) do |y|
      oval(x*80, y*80, 80, :fill => white)
    end
  end  
  
  @move = blue
  
  click do |b, x, y|
    piece_x = x / 80
        
    # Do not continue if the column is full
    break if @board[piece_x][0].fill != white
       
    # Find empty piece in this column and fill it
    i = 7
    col = @board[piece_x]
    col.reverse.each do |b|
      if b.fill == white
        b.style(:fill => @move)
        
        # Check for a winner
        winner = false
        if i <= 4 and col[i+1..i+3].inject(true) {|truth, n| truth and n.fill == @move}
          winner = true
        end
        
        # Check on diagonals    
        sum = 1
        [piece_x,i].min.times do |j|
          break if @board[piece_x-j-1][i-j-1].fill != @move
          sum = sum + 1
        end
        
        [7-piece_x,7-i].min.times do |j|
          break if @board[piece_x+1+j][i+1+j].fill != @move
          sum = sum + 1
        end
        
        winner = true if sum >= 4
            
        sum = 1

        [piece_x,7-i].min.times do |j|
          break if @board[piece_x-j-1][i+1+j].fill != @move
          sum = sum + 1
        end        

        [7-piece_x,i].min.times do |j|
          break if @board[piece_x+1+j][i-1-j].fill != @move
          sum = sum + 1
        end        

        winner = true if sum >= 4

        # Check row
        sum = 1
        piece_x.times do |j|
          break if @board[piece_x-1-j][i].fill != @move
          sum = sum + 1
        end
        
        (7-piece_x).times do |j|
          break if @board[piece_x+j+1][i].fill != @move
          sum = sum + 1
        end



        winner = true if sum >= 4
                          
        if winner
          alert('You win!')
          
          # Reset board, loser goes first!
          @board.each { |col| col.each { |b| b.style(:fill => white) } }
        end
        break
      end
      i = i - 1
    end
    
    # Switch turn
    if @move == blue then @move = green else @move = blue end
  end
end