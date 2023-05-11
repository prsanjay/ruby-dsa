def sum(numbers)
  if numbers.empty?
    return 0
  else
    numbers[0] + sum(numbers[1..-1])
  end
end

puts sum([1,2,3,4])