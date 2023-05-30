require 'pry-byebug'

# we are following approach of taking the element and skipping the element
# Line-11 is taking the element and then passing the remaining elements.
# Line-12 is skipping the element and then passing the remaining elements.
def subsets(unprocessed, processed)
  if unprocessed.empty?
    result = []
    result << processed
    result
  else
    first = unprocessed[0]
    left = subsets(unprocessed[1..], [first]+processed)
    right = subsets(unprocessed[1..], processed)
    right+left
  end
end

p subsets([1,2,3], [])
