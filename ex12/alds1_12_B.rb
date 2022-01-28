n = gets.to_i
graph = Array.new(n){
    id, num, *point_and_cost = gets.split.map(&:to_i)
    (1..num).to_a.map{|s| point_and_cost[2 * (s - 1), 2]} # [dest, cost]
}

costs = [0]
visited = [0]

loop do
    minimum = 1000000
    minimum_ed = nil
    visited.each{|v|
        graph[v].each{|edge|
            if !costs[edge[0]] && minimum > edge[1] then
                minimum = edge[1]
                minimum_ed = edge
            end
        }
    }

    if minimum_ed then
        visited.push(minimum_ed[0])
        costs[minimum_ed[0]] = minimum_ed[1]
        graph[minimum_ed[0]].map!{|edge| [edge[0], edge[1] + minimum_ed[1]] }
    else
        break
    end
end

puts costs.map.with_index{|cost, id| "#{id} #{cost}"}.join("\n")