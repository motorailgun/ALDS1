def part(array)
    thr = array.pop
    current_pos = -1
    array.length.times{|i|
        if array[i] <= thr then
            current_pos += 1
            tmp = array[current_pos]
            array[current_pos] = array[i]
            array[i] = tmp
        end
    }
    puts array[0..current_pos].push("[#{thr}]").concat(array[(current_pos + 2)..(array.length - 1)]).push(array[current_pos + 1]).join(" ")
end

gets
part(gets.split.map(&:to_i))