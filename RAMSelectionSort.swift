import Foundation


/*
 This solution can be more effienct if recursion is not used.
 This algorithm is O(n^2) for all cases (best, average, and worst)
 This is an in place algorithm and typically not stable because relative order of elements is not maintained. 
*/
class Solution{
    func selectionSortRecursive( arr: inout [Int] ) {
        selectionSortRecursive( arr: &arr, start: 0 )
    }

    func selectionSortRecursive( arr: inout [Int], start: Int ){
        if start < arr.count - 1{
            swap( arr: &arr, start: start, index: findMinimumIndex(arr, start) )
            selectionSortRecursive( arr: &arr, start: start + 1 ) 
        }
    }

    /// Find the position of minimum value starting at given position.
    private func findMinimumIndex(_ arr: [Int], _ start: Int )  -> Int{
        var minimumPosition = start

        for i in start + 1..<arr.count{
            if arr[i] < arr[minimumPosition] {
                minimumPosition = i
            }
        }

        return minimumPosition
    }

    /// Swap two elements in an array.
    private func swap( arr: inout [Int], start: Int, index: Int ){
        if start != index {
            let temp = arr[start]
            arr[start] = arr[index]
            arr[index] = temp
        }
    }
}

let sol = Solution()
var arr = [3,4,2,1]
sol.selectionSortRecursive( arr: &arr )
print(arr)
