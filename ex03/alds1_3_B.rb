n, q = gets.split.map(&:to_i)
jobs = Array.new(n){
    n = gets.split
    {:job => n[0], :time => n[1].to_i}
}
ended = Array.new

elapsed_time = 0
index = 0

while jobs.length > 0 do
    shifted = jobs[index].clone
    if shifted[:time] - q <= 0 then
        shifted[:time] += elapsed_time
        ended.push(shifted)
        elapsed_time += jobs.delete_at(index)[:time]
    else
        jobs[index][:time] -= q
        elapsed_time += q
        index += 1
    end
    index = 0 if index >= jobs.length
end


ended.each{|ha|
    puts "#{ha[:job]} #{ha[:time]}"
}