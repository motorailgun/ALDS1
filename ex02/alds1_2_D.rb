n = gets.to_i
ar = $stdin.read.split("\n").map(&:to_i)
@cnt = 0

def isort(a, n, g)
    for i in g..(n-1) do
        v = a[i]
        j = i - g
        while j >= 0 && a[j] > v do
            a[j+g] = a[j]
            j = j - g
            @cnt += 1
        end
        a[j+g] = v
    end
    return a
end

def ssort(a, n)
    @cnt = 0
    puts(m = Math.log(n, 3))
    g = Array.new
    i = 0
    loop{
        i += 1
        g.push(n/3 + 1)
        n = n / 3 + 1
        break if n == 1
    }
    puts g.join(" ")
    puts 1
    
    for i in 0..(m-1) do
        a = isort(a, n, g[i])
    end
    return a
end

puts ssort(ar, n).join("\n")