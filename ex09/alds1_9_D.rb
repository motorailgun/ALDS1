class Array
    def swap(a, b)
        tmp = self[a]
        self[a] = self[b]
        self[b] = tmp
    end

    def unsort
        res = self.compact.sort
        for i in 0..(res.length - 2) do
            j = i
            while j > 0 do
                k = (j - 1) / 2
                res.swap(k, j)
                j = k
            end
            res.swap(0, i + 1)
        end
        res
    end
end


n = gets.to_i
ar = gets.split.map(&:to_i)

puts ar.unsort.join(" ")
