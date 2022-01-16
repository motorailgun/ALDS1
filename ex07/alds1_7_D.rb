@n = gets.to_i
@preo = gets.split.map(&:to_i)
@ino = gets.split.map(&:to_i)

root = @preo[0]
@tree = Array.new(@n){[nil,[]]}

@buf = ""

def reconst(parent, lb, rb)
    c = @preo.shift
    left, right = nil, nil
    if lb == rb then
        true
    elsif(ind = @ino.index(c)) == lb then
        right = reconst(c, ind + 1, rb)
    elsif ind == rb then
        left = reconst(c, lb, ind - 1)
    else
        left = reconst(c, lb, ind - 1)
        right = reconst(c, ind + 1, rb)
    end
    @tree[c] = [parent, [left, right]]
    c
end

def poso(tr, s)
    poso(tr, tr[s][1][0]) if tr[s][1][0]
    poso(tr, tr[s][1][1]) if tr[s][1][1]
    @buf += s.to_s + " "
end

reconst(-1, 0, @n - 1)

poso(@tree, root)

puts @buf.chop