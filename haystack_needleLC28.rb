require "pry"

def str_str(haystack, needle)
  return -1 if haystack.nil? || needle.nil?

  h = haystack.length
  n = needle.length
  return -1 if h < n

  j=0
  k=0

  (0...h).each do |i|
    j = 0
    k = i
    while j < n && haystack[k] == needle[j]
      j += 1
      k += 1
    end

    return i if j == n
  end
  -1
end

puts str_str('xyzsad', 'sad')
