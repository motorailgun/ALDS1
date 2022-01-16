n = gets.to_i
heap = gets.split.map(&:to_i).unshift(nil)

heap[1..n].each.with_index(1){|key, idx|
    parent = idx / 2
    left, right = idx * 2, idx * 2 + 1

    print "node #{idx}: key = #{key}, "
    print "parent key = #{heap[parent]}, " if heap[parent]
    print "left key = #{heap[left]}, " if heap[left]
    print "right key = #{heap[right]}, " if heap[right]
    puts ""
}
