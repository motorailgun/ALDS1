@count = 0
n = gets.to_i
ar = $stdin.read.split("\n").map(&:to_i)
def isort(array, width)
    for i in width..(array.length - 1) do
        current = array[i]
        lower = i - width
        while lower >= 0 && array[lower] > current do
            array[lower + width] = array[lower]
            lower -= width
            @count += 1
        end
        array[lower + width] = current
    end
    array
end

def ssort(array)
    puts(m = Math.log(array.length, 3).to_i + 1)
    g = Array.new
    m.times{|i|
        g.unshift((3 ** i  - 1) / 2 + 1)
    }
    puts g.join(" ")
    g.each{|k|
        array = isort(array, k)
    }
    puts @count
    puts array.join("\n")
end

ssort(ar)