require 'pry'
require 'benchmark'
require 'securerandom'

def answer_b(str1, str2)
  if str1.chars.sort.join == str2.chars.sort.join
    puts 'True'
  else
    puts 'False'
  end
end

def answer_i(str1, str2)
  if str1.length != str2.length
    puts 'False'
  elsif str1.chars.sort.join == str2.chars.sort.join
    puts 'True'
  else
    puts 'False'
  end
end

def answer_ii(str1, str2)
  if str1.length != str2.length
    puts 'False'
    return
  else
    letters = {}
    str1.chars.each do |char|
      letters[char] ||= 0
      letters[char] += 1
    end

    str2.chars.each do |char|
      letters[char] ||= 0
      letters[char] -= 1
      if letters[char] < 0
        puts 'False'
        return
      end
    end
  end
  puts 'True'
end

def answer_iii(str1, str2)
  if str1.length != str2.length
    puts 'False'
    return
  else
    letters = {}
    for i in 0..(str1.length) do
      letters[str1[i]] ||= 0
      letters[str1[i]] += 1
    end

    for i in 0..(str2.length) do
      letters[str2[i]] ||= 0
      letters[str2[i]] -= 1
      if letters[str2[i]] < 0
        puts 'False'
        return
      end
    end
  end
  puts 'True'
end

# sample
# sawdvets, sqevdets
# elmvlmedled, meledmdlelv

str1 = "deabc1" * 10000
str2 = "eacb d1" * 10000
# str1 = SecureRandom.alphanumeric(60000)
# str2 = SecureRandom.alphanumeric(60000)
# str1 = SecureRandom.alphanumeric(50000)
# str2 = SecureRandom.alphanumeric(60000)

result = Benchmark.realtime do
  answer_b(str1, str2)
end
puts("#{result} s")

result = Benchmark.realtime do
  answer_i(str1, str2)
end
puts("#{result} s")

result = Benchmark.realtime do
  answer_ii(str1, str2)
end
puts("#{result} s")

result = Benchmark.realtime do
  answer_iii(str1, str2)
end
puts("#{result} s")
