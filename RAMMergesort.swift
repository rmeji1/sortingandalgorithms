import Foundation

/*
 Divide and conquer algorithm
 works by splitting dataset into two or more subsets
 sorting the subsets and then merging together

 Best, average, and worst case are O(n log (n))
 But requires O(n) memory.

 Maximally effcient merge sort are stable but not in-place. 

 One optimization is use a different sorting algorithm to sort subsets below a
 specified size. 
 You would change this to 
    // base case
    if data.count < 2 { return data }
 To this:

    if data.count < 10 {
      return insertionSort ( data ) 
    }

  Using insertation would be faster because it has lower overhead.

*/
// Recursive implementation, inefficient merge sort

func mergeSortSimple(_ data: [Int]) -> [Int]{

    // base case
    if data.count < 2 { return data }

    // Slit the array into two subarrays of approx equal size
    let mid = data.count / 2
    var leftArr = Array(data[0..<mid])
    var rightArr = Array(data[mid...])

    // Sort each subarray, then merge the result
    leftArr  = mergeSortSimple( leftArr )
    rightArr = mergeSortSimple( rightArr )

    return merge( leftArr, rightArr )
}

/*
 Majority of work done in this method. Combines two sorted array into larger
 array. 
*/
func merge(_ leftArr: [Int], _ rightArr: [Int])-> [Int]{
    //var dind = 0
    var lind = leftArr.startIndex
    var rind = rightArr.startIndex 
    var dest = [Int]()
    
    // merge arrays while there are elements in both
    while ( lind < leftArr.count && rind < rightArr.count ){
        if leftArr[lind] <= rightArr[rind] {
            dest.append( leftArr[ lind ] )
            lind += 1
        }else{
            dest.append( rightArr[ rind ] )
            rind += 1
        }
    }

    // Copy rest of whichever arry remains
    while ( lind < leftArr.count ){
        dest.append( leftArr[ lind ] )
        lind += 1 
    }

     while ( rind < rightArr.count ){
         dest.append( rightArr[ rind ] )
         rind += 1
     }

     return dest
}
var arr = [0,1,5,4,3]
print(mergeSortSimple(arr))
