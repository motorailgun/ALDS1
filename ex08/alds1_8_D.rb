class Array
    attr_accessor :root

    def find(val)
        current = root
        loop do
            if !current then
                puts "no"
                break
            elsif current == val then
                puts "yes"
                break
            elsif current > val then
                current = self[current][1][0]
            else
                current = self[current][1][1]
            end
        end
    end

    def print
        self.ino(root)
        puts ''
        self.preo(root)
        puts ''
    end

    def preo(s)
        print " ", s
        self.preo(self[s][1][0]) if self[s][1][0]
        self.preo(self[s][1][1]) if self[s][1][1]
    end

    def ino(s)
        self.ino(self[s][1][0]) if self[s][1][0]
        print " ", s
        self.ino(self[s][1][1]) if self[s][1][1]
    end

    def right_rotate(node_idx)
        tmp = self[node_idx][1][0]
        self[node_idx][1][0] = self[tmp][1][1]
        self[tmp][1][1] = node_idx
        return tmp
    end

    def left_rotate(node_idx)
        tmp = self[node_idx][1][1]
        self[node_idx][1][1] = self[tmp][1][0]
        self[tmp][1][0] = node_idx
        return tmp
    end
end