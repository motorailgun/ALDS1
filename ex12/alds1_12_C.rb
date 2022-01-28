n = gets.to_i
graph = Array.new(n){
    id, num, *point_and_cost = gets.split.map(&:to_i)
    (1..num).to_a.map{|s| point_and_cost[2 * (s - 1), 2]} # [dest, cost]
}

class Heap < Array
    def swap(a, b)
        self[a], self[b] = self[b], self[a]
    end

    def minheapfy(i)
        l = i * 2
        r = i * 2 + 1
        smallest = i
        smallest = l if self[l] && self[l][1] < self[i][1]
        smallest = r if self[r] && self[r][1] < self[smallest][1]

        if smallest != i then
            self.swap(i, smallest)
            self.minheapfy(smallest)
        end
    end

    def buildminheap
        (1..(self.length / 2)).to_a.reverse.each{|i|
            self.minheapfy(i)
        }
    end

    def insert(n)
        self.push(n)
        current = self.length - 1
        while current > 1 do
            if self[current / 2][1] < self[current][1]
                break
            else
                self.swap(current / 2, current)
                current /= 2
            end
        end
    end

    def insert_many(ar)
        ar.each{|n| self.insert(n) }
    end

    def extract
        return nil if self.length == 1
        return self.pop if self.length == 2
        n = self[1]
        self[1] = self.pop
        self.minheapfy(1)
        n
    end
end

costs = [0]
edges = Heap.new
edges[0] = nil
edges.insert_many(graph[0])

loop do
    minimum_ed = nil
    loop{
        break unless minimum_ed = edges.extract
        break unless costs[minimum_ed[0]]
    }

    if minimum_ed then
        costs[minimum_ed[0]] = minimum_ed[1]
        edges.insert_many(graph[minimum_ed[0]].map{|edge| [edge[0], edge[1] + minimum_ed[1]] })
    else
        break
    end
end

puts costs.map.with_index{|cost, id| "#{id} #{cost}"}.join("\n")