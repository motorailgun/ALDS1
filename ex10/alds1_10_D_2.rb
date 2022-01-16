keys_num = gets.to_i
@keys = gets.split.map(&:to_f).unshift(nil)
@dumkeys = gets.split.map(&:to_f)
@memo = Array.new(keys_num + 1){Array.new(keys_num + 1){Array.new(keys_num + 1){nil}}}

def calc_cost(depth, left_bound, right_bound)
    if tmp = @memo[depth][left_bound][right_bound] then
        return tmp
    elsif left_bound == right_bound then
        return @memo[depth][left_bound][right_bound] = depth * @keys[left_bound] + (depth + 1) * (@dumkeys[left_bound - 1] + @dumkeys[left_bound])
    elsif right_bound - left_bound == 1 then
        left_dum = depth * @keys[left_bound] + (depth + 1) * @dumkeys[left_bound - 1] + calc_cost(depth + 1, right_bound, right_bound)
        right_dum = depth * @keys[right_bound] + (depth + 1) * @dumkeys[right_bound] + calc_cost(depth + 1, left_bound, left_bound)
        return @memo[depth][left_bound][right_bound] = [left_dum, right_dum].min
    else
        min = nil
        @keys[(left_bound + 1)..(right_bound - 1)].each.with_index(left_bound + 1){|val, chaku|
            tmp = depth * val + calc_cost(depth + 1, left_bound, chaku - 1) + calc_cost(depth + 1, chaku + 1, right_bound)
            if !min || min > tmp then
                min = tmp
            end
        }
        ls = depth * @keys[left_bound] + (depth + 1) * @dumkeys[left_bound - 1] + calc_cost(depth + 1, left_bound + 1, right_bound)
        rs = depth * @keys[right_bound] + (depth + 1) * @dumkeys[right_bound] + calc_cost(depth + 1, left_bound, right_bound - 1)
        return @memo[depth][left_bound][right_bound] = [min, ls, rs].min
    end
end

puts calc_cost(1, 1, keys_num)