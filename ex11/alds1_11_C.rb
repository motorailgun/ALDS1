graph = Array.new(n = gets.to_i){
    tmp, tmp2, *tmp3 = gets.split.map(&:to_i)
    tmp3
}.unshift(nil)
dist = Array.new(n + 1){ nil }

queue = [1, nil]
d = 0

until queue.compact.empty? do
    v = queue.shift
    if v then
        next if dist[v]
        dist[v] = d
        queue.concat(graph[v])
    else
        queue.push(nil)
        d += 1
    end
end

dist[1..n].each.with_index(1){|num, v|
    print v, " ", num || -1, "\n"
}