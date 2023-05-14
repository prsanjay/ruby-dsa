require 'pry'

def insertion_sort(a)
  (1...a.size).each do |i|
    val = a[i]
    j = i-1
    while(j >= 0 && a[j] > val)
      a[j+1] = a[j]
      j = j-1
    end
    a[j+1] = val
    p "After #{i} pass: Array is #{a}"
  end
  a
end

 p insertion_sort([4, 3, 2, 1])