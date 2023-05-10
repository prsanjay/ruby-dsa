# Find nth term of fibonacci series
# nth terms in fibonacci series is sum of previous two terms
# For example, 5th term will be sum of 4th term + 3rd term
def fibonacci(n)
  if n <= 1
    return n # if n == 1 or n == 0
  else
    fibonacci(n-1) + fibonacci(n-2)
  end
end

puts fibonacci(6)


# In fibonacci series same function call is being made for same value of n
# for example, fib(n-2) may already have calculated the value for Nth term so that can be utilized for other function calls
# It will make more sense if you will trace the tree of recursive calls
# This way time complexity will become O(N) instead 2^n
@map = {}
def optimized_fibonacci(n)
  if n <= 1
    @map[n] = n
    return n # if n == 1 or n == 0
  else
    if @map[n-1].nil?
      @map[n-1] = fibonacci(n-1)
    end
    if @map[n-2].nil?
      @map[n-2] = fibonacci(n-2)
    end
    @map[n-1] + @map[n-2]
  end
end

puts optimized_fibonacci(6)