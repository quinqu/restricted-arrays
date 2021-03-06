require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: o(n)
# Space complexity: o(1)
def length(array)
  length = 0
  i = 0
  while array[i] != nil
    length += 1
    i+=1
  end 
  return length
end

# Prints each integer values in the array
# Time complexity: o(n)
# Space complexity: n/a
def print_array(array)
  array.each do |i|
    puts i 
  end 
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: o(n)
# Space complexity: o(1)
def search(array, length, value_to_find)
  length.times do |i|
    if array[i] == value_to_find 
      return true
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: o(n)
# Space complexity: o(1)
def find_largest(array, length)
  largest = array[0]
  length.times do |i|
    if largest <= array[i]
      largest = array[i]
    end 
  end 
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: o(n)
# Space complexity: o(1)
def find_smallest(array, length)
  smallest = array[0]

  length.times do |i|
    if smallest >= array[i]
      smallest = array[i]
    end 
  end 
  return smallest
end

# Reverses the values in the integer array in place
# Time complexity: 0(n/2)
# Space complexity: O(1)
def reverse(array, length)
  (length/2).times do |index|
    temp = array[index]
    array[index] = array[length - 1 - index]
    array[length - 1 - index] = temp
  end 
  return array 
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: o(1) or o(n)
# Space complexity: o(1)
def binary_search(array, length, value_to_find)
  #[1, 2, 3, 4] =4-0/2 =2 
  start = 0
  while (start <= length - 1)
    middle = start + ((length - start)/2)
    if array[middle] == value_to_find
      return true
    elsif value_to_find < array[middle]
      length = middle - 1
    elsif  value_to_find > array[middle]
      start = middle + 1 
    else
      return false 
    end
  end 
  return false
end


# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.

def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end


def find_max(array, length)
  return nil if length == 0
  max = array[0] 
  length.times do |i| 
    if array[i] >  max
      max = array[i] 
    end 
  end 
  return max 
end 
#puts reverse([1, 2, 3, 4], 4)
#puts reverse([1, 2, 3, 4, 5], 5)