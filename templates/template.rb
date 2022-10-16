require 'pry'
require 'benchmark'

def answer
end

# sample

result = Benchmark.realtime do
  answer
end
puts("#{result} s")
