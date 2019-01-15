//: Recursive Problems

import UIKit

// Binary search on a sorted array
// My implementation O(log(n))
// Can also be done using iteration which would be more efficient
func binarySearch (_ arr: [Int],find value: Int) -> Int? {
  let mid = arr.count / 2

  if value >= arr[0] && value <= arr.last!{
    if value > arr[mid]{
      return mid + binarySearch( Array(arr[mid..<arr.count]), find: value )!
    }else if value < arr[mid]{
      return binarySearch( Array(arr[0..<mid]), find: value )
    }else if value == arr[mid] {
      return mid
    }else{
      return nil
    }
  }
 
  return nil // Element out of range
}

enum BSException:Error{
  case NotInArray
  case NotSorted
  case LimitsReversed
}
// binary search on a sorted array book example written in swift instead of java
// recursive
func binarySearchBook(_ arr: [Int], target value: Int) throws -> Int{
  return try binarySearchBook(arr, target: value, lower: 0, upper: arr.count-1)
}

func binarySearchBook(_ arr: [Int], target value: Int, lower: Int, upper: Int) throws -> Int{
  var center = 0
  let range = upper - lower
  
  if range < 0{ throw BSException.LimitsReversed }
  else if range == 0 && arr[lower] != value{ throw BSException.NotInArray }
  
  if arr[lower] > arr[upper] {throw BSException.NotSorted}
  
  center = (range / 2) + lower
  if value == arr[center]{ return center }
  else if value <  arr[center] {
    return try binarySearchBook(arr, target: value, lower: lower, upper: center - 1)
  }else if value > arr[center] {
    return try binarySearchBook(arr, target: value, lower: center + 1, upper: upper)
  }
  
  return 0 // won't get called
}


// test
let arr = [1,2,3,4,7,8,9,10]
print("Element index", binarySearch(arr, find: 3))
