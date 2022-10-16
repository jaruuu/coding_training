require 'pry'
require 'benchmark'

def answer(str)
  str = str.downcase
  length = str.length
  true_length = str.length - str.count(' ')

  if true_length < 3
    puts('False')
    return
  end

  letters = {}
  str.chars.each do |char|
    next if char == ' '

    letters[char] ||= 0
    letters[char] += 1
  end

  odd_count = 0
  letters.each do |letter, count|
    odd_count =+ 1 if count.odd?
    if odd_count >= 2
      puts('False')
      return
    end
  end
  puts('True')
end

def answer_i(str)
  str = str.downcase
  length = str.length
  true_length = str.length - str.count(' ')

  if true_length < 3
    puts('False')
    return
  end

  letters = {}
  str.chars.each do |char|
    next if char == ' '

    letters[char] ||= false
    letters[char] = !letters[char]
  end

  odd_count = 0
  letters.each do |letter, boolean|
    odd_count =+ 1 unless boolean
    if odd_count >= 2
      puts('False')
      return
    end
  end
  puts('True')
end

# sample
# 入力 Tact Coa
# 出力 True(順列: "taco cat", "atco cta", 等)

str = "Tact Coa" * 10000
result = Benchmark.realtime do
  answer(str)
end
puts("#{result} s")

result = Benchmark.realtime do
  answer_i(str)
end
puts("#{result} s")
