require 'pry-byebug'

# Here we are following processed string and un-processed string approach.
# For string "aabc" initially, we will take char "a" which we call processed
# and remaining string "abc" will be called as un-processed.
# We will continue the recursion call till we scan whole string and unprocessed becomes empty.

# skip given character from the string and return the new string
def skip_character(char, string, processed)
  if string.empty?
    return processed
  else
    first_char = string[0]
    if first_char != char
      processed = processed + first_char
    end
    skip_character(char, string[1..], processed)
  end
end


#p skip_character("b", "aaabacca", "")



# skip given string from the string and return the new string
def skip_string(skip_string, string, processed)
  if string.empty?
    return processed
  else
    if string.start_with?(skip_string)
      skip_string(skip_string, string[skip_string.size..], processed)
    else
      processed = processed + string[0]
      skip_string(skip_string, string[1..], processed)
    end
  end
end

p skip_string("aa", "aaabacca", "")