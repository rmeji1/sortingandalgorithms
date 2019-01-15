import Foundation

/*
 Best case O(n) happens when alread sorted. 
 Best case makes it effient for adding elements to a presorted list. 

 worst and average case is O(n^2) making it not efficient for large datasets or randomly
ordered data. 

This is a stable in-place algorithm. 
*/
class Solution{
    /// Sort arry using simple insertation sort
    func insertationSort(arr: inout [Int]){
        for which in 1..<arr.count{
            let val = arr[which]
            //print(val)
            for i in 0..<which{
                if arr[i] > val{
                    arr.swapAt(which, i)
                    //print(arr)
                    //break
                }
            }
        }
    }
}

let sol = Solution()
var arr = [7,1,2,3]

sol.insertationSort(arr: &arr)
print(arr)
