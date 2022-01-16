n = gets.to_i
@keys = gets.split.map(&:to_f)
@dumkeys = gets.split.map(&:to_f)

tmp = 0
@keys_folded = @keys.map{|v| tmp += v}.unshift(0.0)
@keys.unshift(nil)

tmp = 0
@dumkeys_folded = @dumkeys.map{|v| tmp += v}

@memo_mut = Array.new(n + 1){Array.new(n + 1)}

def calc_cost(depth, left_bound, right_bound)
    if !(tmp = @memo_mut[left_bound][right_bound]) then
        @memo_mut[left_bound][right_bound] = tmp = calc_partialtree_count(1, left_bound, right_bound)  
    end
    return tmp + (depth - 1) * (@keys_folded[right_bound] - @keys_folded[left_bound - 1] + @dumkeys_folded[right_bound] - (@dumkeys_folded[left_bound - 2] || 0))
end

def calc_partialtree_count(depth, left_bound, right_bound)
    if tmp = @memo_mut[left_bound][right_bound] then
        return tmp + (depth - 1) * (@keys_folded[right_bound] - @keys_folded[left_bound - 1] + @dumkeys_folded[right_bound] - (@dumkeys_folded[left_bound - 2] || 0))
    elsif left_bound == right_bound then
        return depth * @keys[left_bound] + (depth + 1) * (@dumkeys[left_bound - 1] + @dumkeys[left_bound])
    elsif right_bound - left_bound == 1 then
        left_dum = depth * @keys[left_bound] + (depth + 1) * @dumkeys[left_bound - 1] + calc_partialtree_count(depth + 1, right_bound, right_bound)
        right_dum = depth * @keys[right_bound] + (depth + 1) * @dumkeys[right_bound] + calc_partialtree_count(depth + 1, left_bound, left_bound)
        return [left_dum, right_dum].min
    else
        min = nil
        @keys[(left_bound + 1)..(right_bound - 1)].each.with_index(left_bound + 1){|val, chaku|
            tmp = depth * val + calc_partialtree_count(depth + 1, left_bound, chaku - 1) + calc_partialtree_count(depth + 1, chaku + 1, right_bound)
            if !min || min > tmp then
                min = tmp
            end
        }
        ls = depth * @keys[left_bound] + (depth + 1) * @dumkeys[left_bound - 1] + calc_partialtree_count(depth + 1, left_bound + 1, right_bound)
        rs = depth * @keys[right_bound] + (depth + 1) * @dumkeys[right_bound] + calc_partialtree_count(depth + 1, left_bound, right_bound - 1)
        return [min, ls, rs].min
    end
end


puts calc_cost(1, 1, n)