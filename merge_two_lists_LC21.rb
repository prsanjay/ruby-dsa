# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def merge_two_lists(list1, list2)
  node = ListNode.new
  current = node

  while !list1.val.nil? && !list2.val.nil?
    if list1.val <= list.val
      current.next = list1
      list1 = list1.next
    else
      current.next = list2
      list2 = list2.next
    end
    current = current.next
  end

  if !list1.val.nil?
    current.next = list1
  elsif !list2.val.nil?
    current.next = list2
  end
  node.next
end

merge_two_lists([1,2,4], [1,3,4]) # Basically this should be linked list
