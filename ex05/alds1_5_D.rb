class BIT
    attr_accessor :tree
    def initialize(n)
        @tree = Array.new(n+1){0}
    end

    def add(pear, val)
        while @tree[pear] do
            @tree[pear] += val
            pear += (-pear & pear)
        end
    end
    
    def sum(pear)
        s = 0
        while pear > 0 do
            s += @tree[pear] || 0
            pear -= (-pear & pear)
        end
        s
    end
end

n = gets.to_i
ar = gets.split.map(&:to_i)

lut = Hash.new
ar.sort.each_with_index{|p, idx|
    lut[p] = idx + 1
}

s = 0
tr = BIT.new(n + 1)
ar.each_with_index{|k, idx|
    tr.add(lut[k] + 1, 1)
    s += idx + 1 - tr.sum(lut[k] + 1)
}

puts s
