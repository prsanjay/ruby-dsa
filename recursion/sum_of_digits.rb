require 'pry-byebug'

# Recursive
def sum_of_digits(number)
  if number < 10
    return number
  else
    number%10 + sum_of_digits(number/10)
  end
end

#puts sum_of_digits(1234)

def iterative_sum_of_digits(num)
  sum = 0
  while num > 0
    sum += num%10
    num = num/10
  end
  return sum
end

puts iterative_sum_of_digits(1234)