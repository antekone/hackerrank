f = '../input.txt'

i = 0
arr = []
for line in open(f):
    if i == 0: next
    else:
        for nstr in line.strip().split(' '):
            arr.append(int(nstr))
        break
    i += 1

def minimumSwaps(arr):
    changes = 0
    changed = False
    subarray_start = 0
    while True:
        changed = False
        for i in range(subarray_start, len(arr)):
            if arr[i] != (i + 1):
                j = arr[i] - 1
                arr[i], arr[j] = arr[j], arr[i]
                changes += 1
                changed = True

                if arr[i] == (i + 1):
                    subarray_start = max([i, subarray_start])

                break

        if changed == False:
            return changes

ret = minimumSwaps(arr)
print("ret={}".format(ret))
