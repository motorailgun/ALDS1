a_n = gets.to_i
a = gets.split.map(&:to_i)
m_n = gets.to_i
m = gets.split.map(&:to_i)

table = Array.new

k = 2 ** a_n - 1
k.times{|i|
    s = 0
    a.each_with_index{|spr, idx|
        s += spr if (2 ** idx) & i > 0
    }
    table[s] = true
}

m.each{|pe|
    puts table[pe] ? "yes" : "no"
}