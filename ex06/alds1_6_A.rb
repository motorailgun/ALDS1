n = Array.new(2000001){0}
gets
gets.split.map(&:to_i).each{|k|
    n[k] += 1
}

res = Array.new
n.each_with_index{|ct, idx|
    ct.times{res.push(idx)}
}

puts res.join(" ")