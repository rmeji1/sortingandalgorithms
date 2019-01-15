//: Array and String Problems


import UIKit

/// find the first nonrepeated character
func firstNonRepeatedCharacter(in string: String) -> Character?{
  var map = [Character:Int]()
  
  for char in string{
    if let _ = map[char]{
       map[char]! += 1
    }else{
      map[char] = 1
    }
  }
  
  for char in string{
    if map[char] == 1{
      return char
    }
  }
  return nil
}

// Problem: remove specified characters
// My solution, compare with book O(n)
func remove(string remove: String, from str: String) -> String{
  var set = Set<Character>()
  var newStr = ""
  
  for character in remove{
    set.insert(character)
  }
  
  for character in str{
    if !set.contains(character){
      newStr.append(character)
    }
  }
  
  return newStr
}


// Problem: remove specified characters using more funcitons from swift
// My solution also O(n^2)
func removeUsingSwiftItems(string remove: String, from str: inout String) -> String{
  for character in remove{
    while let index = str.index(of: character){ // while charater exist remove it
      str.remove(at: index)
    }
  }
  return str
}

// Problem: reverse words
// Easy swift does this.
// O(n)
func reverseWords(in string: String) -> String{
  var returnString = ""
  
  var substring = string.split(separator: " ")
  substring.reverse()
  
  for element in substring{
    returnString.append("\(String(element)) ")
  }
  
  return returnString
}

// String to integer
func convertToInt(from string: String) -> Int{
  var negative = false
  var number = 0
  var temp = String(string)
  
  if temp.first == Character("-"){
    negative = true
    temp.removeFirst()
  }
  
  let zero = "0".unicodeScalars.first!.value
  
  for character in temp{
    let value = character.unicodeScalars.first!.value
    number *= 10
    number += Int(value - zero)
  }
  
  if negative{
    number = -number
  }
  
  return number
}

// Integer to string
// need to finish 
func convertToString(from integer: Int) -> String{
  var string = (UnicodeScalar(integer)?.description)!
  var temp = integer
  
  while temp > 0 {
    
  }
  
  return string
}

var string = "teeter"

// Should print r
print(firstNonRepeatedCharacter(in: string) ?? "Nothing found")

string = "Battle of the Vowels: Hawaii vs. Grozny"
let removeString = "aeiou"

print(remove(string: removeString, from: string))

removeUsingSwiftItems(string: removeString, from: &string)
print(string)

string = "Do or do not, there is no try."
print(reverseWords(in: string))

print(convertToInt(from: "145"))

print(convertToString(from: 70))
