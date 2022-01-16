n = gets.to_i
tree = Array.new(n){[nil, Array.new]}

n.times do
    in_a = gets.split.map(&:to_i)
    id, k = in_a[0..1]
    tree[id][1] = in_a[2..([k+1, 2].max)]
    tree[id][1].each{|i| tree[i][0] = id}
end

tree.each_with_index{|node, index|
    parent = node[0] || -1
    depth_count = 0
    parent_id = parent
    if parent_id != -1 then
        while parent_id do
            parent_id = tree[parent_id][0]
            depth_count += 1
        end
    end

    puts "node #{index}: parent = #{parent}, depth = #{depth_count}, #{parent == -1 ? 'root' : node[1].empty? ? 'leaf' : 'internal node'}, [#{node[1].join(', ')}]"
}