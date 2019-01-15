//: Playground - noun: a place where people can play
import UIKit

// Stack using array, taken from Apple documentation
struct Stack<Element> {
  // original Stack<Element> implementation
  var items = [Element]()
  init(_ element: Element){
    push(element)
  }
  mutating func push(_ item: Element) {
    items.append(item)
  }
  mutating func pop() -> Element {
    return items.removeLast()
  }
  // conformance to the Container protocol
  mutating func append(_ item: Element) {
    self.push(item)
  }
  var count: Int {
    return items.count
  }
  subscript(i: Int) -> Element {
    return items[i]
  }
}


///Binary tree node
//each node has no more than two children, referred to as left and right
public class Node<T: Comparable> {
  private(set) var left : Node<T>?
  private(set) var right : Node<T>?
  private(set) var value : T?
  
  init(left: Node<T>? = nil, right: Node<T>? = nil, data: T?=nil){
    self.left = left
    self.right = right
    self.value = data
  }
  
  // Problem: Find tree height.
  // Runtime: O(n)
  var height : Int{
    get{
      return 1 + max(left?.height ?? 0, right?.height ?? 0)
    }
  }
  
  // Problem: print pre-order traversal
  // Runtime: O(n)
  // Should print 100, 50, 25, 75, 150, 125, 110, and 175.
  func preOrderTraversal(){
    print(value ?? "NO VALUE", terminator: ", ")
    if let left = self.left{ left.preOrderTraversal() }
    if let right = self.right{ right.preOrderTraversal() }
  }
  
  /// Problem: Preorder traversal no recursion
  /// Result: should print 100, 50, 25, 75, 150, 125, 110, and 175.
  // Disscussion: Problem is determining what is a recursion.
  // Recursion implicitly uses a stack data structure by placing
  // data on the call stack.
  func preOrderTraversalNoRecursion(){
    var stack = Stack(self)
    while stack.count > 0{
      let curr = stack.pop()
      print(curr.value!, terminator: ", ")
      var node = curr.right
      if let n = node{stack.push(n)}
      node = curr.left
      if let n = node{stack.push(n)}
    }
  }
  
  // Problem: Lowest Common Ancestor
  // This only works with Int trees for sake to solve problem.
  // At first I used recursion and fcn worked but it is not necessary.
  // A loop runs just fine
  // Runtime: O(log(n))
  func lowestCommonAncestor(min: Int, max: Int)->Int?{
    var curr : Node? = self
    while curr != nil{
      if min < (curr!.value as! Int) && max < (curr!.value as! Int){
        // Go left
        //        print("Going left")
        curr = curr?.left
        //return curr!.left?.lowestCommonAncestor(min: min, max: max)
      }else if min > (curr!.value as! Int) && max > (curr!.value as! Int){
        // Go right
        //        print("Going right")
        curr = curr?.right
        //return curr!.right?.lowestCommonAncestor(min: min, max: max)
      }
      else {
        return curr!.value as? Int
      }
    }
    return nil
  }
  
  // O(n)
  func preOrderTraversalToArray(_ node : inout [Node<T>]){
    node.append(self)
    if let left = self.left{ left.preOrderTraversalToArray(&node) }
    if let right = self.right{ right.preOrderTraversalToArray(&node) }
  }
  
  // In this case assumption value is an int
  func binaryTreeToHeap(){
    var arr: [Node<T>] = []
    self.preOrderTraversalToArray(&arr)
    
    // Sort in min order
    arr.sort { (element1, element2) -> Bool in
      if element1.value! < element2.value!{
        return true
      }
      return false
    }
    
    // Think of breath first search. If insert the nodes left to right
    // you have a balanced binary tree.
    // we have an array (arr) in min order, therefore, for a slot the preceding
    // two slots are its child nodes
    for index in 0...arr.count - 1{
      let left = 2*index + 1
      let right = 2*index + 2
      
      arr[index].left = left < arr.count ? arr[left] : nil
      arr[index].right = right < arr.count ? arr[right] : nil
    }
  }
  
  /// Problem: Unbalanced Binary Search Tree (BST)
  /// Runtime: O(1) constant runtime
  func rotateTree() -> Node?{
    let newRoot = left
    left = newRoot?.right
    newRoot?.right = self
    return newRoot
  }
}

//let rightNode : Node = Node(
//  left: Node(left: Node(data:"F"), right: Node(data:"G"), data:"E"),
//  right: Node(left: Node(data:"H"), data: "D"),
//  data:"C")
//
//var tree = Node(left:Node(data:"B"), right:rightNode, data: "A" )
//print("Tree height: \(tree.height)")

//var anotherRightNode : Node = Node(
//  left: Node(left: Node(data:110), data:125),
//  right: Node(data: 175),
//  data:150)
//
//var anotherLeftNode = Node(
//  left: Node(data: 25),
//  right: Node(data: 75),
//  data: 50
//)
//
//var perOrderTraverselRoot = Node(left: anotherLeftNode, right: anotherRightNode, data: 100)
//perOrderTraverselRoot.preOrderTraversalNoRecursion() ; print()
//
//anotherRightNode = Node(data: 22)
//
//anotherLeftNode = Node(
//  left: Node(data: 4),
//  right: Node(right: Node(data:14), data: 12),
//  data: 8)
//
//let lowestCommonAncestor = Node(left: anotherLeftNode, right: anotherRightNode, data: 20)
//
//print(lowestCommonAncestor.lowestCommonAncestor(min: 4, max: 14)!)
//
//lowestCommonAncestor.binaryTreeToHeap()



