require 'pry'

MATCH = {
  '(' => ')',
  '{' => '}',
  '[' => ']'
}
def is_valid(s)
    return false if s.empty?

  stack = []
  s.each_char do |i|
      if i == '(' || i == '[' || i == '{'
          stack.push(i)
      elsif i == ')' || i == ']' || i == '}'
          x = stack.pop
          return false if MATCH[x] != i
      end
  end
  stack.empty?
end

puts is_valid("[])")