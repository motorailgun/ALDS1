stack = Array.new
gets.split.each{|f|
    if ['+', '-', '*'].any?{|p| p == f} then
        a = stack.pop
        b = stack.pop
        stack.push(eval(b + f + a).to_s)
    else
        stack.push(f)
    end
}

puts stack[0]