def longest_common_prefix(strs)
  len = strs.size
  result = ""
  return result if len == 0

  first_string = strs[0]

  (0...first_string.length).each do |i|
    (1...len).each do |j|
      if strs[j][i] != first_string[i]
        return result
      end
    end
    result += first_string[i]
  end
  result
end

puts longest_common_prefix(['floq', 'flor', 'form'])