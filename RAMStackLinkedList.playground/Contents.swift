//: Playground - noun: a place where people can play
import UIKit
public class Stack<T> : NSObject{
  // Properties
  private var head: Element<T>? = nil
  
  // initializer
  override init(){}
  
  init(data: T){
    self.head = Element<T>(data: data)
  }
  
  func push(data: T)->Bool{
    let elementToPush = Element<T>(data: data)
    
    // if head is not nil
    if let head = self.head { elementToPush.next = head }
    self.head = elementToPush
    return true
  }
  
//  Could throw an error if list is empty
  func pop() -> (data: T?, success: Bool){
//    if head is not nil
    if let head = self.head{
      let temp = head
      self.head = head.next
      return (temp.data, true)
    }
    return (nil, false)
  }

  /*Node for linked list*/
  private class Element<T>{
    var next: Element<T>? = nil
    var data: T? = nil
    
    init(next: Element<T>? = nil, data: T?){
      self.next = next
      self.data = data
    }
    
    deinit {
      print("Element getting memory collected")
    }
  }
  
  /* String printed in swift's print function*/
  override public var description: String {
    get {
      var next : Element<T>? = head
      var print : String = "Stack -----------------\n"
      
      while let nt = next{
        print += "Data: \(String(describing: nt.data))\n"
        next = nt.next
      }
      return print;
    }
  }
}

let stack = Stack<Int>(data: 1)
stack.push(data: 2)
stack.push(data: 3)
stack.push(data: 4)
print(stack)

let tup = stack.pop()
print(tup)
//stack.pop()
print(stack)
