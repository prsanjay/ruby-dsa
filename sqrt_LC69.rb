require 'pry'

def my_sqrt(x)
  return 0 if x == 0

    min = 0
    max = x
    res = 0

    while min <= max
      mid = (max+min)/2
      if mid*mid > x
        max = mid-1
      elsif mid*mid < x
        min = mid+1
        res = mid
      else
        return mid
      end
    end
    res
end

puts my_sqrt(5)