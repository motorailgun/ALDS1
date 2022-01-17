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
        @memo_mut[left_bound][right_bound] = tmp = calc_partialtree_count(left_bound, right_bound)  
    end
    return tmp + (depth - 1) * (@keys_folded[right_bound] - @keys_folded[left_bound - 1] + @dumkeys_folded[right_bound] - (left_bound - 2 >= 0 ? @dumkeys_folded[left_bound - 2] : 0))
end

def calc_partialtree_count(left_bound, right_bound)
    if left_bound == right_bound then
        return @keys[left_bound] + 2 * (@dumkeys[left_bound - 1] + @dumkeys[left_bound])
    elsif right_bound - left_bound == 1 then
        left_dum = @keys[left_bound] + 2 * @dumkeys[left_bound - 1] + calc_cost(2, right_bound, right_bound)
        right_dum = @keys[right_bound] + 2 * @dumkeys[right_bound] + calc_cost(2, left_bound, left_bound)
        return [left_dum, right_dum].min
    else
        min = nil
        @keys[(left_bound + 1)..(right_bound - 1)].each.with_index(left_bound + 1){|val, chaku|
            tmp = val + calc_cost(2, left_bound, chaku - 1) + calc_cost(2, chaku + 1, right_bound)
            if !min || min > tmp then
                min = tmp
            end
        }
        ls = @keys[left_bound] + 2 * @dumkeys[left_bound - 1] + calc_cost(2, left_bound + 1, right_bound)
        rs = @keys[right_bound] + 2 * @dumkeys[right_bound] + calc_cost(2, left_bound, right_bound - 1)
        return [min, ls, rs].min
    end
end


puts calc_cost(1, 1, n)