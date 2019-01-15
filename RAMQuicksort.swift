import Foundation


/*
 Not an efficient implementation due to the allocating new arrays. 
 */

// best case O(n log(n)) when the pivot value is ideal
// if pivot value is the minimum value (worst case) the
// recursive calls become O(n^2)
// on average pivot value will split into two nonempty
// arrays making the time fall between O(log(N)) and O(N)
func quicksortSimple( data: [Int] ) -> [Int]{
    if data.count < 2 {
        return data
    }

    let pivotIndex = data.count / 2
    let pivotValue = data[pivotIndex]

    // Allocate the arrays and create the subsets
    var leftArray = [Int]()
    var rightArray = [Int]()

    for i in 0..<data.count{
        if i == pivotIndex {continue}

        let val = data[i]

        if val < pivotValue{
            leftArray.append( val )
        }else{
            rightArray.append(val)
        }
    }

    // sort the subnets
    // combine the sored arrays and the pivot back into the original array
    return quicksortSimple(data:leftArray) + [pivotValue]
      + quicksortSimple(data:rightArray)
}

let arr = [8,7,5,3,2,4,5,10,20,20]
print(quicksortSimple(data: arr))
