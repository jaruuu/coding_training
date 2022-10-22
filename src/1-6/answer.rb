require 'pry'
require 'benchmark'
require 'securerandom'

def answer(str)
  results = {}
  count = -1
  for i in 0..str.length
    if str[i] == str[i + 1]
      count += 1
      next
    elsif str[i] != str[i + 1]
      results[str[i]] = count
      count = -1
    end
  end

  if results.values.sum > 0
    puts results.map{|key, value| [key, value + 2]}.join
  else
    puts str
  end
end

# sample
# aaabbccddd -> a3b2c2d3
# aaaAbccDdd ->
# 文字列の連続数、1 -> +1, 2 -> 0, 3 -> -1, 4 -> -2 ..
# aaa, 3, -1
# bb, 2, 0
# cc, 2, 0
# ddd, 3, -1


# str = 'aaabbccddd'
# str = 'aaaAbccDdd'
# str = SecureRandom.alphanumeric(10000)
# str = 'a' * 1 + 'A' * 1 + 'b' * 1 + 'B' * 1 + 'C' * 10000
# str = 'a' * 1 + 'A' * 1 + 'b' * 1 + 'B' * 1 + 'C' * 10000

str = ''
alphabets = ('a'..'z').to_a.join
chars = (alphabets.downcase << alphabets.upcase).split('')

for char in chars
  str << char * rand(1..1000)
end


result = Benchmark.realtime do
  answer(str)
end
puts("#{result} s")
