n = gets.to_i
muts = Array.new(n){gets.split.map(&:to_i)}

minimum_table = Array.new(n){Array.new}

class Array
    def prepare(n)
        @minimum_table = Array.new(n){Array.new}
    end

    def calc_min(left = 0, right = self.length - 1)
        if right == left then
            return 0
        else
            tmp = []
            for i in left..(right - 1) do
                unless leftres = @minimum_table[left][i] then
                    leftres = self.calc_min(left, i)
                end
                unless rightres = @minimum_table[i + 1][right] then
                    rightres = self.calc_min(i + 1, right)
                end
                total = leftres + rightres + (self[left][0] * self[i][1] * self[right][1])
                tmp.push(total)
            end
            mini = tmp.min
            @minimum_table[left][right] = mini
            return mini
        end
    end
end

muts.prepare(n)
p muts.calc_min