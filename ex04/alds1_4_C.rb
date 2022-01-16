class Hashmap
    attr_accessor :map

    def initialize()
        @N = 10**6
        @map = Array.new(@N){Array.new}
        @mod = @N + 3
    end

    def calc_hash(val_s)
        hash = 0
        val_s.split("").each_with_index{|c, idx|
            idx += 1
            case c
            when 'A'
                hash += idx
            when 'C'
                hash =+ 10 * idx
            when 'G'
                hash += 100 * idx
            else
                hash += 1000 * idx
            end
        }
        hash % @mod
    end

    def insert(val_s)
        map[self.calc_hash(val_s)].push(val_s)
    end

    def find(val_s)
        map[self.calc_hash(val_s)].any?{|v| v == val_s}
    end
end

gets
hash = Hashmap.new()
while s = gets do
    operation, operand = s.split
    if operation == "insert"
        hash.insert(operand)
    else
        puts hash.find(operand) ? "yes" : "no"
    end
end