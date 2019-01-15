//: Playground - noun: a place where people can play

import UIKit

// Really like the problem and clever solution

public class Permutation{
  private var used : [Bool]
  private var out : String
  final private var input : String
  
  init(string: String){
    input = string
    used = Array<Bool>(repeating: false, count: input.count)
    out = ""
  }
  
  func permutate( ){
    if out.count == input.count{
      print(out)
      return
    }
    
    for k in 0..<input.count{
      if (used[k]) {
        continue
      }
      let index = input.index(input.startIndex, offsetBy: k)
      out.append(input[index])
      used[k] = true
      permutate()
      used[k] = false
      out.removeLast()
    }
  }
}

let permutation = Permutation(string: "hat")
permutation.permutate()



public class Combination{
  var array = [String]()
  var input : String
  var out = ""
  
  init(input: String) {
    self.input = input
  }
  
  func comination(){
    comination(start: 0)
  }
  
  func comination(start: Int){
    for k in start..<input.count - 1{
      let index = input.index(input.startIndex, offsetBy: k)
      out.append(input[index])
      print(out)
      comination(start: k+1)
      out.removeLast()
    }
    out.append(input.last!)
    print(out)
    out.removeLast()
  }
}

let combo = Combination(input: "wxyz")
combo.comination()
