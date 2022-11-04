require 'pry'
require 'benchmark'

def answer(matrix)
  return false if matrix.length.zero? || matrix.length != matrix[0].length

  for layer in 0..(matrix.length/2)
    first = layer
    last = matrix.length - 1 - layer
    for i in first..last
      offset = i - first
      top = matrix[first][i]

      matrix[first][i] = matrix[last - offset][first] # 左 -> 上
      matrix[last - offset][first] = matrix[last][i] # 下 -> 左
      matrix[last][last - offset] = matrix[i][last] # 右 -> 下
      matrix[i][last] = top # 上 -> 右
    end
  end
  return true
end

# sample
# [｀
#   [1,  2,  3,  4],
#   [5,  6,  7,  8],
#   [9, 10, 11, 12],
#   [3, 14, 15, 16],
# ]

def sample(matrix = [], num)
  for i in 0..num-1
    matrix.append((0..num-1).to_a)
  end
  matrix
end

matrix = sample(1000)
result = Benchmark.realtime do
  answer(matrix)
end
puts("#{result} s")
