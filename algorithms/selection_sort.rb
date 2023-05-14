def selection_sort(array)
  (0...array.size).each do |i|
    (i+1...array.size).each do |j|
      if array[i] > array[j]
        temp = array[i]
        array[i] = array[j]
        array[j] = temp
      end
    end
  end
  array
end

p selection_sort([5, 4, 1, 2, 1])