n = gets.to_i
heap = gets.split.map(&:to_i).unshift(nil)

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
end

heap.buildmaxheap
puts heap.join(" ")

