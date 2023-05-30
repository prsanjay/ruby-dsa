# We are following approach of processed and unprocessed.
# But in this problem we do not skip any element for getting the answer but we need to find the number of positions where the next element can sit.
# The loop is used to find the all possible positions for the next element which can sit in the processed items.
# Lets say processed is [1] and next element is 2 then 2 can sit before 1 and after 1
# So loop will start from 0 and run till 1. So there are two positions where 2 can sit
# If processed list is [1,2] and next element is 3 then 3 can sit before 1, after 2 or between 1 and 2.

def permute(nums, processed=[], result=[])
  if nums.empty?
    result << processed
  else
    first = nums[0]
    (0..processed.size).each do |i|
      proce = processed[0...i] + [first] + processed[i..processed.size]
      permute(nums[1..], proce, result)
    end
  end
  result
end

p permute([1,2,3])