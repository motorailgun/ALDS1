n = gets.to_i
ar = gets.split.map(&:to_i)
count = 0

n.times{|i|
    min_i = i
    min_n = ar[i]
    ar[i..(n - 1)].each_with_index{|con, idx|
        if min_n > con then
            min_i = idx + i
            min_n = con
        end
    }
    if min_i != i then
        count += 1
        tmp = ar[i]
        ar[i] = min_n
        ar[min_i] = tmp
    end
}

puts ar.join(" ")
puts count