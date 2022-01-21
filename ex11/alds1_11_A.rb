n = gets.to_i
matrix = Array.new(n){Array.new(n){0}}

n.times{
    point, nums, *targets = gets.split.map(&:to_i)
    targets.each{|v|
        matrix[point - 1][v - 1] = 1
    }
}

puts matrix.map{|line| line.join(" ")}.join("\n")