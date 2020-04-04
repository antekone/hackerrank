def swap_sort(arr)
  changes = 0
  loop do
    # Find a number that is out-of-place
    _, i = arr.each_with_index.find { |val, index| val != (index + 1) }
    if i != nil
      # If such a number is found, then `j` is the position that the out-of-place number points to.
      j = arr[i] - 1

      # Swap the out-of-place number with number from position `j`.
      arr[i], arr[j] = arr[j], arr[i]

      # Increase swap counter.
      changes += 1
    else
      # If there are no out-of-place number, it means the array is sorted, and we're done.
      return changes
    end
  end
end

def from_file(name)
  IO.readlines(name).drop(1).each do |line|
    line.strip!
    return line.split(" ").map { |n| n.to_i }
  end
end

#arr = [7,1,3,2,4,5,6]
#arr = [4,3,1,2]
#arr = [2,3,4,1,5]
arr = from_file("../input.txt")
puts swap_sort(arr)
