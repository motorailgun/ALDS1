n = gets.to_i
@graph = Array.new
n.times{
    ori, num, *dest = gets.split.map(&:to_i)
    @graph[ori] = dest
}

@visited = Array.new(n + 1){Array.new(2){nil}}
@count = 1

def dfs(start_v)
    return if @visited[start_v][0]
    if @graph[start_v].all?{|v| @visited[v][0] || v == start_v} then
        if !@visited[start_v][0] then
            @visited[start_v][0] = @count
            @visited[start_v][1] = @count += 1
        else
            @visited[start_v][1] = @count
        end
        @count += 1
    else
        if !@visited[start_v][0] then
            @visited[start_v][0] = @count
            @count += 1
        end
        @graph[start_v].each{|vertex| dfs(vertex) }
        @visited[start_v][1] = @count
        @count += 1
    end
end

n.times{|a| dfs(a + 1) }

@visited[1..(@visited.length - 1)].each.with_index(1){|li, idx|
    puts(idx.to_s + " " + li.join(" "))
}