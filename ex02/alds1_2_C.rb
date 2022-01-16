def bsort(ar)
    n = ar.length
    loop{
        flag = true
        (n-1).times{|i|
            i += 1
            if ar[i-1][1] > ar[i][1] then
                tmp = ar[i - 1]
                ar[i - 1] = ar[i]
                ar[i] = tmp
                flag = false
            end
        }
        break if flag
    }
    return ar
end

def ssort(ar)
    n = ar.length
    n.times{|i|
        min_i = i
        min_n = ar[i]
        ar[i..(n - 1)].each_with_index{|con, idx|
            if min_n[1] > con[1] then
                min_i = idx + i
                min_n = con
            end
        }
        if min_i != i then
            tmp = ar[i]
            ar[i] = min_n
            ar[min_i] = tmp
        end
    }
    return ar
end


gets
ar_1 = gets.split.map{|card|
    c = card.split("")
    c[1] = c[1].to_i
    c
}
ar_2 = Array.new(ar_1)

bsordted = bsort(ar_1).map{|ar| ar.join}.join(" ")
ssorted = ssort(ar_2).map{|ar| ar.join}.join(" ")

puts bsordted, "Stable"
puts ssorted, bsordted == ssorted ? "Stable" : "Not stable"
