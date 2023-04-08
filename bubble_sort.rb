def bubble_sort(array)
  is_sorted = false
  while (is_sorted == false)
    is_sorted = true
    (1...array.size).each do |i|
      if array[i-1] > array[i]
        is_sorted = false
        temp = array[i - 1]
        array[i-1] = array[i]
        array[i] = temp
        puts "Array is now #{array}"
      end
    end
  end
end

bubble_sort([4, 3, 2, 1])
