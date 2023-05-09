# Iterative
# Time complexity: O(m)
def power(n, m)
  return n if n.zero?

  result = 1

  while m > 0 && n > 1
    result *= n
    m -= 1
  end
  result
end

power(0, 5)

# Using recursion
# Time complexity: O(m) as it will make m number of calls.
def power_rec(n, m)
  if m == 0
    return 1
  else
    n * power_rec(n, m-1)
  end
end

power_rec(2, 3)


# Recursive approach with O(log(m)) time complexity
# Here approach is, if we multiply n with itself once and divide the m by 2 then the number of multiplications can be reduced to log(m)
# For example: 2^6 = (2^2)^3 = 4^3 = 64
# But if value of m is odd then first we need to extract out one factor from n and then need to reduce value of m by 1 to make that even and then need to divide (m-1) by 2
# For example: 2^5 = 2 * 2^4 = 2 * (2^2)^2 = 2 * 4^2 = 2 * 16 = 32

def power_rec_logm(n, m)
  if m == 0
    return 1
  elsif m.even?
    power_rec_logm(n*n, m/2)
  else
    n * power_rec_logm(n*n, m-1/2)
  end
end

puts power_rec_logm(2, 5)

















