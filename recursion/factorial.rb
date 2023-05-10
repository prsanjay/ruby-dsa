def factorial(n)
  if n == 0 || n == 1  # Base case
    return 1
  else
    n * factorial(n-1) # Reducing input by one
  end
end

puts factorial(5)