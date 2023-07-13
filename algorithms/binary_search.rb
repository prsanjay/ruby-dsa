def binary_search(nums, target)
  left = 0
  right = nums.size - 1

  while left <= right
    mid = (left+right)/2
    if nums[mid] == target
      return mid
    elsif target > nums[mid]
      left = mid+1
    elsif target < nums[mid]
      right = mid-1
    end
  end
  return -1
end


p binary_search([1,2,3,4,5], 6)