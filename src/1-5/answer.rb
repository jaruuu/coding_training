require 'pry'
require 'benchmark'

def answer(str1, str2)
  if (str2.length - str1.length).abs >= 2
    puts 'False'
    return
  elsif str1.length > str2.length
    for i in 0..(str1.length - 1) do
      counter = 0
      counter += 1 if str1[i] == str2[i]
      if counter >= 2
        puts 'False'
        return
      end
    end
  elsif str1.length < str2.length
    for i in 0..(str2.length - 1) do
      counter = 0
      counter += 1 if str1[i] == str2[i]
      if counter >= 2
        puts 'False'
        return
      end
    end
  else str1.length == str2.length
    for i in 0..(str1.length - 1) do
      counter = 0
      counter += 1 if str1[i] == str2[i]
      if counter >= 2
        puts 'False'
        return
      end
    end
  end
  puts ('True')
end

# sample
# pale, ple -> true
# pales, pale -> true
# pale, bale -> true
# pale, bake -> false

# 文字数 +-1 >2 false
# diff 1まで


str1, str2 = 'pale' * 10000, 'pale' * 10000 + 'b'

result = Benchmark.realtime do
  answer(str1, str2)
end
puts("#{result} s")
