require 'pry-byebug'

# Compare first and last character if same then reduce the size of the string and compare first and last character again.
def is_pelindrome?(str)
  if str.length <= 1
    true
  else
    if str[0] == str[-1]
      is_pelindrome?(str[1..-2])
    else
       false
    end
  end
end

puts is_pelindrome?('cabbac')