import UIKit

var greeting = "Hello, playground"
var f : String?
f = "abc"
if f != nil {
    print("firstName = \(f)")
    print("firstname = \(f!)")
} else{
    print("No firstname")
}

var name: String!
name = "Bharat Patel"
if name != nil{
//    let actualName: String = name
    print("\(name)")
//    print("\(actualName)")
}
else {
    print("No Name ")
}

var score : Int! = 10
let a : Int = score
print("Your score is \(a)")

// with Key-Value Data Types
var names = [Int: String]()
names = [1: "Bharat", 2: "Rohini"]
print(names)
print(Array(names.keys))
print(Array(names.values))
print(names[1]!)
print(names[2]!)


let userinfo = (name: "Bharat Patel", id: 200)
print(userinfo.name)
print(userinfo.id)

let userinfo1 = ("Bharat Patel",200)
print(userinfo.0)
print(userinfo.1)

let tuple1: (String, Int) = ("Bharat", 200)
print(tuple1.0)
print(tuple1.1)

let tupel2: (name: String, id: Int) = (name: "Bharat", id: 200)
print(tupel2.id)
print(tupel2.name)

var lstNames: [String] = ["Bharat","Khawar"]
for index in lstNames {
    print( "Name of Developer is: \(index)")
}

var result = ""
for (index, name) in lstNames.enumerated() {
    if index == 0 {
        result = name
    } else {
        result += " and \(name)"
    }
}

print("Name of developer are \(result)")

