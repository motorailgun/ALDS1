n = gets.to_i
ar = gets.split.map(&:to_i)

count = 0
loop{
    flag = true
    (n-1).times{|i|
        i += 1
        if ar[i-1] > ar[i] then
            tmp = ar[i - 1]
            ar[i - 1] = ar[i]
            ar[i] = tmp
            count += 1
            flag = false
        end
    }
    break if flag
}

puts ar.join(" ")
puts count