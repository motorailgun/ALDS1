n = gets.to_i
memo_mut = Array.new(1001){Array.new(1001){0}}
n.times do
    q1 = gets.chomp.split("")
    q2 = gets.chomp.split("")

    q1.each.with_index(1){|c1, idx_1|
        q2.each.with_index(1){|c2, idx_2|
            if c1 == c2 then
                memo_mut[idx_1][idx_2] = memo_mut[idx_1 - 1][idx_2 - 1] + 1
            else
                memo_mut[idx_1][idx_2] = (tmp1 = memo_mut[idx_1][idx_2 - 1]) > (tmp2 = memo_mut[idx_1 - 1][idx_2]) ? tmp1 : tmp2
            end
        }
    }
    puts memo_mut[q1.length][q2.length]
end