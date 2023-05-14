require 'pry-byebug'

# def merge_sort(m)
#   binding.pry
#   return m if m.length <= 1

#   middle = m.length / 2
#   left = merge_sort(m[0...middle])
#   right = merge_sort(m[middle..-1])
#   merge(left, right)
# end

# def merge(left, right)
#   binding.pry
#   result = []
#   until left.empty? || right.empty?
#     result << (left.first<=right.first ? left.shift : right.shift)
#   end
#   result + left + right
# end

#p merge_sort([4, 3, 2, 1])



a = [2, 5, 8, 12, 3, 6, 7, 10, 13]

ac=[]

i=0
mid=a.size/2
j=mid


while(i<mid && j<a.size)
  if a[i] > a[j]
    ac << a[j]
    j=j+1
  else
    ac << a[i]
    i=i+1
  end
end
binding.pry
(i...mid).each do |l|
  ac << a[l]
end
binding.pry
(j...a.size).each do |l|
  ac << a[l]
end
p ac

