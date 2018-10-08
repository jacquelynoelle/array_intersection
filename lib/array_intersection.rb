# Creates a new array to return the intersection of the two input arrays

# SOLUTION 1
# O(n+m) time complexity
# O(n) space complexity (where n is the length of the shorter array)
def intersection(array1, array2)
  intersection = []

  if (array1 == nil || array2 == nil || array1.length == 0 || array2.length == 0)
    return intersection
  end

  if array1.length <= array2.length
    shorter_array = array1
    longer_array = array2
  else
    shorter_array = array2
    longer_array = array1
  end

  # using the shorter array, create a hash where the integers are the keys
  # set the value for the key to true for integers in the array
  # where O(n) is the length of the shorter array,
    # time complexity of this loop is O(n)
    # space complexity of this loop is O(n)
  i = 0
  tracker = {}
  while i < shorter_array.length do
    tracker[shorter_array[i]] = true
    i += 1
  end

  # time complexity of this loop is O(m)
  # space complexity of this loop is O(n)
  i = 0
  while i < longer_array.length do
    if tracker[longer_array[i]]
      intersection << longer_array[i]
    end
    i += 1
  end

  return intersection
end

# SOLUTION 2
# Another approach would be to sort the shorter array, and then go through each
# element of the longer array and do a binary search for it in the shorter
# array. Once you find a number greater than the current element, you can
# assume it's not in the array and move on to the next element.
# Time complexity would be O(mLogm + nLogm) or O(mLogn + nLogn)
# -- whichever is faster. Sorting would be mLogm or nLogn and doing a
# binary search for each element of n or m would be mLogn or nLogm.
# Space complexity is O(m) or O(n), whichever is shorter.
