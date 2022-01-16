n = gets.to_i
tree = Array.new(n){[-1, []]}

n.times{
    id, left, right = gets.split.map(&:to_i)
    tree[id][1] = [left, right]
    if left != -1 || right != -1 then
        tree[left][0] = id
        tree[right][0] = id
    end
}

def dfsmodoki(tr, st)
    children = tr[st][1].select{|c| c != -1}
    # if tr[st][1].reduce(:+) == -2 then
    if children.length == 0 then
        return 0
    else
        return 1 + children.map{|child| dfsmodoki(tr, child)}.max
    end
end


tree.each_with_index{|node, index|
    height = dfsmodoki(tree, index)
    depth = 0

    parent = node[0]
    while parent != -1 do
        depth += 1
        parent = tree[parent][0]
    end

    sibling = node[0] == -1 ? -1 : tree[node[0]][1].reject{|p| p == index}[0]
    degree = node[1].select{|e| e != -1}.length

    if depth == 0 then
        mode = "root"
    elsif height == 0 then
        mode = "leaf"
    else
        mode = "internal node"
    end
    puts "node #{index}: parent = #{node[0]}, sibling = #{sibling}, degree = #{degree}, depth = #{depth}, height = #{height}, #{mode}"
}