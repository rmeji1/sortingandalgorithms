import Foundation

// PROBLEM: Implement a stable version of the selection sort algorithm. 
class StableSelectionSort{
    var arr :[Int]

    init(arr: [Int]){
        self.arr = arr
        sort()
    }

    func sort( ){
        for start in 0..<arr.count{
            insert(into: start, pos: findMinimumValue(start))  
        }
    }

    func findMinimumValue(_ start: Int) -> Int{
        var minimumPosition = start

        for i in start + 1..<arr.count{
            if arr[i] < arr[minimumPosition] {
                minimumPosition = i
            }
        }

        return minimumPosition
    }

    func insert(into start: Int, pos: Int){
        arr.insert(arr[pos], at: start)
        arr.remove(at: pos+1)
        print(arr)
    }
}
let start = Date()
let sort = StableSelectionSort(arr: [9,4,5,2,3,12,20,32,40,3])
let end = Date()

let timeInterval = end.timeIntervalSince(start)
print("Time to evaluate took:\(timeInterval) seconds")
//print(sort.arr)
