class XY
    attr_accessor :x, :y
    def initalize
        @x = 0
        @y = 0
    end
end

def pts(p)
    printf("%.8f %.8f\n", p.x, p.y)
end

def cogh(p1, p2, depth)
    res = XY.new
    if depth > 0 then
        s, t = XY.new, XY.new
        s.x = (p1.x * 2 + p2.x) / 3.0
        s.y = (p1.y * 2 + p2.y) / 3.0
        t.x = (p1.x + p2.x * 2) / 3.0
        t.y = (p1.y + p2.y * 2) / 3.0
        res.x = (t.x - s.x) * Math.cos(Math::PI / 3.0) - (t.y - s.y) * Math.sin(Math::PI / 3.0) + s.x
        res.y = (t.x - s.x) * Math.sin(Math::PI / 3.0) + (t.y - s.y) * Math.cos(Math::PI / 3.0) + s.y

        cogh(p1, s, depth - 1)
        pts(s)
        cogh(s, res, depth - 1)
        pts(res)
        cogh(res, t, depth - 1)
        pts(t)
        cogh(t, p2, depth - 1)
    end
end

s = XY.new
t = XY.new
s.x, s.y, t.x, t.y = 0, 0, 100, 0

puts "0.00000000 0.00000000"
cogh(s, t, gets.to_i)
puts "100.00000000 0.00000000"