import pprint as p

def arrayManipulation(m, n, queries):
    arr = [0] * m
    mval = 0

    for query in queries:
        if len(query) > 0:
            beg, end, val = query
            for i in range(beg, beg + (end - beg) + 1):
                arr[i - 1] += val
                mval = max(mval, arr[i - 1])

    return mval

def fromFile(name):
    arr = []
    op_arr = []
    with open(name) as f:
        meta = f.readline().strip().split(' ')
        arr_size, op_count = map(lambda x: int(x.strip()), meta)
        arr.append([arr_size, op_count])

        for line in range(0, op_count):
            line = f.readline().strip()
            if len(line) == 0 or line[0] == '#': next
            line = line.split(' ')
            beg, end, val = map(lambda x: int(x.strip()), line)
            op_arr.append([beg, end, val])

    arr.append(op_arr)
    return arr

arr = fromFile("../15.txt")
maxvalue = arrayManipulation(arr[0][0], arr[0][1], arr[1])
print(maxvalue)
