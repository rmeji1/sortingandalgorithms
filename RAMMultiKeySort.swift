import Foundation

struct Employee{
    var ext      : String
    var givename: String
    var surname  : String
}

extension Employee: Comparable{
    static func < (lhs: Employee, rhs: Employee)->Bool{
        if lhs.surname != rhs.surname {
            return lhs.surname < rhs.surname
        }
        else if rhs.givename != lhs.givename{
            return lhs.givename < rhs.givename
        }
        return false
    }

    static func == (lhs: Employee, rhs: Employee)->Bool{
        return lhs.surname == rhs.surname && lhs.givename == rhs.givename
    }
}

let george = Employee(ext: "Mr.", givename: "George", surname:"Smith")
let rob = Employee(ext:"Mr.", givename:"Roberto", surname:"Mejia")
let mike = Employee(ext:"Mr.", givename:"Michael", surname:"Colon")
var arr = [george, rob, mike]
print(arr.sorted())

if rob == mike{
    print("They are equal!")
} else{
    print("They are not equal :-(")
}
