require 'pry'
require 'benchmark'

def answer(str, length)
  puts str[0..length-1].gsub(' ', '%20').gsub('　', '%20')
end

# sample
# "John, Smith, Anna   ", 18

str = "John, Smith,　Anna   "
length = 17

result = Benchmark.realtime do
  answer(str,length)
end
puts("#{result} s")
