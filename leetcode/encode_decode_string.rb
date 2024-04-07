class Solution
  # Encodes a list of strings to a single string.
  def encode(strs)
    # strs is array if words and we need to convert that array of words to the encodedstring
    # such that when we get that encoded string as input we should be able to decode that
    # back to aray of words.
    # for example strs = ["hello", "world"]
    # encoded_string = 5#hello5#world
    # This should be the output of this method.
    # the return type should be string.
    output = ""
    strs.each do |s|
      output += "#{s.length}##{s}"
    end
    output
  end

  # Decodes a single string to a list of strings.
  def decode(str)
    # encoded_string = 100000#hellow5#world
    output = []
    i = 0
    while i < str.length
      j = i
      # The length can have more than one digit so first we need to reach to the "#" delimiter
      while str[j] != "#"
        j += 1
      end
      length = j - i
      result = str[j + 1, length]
      output.push(result)
      i = j + length + 1
    end
    output
  end
end
