def qsort(s, e)
    if e > s then
        thr = @ar[e]
        current_pos = s - 1
        (e - s).times{|i|
            i += s
            if @ar[i][1] <= thr[1] then
                current_pos += 1
                tmp = @ar[current_pos]
                @ar[current_pos] = @ar[i]
                @ar[i] = tmp
            end
        }
        tmp = @ar[current_pos + 1]
        @ar[current_pos + 1] = @ar[e]
        @ar[e] = tmp
        qsort(s, current_pos)
        qsort(current_pos + 2, e)
    end
end

def merge(ar_a, ar_b)
    res = Array.new
    while ar_a[0] && ar_b[0] do
        res.push(ar_a[0][1] > ar_b[0][1] ? ar_b.shift : ar_a.shift)
    end
    ar_a.empty? ? nil : ar_a.each{|pear| res.push(pear)}
    ar_b.empty? ? nil : ar_b.each{|pear| res.push(pear)}
    res
end

def msort(ar)
    n = ar.length
    if n == 1 then
        return ar
    else
        merge(msort(ar[0..(n / 2 - 1)]), msort(ar[(n / 2)..(n - 1)]))
    end
end


n = gets.to_i
ar = $stdin.read.split("\n").map{|p| c = p.split; c[1] = c[1].to_i; c}

@ar = Array.new(ar)
qsort(0, n - 1)
msed = msort(ar)

puts @ar == msed ? "Stable" : "Not stable"

puts @ar.map{|a| a.join(" ")}