require "pry"

def str_str(haystack, needle)
  return -1 if haystack.nil? || needle.nil?
  h_len = haystack.length
  n_len = needle.length
  return -1 if h_len < n_len
  j = 0
  k = 0

  (0...h_len).each do |i|
    k = i
    j = 0
    while j < n_len && needle[j] == haystack[k]
      j += 1
      k += 1
    end
    if j == n_len
      return i
    end
  end
  return -1
end

# Little bit improved solution by keeping track of match_found_at pointer
def str_str1(haystack, needle)
  return -1 if haystack.nil? || needle.nil?
  h = haystack.length
  n = needle.length
  return -1 if h < n

  i=0
  j=0
  match_found_at = 0
  while i < haystack.length
    if haystack[i] == needle[j]
      match_found_at = i if j == 0
      i+=1
      j+=1
    else
      match_found_at = match_found_at+1
      j=0
      i=match_found_at
    end
    return match_found_at if j == n
  end
  return -1
end

puts str_str('leetcode', 'leeto')

