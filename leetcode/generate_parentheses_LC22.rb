# https://leetcode.com/problems/generate-parentheses/description/

# Approach

# This can be resolves using recursion and this is classic recursion problem
# The number of parenthesis pair is given. 1 pair = (), 2 pair = ()()
# So in one pair the number of open_brackets will be one and closed_brackets will be one.
# If number of pair is 2 then total brackets will be 4 and from that number of open_brackets will be 2 and number of closed_brackets will be 2
# Generally, in recursion problems we need to find the base case and need to make a function call with reduced value of input.
# Lets take example of 2 pairs. Which mean n=2 and total 4 brackets and 2 open_brackets and 2 closed_brackets
# So in this case, we have four places to fill: _ _ _ _
# In the first place, we can only have open_bracket => "(" and that is obvious.
# If we start our function with that statement, then now we left with 1 open_bracnket and 2 closed_brackets
# So we can still use 1 open bracket and add that to string. So after using the first open bracket our string was looking like this: str = "(". After adding 2nd bracket, it will look like this: str = "((".
# Now, we ran out of open bracket and we have only 2 closed brackets. So we will start using that and append that to string above.
# After using first close bracket the string will look like this: "(()".
# After using the 2nd close bracket the string will look like this: "(()))"
# Now, we ran out of all the brackets. so open bracket count is 0 and close bracket count is 0. So once this happens, we will get the result and we will append that string to and resultant array. So we will add this string: "(()))" to array.

# So the final algorithm will look like below

# 1. Start function call with initial string "(" and reduce, open_bracket count to n-1 and close bracket count will be n and str value will be "("
# 2. If open_bracket count == 0 and close_bracket == 0 we will get the resultant string. So push that string to array and return the array.
# 3. if open_bracket count is 0 then use close_bracket and add that after the string and reduce the value of close_bracket by one.
# 4. if close_bracket count is 0 then use open_bracket and add that after the string and reduce the value of open_bracket by one.
# 5. If open_bracket count == close_bracket count which mean the parenthesis are balanced and we need to use open_bracket to append to string. for example: "(())".
# 6. if we have both open_bracket and close_bracket then we can add open_bracket to the string and we can also add close bracket to the string and then make function call with reduced value of open_bracket and close_bracket.

# We should get the result after these 6 steps.

# Here, n is number of pairs
def generate_parenthesis(n)
  @result  = []
  generate(n-1, n, "(") # started by filling first place using open bracket
  @result
end

def generate(open_count, close_count, str)
  if open_count == 0 && close_count == 0
    @result << str
    return @result
  end

  if open_count == 0
    str = "#{str})" # we used one closed bracket
    generate(open_count, close_count-1, str)
  elsif close_count == 0
    str = "#{str}(" # we used one open bracket
    generate(open_count-1, close_count, str)
  elsif open_count == close_count # Balanced parenthesis "(())"
    str = "#{str}(" # we used one open bracket
    generate(open_count-1, close_count, str)
  else
    str1 = "#{str}("
    str2 = "#{str})"
    generate(open_count-1, close_count, str1)
    generate(open_count, close_count-1, str2)
  end
end