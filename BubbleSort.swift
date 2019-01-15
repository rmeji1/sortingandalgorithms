import Foundation

func bubbleSort(_ a: [Int]) -> Void {
    var arr = a 
    var numSwaps = 0 
    var lastUnsorted = arr.count - 1
    for _ in arr {
        for k in 0..<lastUnsorted{
            if arr[k] > arr[k+1]{
                arr.swapAt(k, k+1)
                numSwaps += 1 
            }
        }
        lastUnsorted -= 1 
    } 
    
    print("Array is sorted in \(numSwaps) swaps.")
    print("First Element: \(arr.first!)")
    print("Last Element: \(arr.last!)")
}

bubbleSort([4,2,3,1])
