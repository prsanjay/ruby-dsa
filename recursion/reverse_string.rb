require 'pry-byebug'

# Iterative appraoch
def reverse_string(string)
  # string is:  sanjay
  # output is: yajnas

  result = ''
  (string.length-1).downto(0).each do |i|
    result = result + string[i]
  end
  result
end

#puts reverse_string('world')


# Recursive approach
# We decrease the length of the string by skipping the first character in each recursive call and kind of shifting first character to last using str[0]
def recursive_reverse_string(str)
  if str.length <= 1
    return str
  else
    return recursive_reverse_string(str[1..-1]) + str[0]
  end
end

puts recursive_reverse_string('hello')



