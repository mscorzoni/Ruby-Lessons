def bubble_sort(array)
    swap = true
    while swap
        swap = false

        for i in (0..array.length - 2)
            if array[i.next] < array[i]
                array[i], array[i.next] = array[i.next], array[i]
                swap = true
            end
        end
    end
    return array
end


print bubble_sort([1,5,7,3,2,4,6])

def bubble_sort_by(arr)
  swap = true
  while swap
    swap = false

    for j in (0..arr.length-2)
      if arr[j].length> arr[j.next].length
        arr[j], arr[j.next] = arr[j.next], arr[j]
        swap = true
      end
    end
  end
  return arr
end

print bubble_sort_by(["hi", "hey", "hello"])
