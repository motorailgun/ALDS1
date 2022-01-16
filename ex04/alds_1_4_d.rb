n, k = gets.split.map(&:to_i)
ar = $stdin.read.split("\n").map(&:to_i)

min = ar.max
max = ar.reduce(0, &:+)
res = [ar.reduce(0, &:+) / k, min].max
last_res = 0

def cts(res, ar)
    ct = 0
    added = 0
    lst = ar.length - 1
    ar.each{|p|
        if p > res then
            return 10**7
        elsif added + p > res then
            added = p
            ct += 1
        else 
            added += p
        end
    }
    ct += 1
    ct
end

loop{
    ct = cts(res, ar)

    # p "### #{res}, #{ct}"
    # p "#### #{cts(res + 1, ar)}"

    if ct <= k && cts(res - 1, ar) > k then
        puts res
        break
    elsif ct > k && cts(res + 1, ar) < k then
        puts res + 1
        break
    end
    if ct <= k then # 積み過ぎなので閾値を下げて分散させる
        tmp_res = (res + min) / 2
        last_res = res
        max = [max, res].min
        res = tmp_res
    elsif ct > k then # 積まなすぎなので閾値を上げて集約させる
        tmp_res = (res + max) / 2
        last_res = res
        min = [min, res].max
        res = tmp_res
    end
}