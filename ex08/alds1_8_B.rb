n = gets.to_i
tree = Array.new(n){[nil, nil, [nil, nil]]}
head = 0

def preo(tr, s)
    print " ", tr[s][1]
    preo(tr, tr[s][2][0]) if tr[s][2][0]
    preo(tr, tr[s][2][1]) if tr[s][2][1]
end

def ino(tr, s)
    ino(tr, tr[s][2][0]) if tr[s][2][0]
    print " ", tr[s][1]
    ino(tr, tr[s][2][1]) if tr[s][2][1]
end

n.times{
    ope, val = gets.split
    val = val.to_i

    if ope == "insert" then
        if head == 0 then
            tree[head][1] = val
            head += 1
        else
            current = 0
            prev = 0
            while current != nil do
                prev = current
                if tree[current][1] > val then
                    current = tree[current][2][0]
                else
                    current = tree[current][2][1]
                end
            end
            if tree[prev][1] > val then
                tree[prev][2][0] = head
            else
                tree[prev][2][1] = head
            end
            tree[head][0] = prev
            tree[head][1] = val
            head += 1
        end
    elsif ope == "find" then
        current = 0
        loop do
            if !current then
                puts "no"
                break
            elsif tree[current][1] == val then
                puts "yes"
                break
            elsif tree[current][1] > val then
                current = tree[current][2][0]
            else
                current = tree[current][2][1]
            end
        end
    else
        ino(tree, 0)
        puts ""
        preo(tree, 0)
        puts ""
    end
}