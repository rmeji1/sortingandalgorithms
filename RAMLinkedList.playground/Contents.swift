//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

public class Node<T>: Sequence{
  private var data: T?
  private var next: Node<T>?

  
  init(){
    data = nil
  }
  
  init(data: T){
    self.data = data
    next = nil
  }
  
  func value() -> T?{
    return data
  }
  
  func setNext(data: T){
    let node = Node<T>(data: data)
    
    if next == nil{
      next = node
    }
    next = node
  }
  
  func setValue(data value: T){
      data = value
  }
  
  public func makeIterator() -> AnyIterator<T> {
    var index : Node<T>? = self
    
    return AnyIterator {
      if let data = index!.data {
        index = index?.next
        return data
      }else {return nil}
    }
  }
}

let linkedList = Node<String>(data: "First")
linkedList.setNext(data: "Second")
linkedList.setNext(data: "Third")
linkedList.setNext(data: "Fourth")
for value in linkedList{
  print(value)
}

