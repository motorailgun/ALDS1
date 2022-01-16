fib = [1,1]

n = gets.to_i
for i in 2..n do
    fib[i] = fib[i - 1] + fib[i - 2]
end

puts fib[n]