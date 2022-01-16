n = gets.to_i
ar = gets.split.map(&:to_i)
sorted = ar.sort
chains = Hash.new

ar.each_with_index{|pt, idx|
    if sorted[idx] != pt then
        chains[pt] = ar[sorted.index(pt)]
    end
}

class Hash
    def get_one_group!
        return nil if self.empty?
        t = self.first[0]
        res = Array.new
        while self[t] do
            res.push(t = self.delete(t))
        end
        res
    end
end

groups = Array.new
while gp = chains.get_one_group! do
    groups.push(gp.sort)
end

sum = 0
minar = ar.min

groups.each{|chain|
    g_sum = chain[0] * (chain.length - 1) + chain[1..(chain.length - 1)].inject(:+)
    m_sum = (chain[0] + minar) * 2 + minar * (chain.length - 1) + chain[1..(chain.length - 1)].inject(:+)

    sum += [g_sum, m_sum].min
}

puts sum
