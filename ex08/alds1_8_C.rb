n = gets.to_i
tree = Hash.new()
root = 0

def preo(tr, s)
    print " ", s
    preo(tr, tr[s][1][0]) if tr[s][1][0]
    preo(tr, tr[s][1][1]) if tr[s][1][1]
end

def ino(tr, s)
    ino(tr, tr[s][1][0]) if tr[s][1][0]
    print " ", s
    ino(tr, tr[s][1][1]) if tr[s][1][1]
end

n.times{
    ope, val = gets.split
    val = val.to_i

    case ope
    when "insert"
        if tree.length == 0 then
            root = val
            tree[val] = [nil, [nil, nil]]
        else
            current = root
            prev = nil
            while tree[current] do
                prev = current
                if current > val then
                    current = tree[current][1][0]
                else
                    current = tree[current][1][1]
                end
            end

            tree[val] = [nil, [nil, nil]]
            if prev > val then
                tree[prev][1][0] = val
                tree[val][0] = prev
            else
                tree[prev][1][1] = val
                tree[val][0] = prev
            end
        end
    when "find"
        current = root
        loop do
            if !current then
                puts "no"
                break
            elsif current == val then
                puts "yes"
                break
            elsif current > val then
                current = tree[current][1][0]
            else
                current = tree[current][1][1]
            end
        end
    when "delete"
        case tree[val][1].compact.length
        when 0 
            if tree[val][0] > val then
                tree[tree[val][0]][1][0] = nil
            else
                tree[tree[val][0]][1][1] = nil
            end
        when 1
            if tree[val][0] > val then
                tree[tree[val][0]][1][0] = tree[val][1].compact[0]
            else
                tree[tree[val][0]][1][1] = tree[val][1].compact[0]
            end
            tree[tree[val][1].compact[0]][0] = tree[val][0]
        else
            current = tree[val][1][1]
            prev = 0
            while current do
                prev = current
                current = tree[current][1][0]
            end

            case tree[prev][1].compact.length
            when 0 
                tree[tree[prev][0]][1][0] = nil
            when 1
                tree[tree[prev][0]][1][0] = tree[prev][1].compact[0]
            end

            tree.delete(prev)
            tree[prev] = tree[val]
        end
        tree.delete(val)
    else
        ino(tree, root)
        puts ""
        preo(tree, root)
        puts ""
    end
    p tree
}