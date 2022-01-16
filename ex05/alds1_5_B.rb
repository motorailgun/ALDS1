def merge(ar_a, ar_b)
    res = Array.new
    while ar_a[0] && ar_b[0] do
        @cmp += 1
        res.push(ar_a[0] > ar_b[0] ? ar_b.shift : ar_a.shift)
    end
    ar_a.empty? ? nil : ar_a.each{|pear| res.push(pear)}
    ar_b.empty? ? nil : ar_b.each{|pear| res.push(pear)}
    @cmp += ar_a.length
    @cmp += ar_b.length
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

@cmp = 0
gets
inp = gets.split.map(&:to_i)
puts msort(inp).join(" ")
puts @cmp