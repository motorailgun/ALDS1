n = gets.to_i
graph = Array.new(n){ gets.split.map.with_index(1){|cost, point|
    if cost.to_i == -1 then
        nil
    else
        [point.to_i, cost.to_i]
    end}.compact.sort_by{|ed| ed[0]}
}.unshift(nil)

mst = Array.new(n + 1){Array.new}
visited = [nil, true]

cost_sum = 0

loop do
    minimum = 20000
    minimum_ed = nil
    visited.each_with_index{|v_visited, v|
        next unless v_visited

        graph[v].each{|edge|
            if !visited[edge[0]] && minimum > edge[1] then
                minimum = edge[1]
                minimum_ed = [v, edge]
            end
        }
    }

    if minimum_ed then
        mst[minimum_ed[0]].push(minimum_ed[1])
        visited[minimum_ed[1][0]] = true
        cost_sum += minimum_ed[1][1]
    else
        break
    end
end

puts cost_sum