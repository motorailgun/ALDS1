gets
searchbase = gets.split.map(&:to_i)
gets
to_search = gets.split.map(&:to_i)

def bisearch(p, ary)
    # puts("#{p}, #{ary}")
    if ary.first == p then
        true
    elsif ary.length == 1 then
        false
    elsif ary[x = (ary.length - 1) / 2] < p then
        bisearch(p, ary[(x+1)..(ary.length - 1)])
    else
        bisearch(p, ary[0..x])
    end
end

count = 0
to_search.each{|k|
    next if k < searchbase[0] || searchbase.last < k
    count += 1 if bisearch(k, searchbase)
}

puts count