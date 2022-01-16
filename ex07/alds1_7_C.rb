n = gets.to_i
tree = Array.new(n){[]}

n.times{
    id, left, right = gets.split.map(&:to_i)
    tree[id][0] = left
    tree[id][1] = right
    tree[left][2] = id if left != -1
    tree[right][2] = id if right != -1
}

def preo(tr, s)
    print " ", s
    preo(tr, tr[s][0]) if tr[s][0] > -1
    preo(tr, tr[s][1]) if tr[s][1] > -1
end

def ino(tr, s)
    ino(tr, tr[s][0]) if tr[s][0] > -1
    print " ", s
    ino(tr, tr[s][1]) if tr[s][1] > -1
end

def poso(tr, s)
    poso(tr, tr[s][0]) if tr[s][0] > -1
    poso(tr, tr[s][1]) if tr[s][1] > -1
    print " ", s
end

def getroot(tree)
    root_id = tree[0][2]
    return 0 unless root_id
    while tree[root_id][2] do
        root_id = tree[root_id][2]
    end
    root_id
end

root = getroot(tree)

puts "Preorder"
preo(tree, root)
puts "\nInorder"
ino(tree, root)
puts "\nPostorder"
poso(tree, root)
puts ""