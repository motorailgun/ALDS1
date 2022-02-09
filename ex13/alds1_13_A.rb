virtical, horizontal, r_d, l_d = Array.new, Array.new, Array.new, Array.new
N = 8
board = Array.new(N){Array.new(N)}

qs = gets.to_i
qs.times{
    row, column = gets.split.map(&:to_i)
    board[row][column] = true
    horizontal[row] = true
    virtical[column] = true
    r_d[row - column + N - 1] = true
    l_d[row + column] = true
}

place_queens = Proc.new{|already_placed|
    
}