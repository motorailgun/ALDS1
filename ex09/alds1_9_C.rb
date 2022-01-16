heap = Array.new
heap[0] = nil

class Array
    def swap(a, b)
        tmp = self[a]
        self[a] = self[b]
        self[b] = tmp
    end

    def maxheapfy(i)
        l = i * 2
        r = i * 2 + 1
        largest = i
        largest = l if self[l] && self[l] > self[i]
        largest = r if self[r] && self[r] > self[largest]

        if largest != i then
            self.swap(i, largest)
            self.maxheapfy(largest)
        end
    end

    def buildmaxheap
        (1..(self.length / 2)).to_a.reverse.each{|i|
            self.maxheapfy(i)
        }
    end

    def insert(n)
        self.push(n)
        current = self.length - 1
        while current > 1 do
            if self[current / 2] > self[current]
                break
            else
                self.swap(current / 2, current)
                current /= 2
            end
        end
    end

    def extract
        n = self[1]
        self[1] = self.pop
        self.maxheapfy(1)
        n
    end
end

loop{
    ope, k = gets.split
    k = k.to_i if k

    case ope
    when "end"
        break
    when "insert"
        heap.insert(k)
    else
        puts heap.extract
    end
}

