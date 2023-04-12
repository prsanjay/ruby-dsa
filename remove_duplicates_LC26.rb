require "pry"

def remove_duplicates(nums)
  left = 1
  (1...nums.size).each do |right|
    if nums[right] != nums[right-1]
      nums[left] = nums[right]
      left += 1
    end
  end
  left
end

remove_duplicates([0,0,1,1,1,2,2,3,3,4])