require 'pry'
require 'benchmark'
require 'securerandom'

def answer_b(str)
  chars = str.chars
  for idx in 0..(chars.length) do
    if chars[idx+1..].to_a.include?(chars[idx])
      puts("#{chars[idx]} is duplicated")
      return
    end
  end

  puts("All char is unique")
end

def answer_i(str)
  chars = str.chars
  if str.chars.length == str.chars.uniq.length
    puts("All char is unique")
  else
    puts("Some chars is duplicated")
  end
end

def answer_ii(str)
  chars = str.chars
  for idx in 0..(chars.length) do
    break if chars[idx+1].nil?

    if chars[idx].eql?(chars[idx+1])
      puts("#{chars[idx]} is duplicated")
      return
    end
  end
  puts("All char is unique")
end

# sample
# eklsowkdmome
# EklsOwKdmoMe
# E*@kls#%OwK:W./dmoMe

# sample = 'EkSowkDMome'
# sample = 'E*@kls#%OwK:W./dmoMe'
sample = SecureRandom.alphanumeric(10000)

result = Benchmark.realtime do
  answer_b(sample)
  # answer_i(sample)
  # answer_ii(sample)
end
puts("#{result}s")

result = Benchmark.realtime do
  answer_i(sample)
end
puts("#{result}s")

result = Benchmark.realtime do
  answer_ii(sample)
end
puts("#{result}s")
