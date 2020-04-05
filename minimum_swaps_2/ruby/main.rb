def minimumSwaps2(arr)
  changes = 0
  subarray_start = 0
  loop do
    # Find a number that is out-of-place
    _, i = arr[subarray_start..].each_with_index.find { |val, index| val != (index + 1 + subarray_start) }
    if i != nil
      i += subarray_start

      # If such a number is found, then `j` is the position that the out-of-place number points to.
      j = arr[i] - 1

      # Swap the out-of-place number with number from position `j`.
      arr[i], arr[j] = arr[j], arr[i]

      # Increase swap counter.
      changes += 1

      subarray_start = [i, subarray_start].max if arr[i] == (i + 1)
    else
      # If there are no out-of-place number, it means the array is sorted, and we're done.
      return changes
    end
  end
end

def minimumSwaps(arr)
  changes = 0
  changed = false
  subarray_start = 0

  loop do
    changed = false
    (subarray_start..arr.size - 1).each do |i|
      if arr[i] != (i + 1)
        j = arr[i] - 1
        arr[i], arr[j] = arr[j], arr[i]
        changes += 1
        changed = true

        subarray_start = [i, subarray_start].max if arr[i] == (i + 1)
      end
    end

    return changes if changed == false
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
#arr = [2,3,4,5,1]
#arr = [5,1,4,2,3]
#arr = [9,8,7,6,5,4,3,2,1]
#arr = [5,4,3,1,2]
arr = from_file("../input.txt")
puts minimumSwaps(arr)
