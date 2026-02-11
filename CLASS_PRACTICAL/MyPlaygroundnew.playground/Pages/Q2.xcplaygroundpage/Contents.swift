import UIKit
////Hellow world
///*hellow
//world*/
////var greeting = "Hello, playground"
////
////print(greeting)
////let x:Int = 10
////let y:Int = 20
////print(" Int sum= \(x+y)")
////
////let x1:Float = 10.20
////let x2:Float = 20.20
////print(" Float sum= \(x1+x2)")
////
////let x3:Double = 10.20
////let x4:Double = 20.20
////print(" Double sum= \(x3+x4)")
////
////
////let res: Bool = true
////let res2: Bool = false
////let res3 = res && res2
////print(" Bool value is \(res3)")
////
////
////let d = 10
////let e = 20
////if (d>e) {
////    print("1")
////} else {
////    print("2")
////}
////
////
////let a1 = 10
////let a2 = 20.50
////let sum1 = Double(a1) + a2
////print(sum1)
////
////
////let char: Character = "A"
////print(char)
//////let nextCharValue = char.asciiValue
////let nextCharValue = Character(UnicodeScalar((char.asciiValue ?? 65) + 1)) /*char.unicodeScalars.first!.value + 1*/
////print(nextCharValue)
////
////
//////let char:Character = "A"
//////let nextCharValue = Character(UnicodeScalar((char.asciiValue ?? <#default value#>) + 1)) /*char.unicodeScalars.first!.value + 1*/
//////print(" Char is \(char.asciiValue!)")
//////print(" Next char is \(nextCharValue)")
////
////var str1 = "hello"
////var str2 = "world"
////print(str1 + " " + str2) //first way
////print("\(str1) \(str2)") //second way
////print("my string is \(str1) \(str2)") //string interpolation
////
////
////var firstname: String = "IOS Programming"
////var lastname: String? // It will throw compile time error
////var uname: String? // It will throw compile time error
////print(firstname)
////print(lastname)
////print(uname)
////
////
////var name1: String!
////name1 = "Bharat Patel"
////if let str4 = name1 {
////print("\(str4)")
////}
////else {
////print("No Name ")
////}
////
////let userInfo = ("xyz", 200) // unnamed tuple
////let userInfo1:(String,Int) = ("pqr", 200) // named tuple
////let userinfo2 = (name: "xyz", id: 200)
////print("unnamed tuple: \(userInfo)")
////print("named tuple: \(userInfo1)")
////print("tuple: \(userinfo2)")
////
////var lstNames = [10,20,30,40,50]
////for index in lstNames {
////    
////print(index)
////}
//
//var i = 1
//print("while:")
//while i < 15 {
//    print(i)
//    i = i+5
//}
//
//print("\n\nrepeat:")
//i=1
//repeat {
//    print(i)
//    i = i+5
//}while i < 15
////print("\n")
////for i in 1...5{
////    for j in 1...i{
////        print(j, terminator: "")
////    }
////    print()
////}
//
//var array1 = [20,23,22,45,68,96]
//var array2 = [60,100,101,102,103]
//var array3 = array1+array2 //concat array
//
//print("concat array:", array3)
//if (!array3.isEmpty) {
//    print("array length: ", array3.count)
//    array3.sort()
//    print("ascending array: ", array3)
//    
//    print("descending array: ", array3.sorted(by: >))
//    
//   
//    array3.append(contentsOf: [200, 300, 400])
//    array3.append(500)
//    
//    array3.insert(4000, at: array3.count)
//    print(array3)
//    print("append::",array3)
//} else {
//    print("there are elements in available array")
//}
//
//
protocol Identifiable {
    var id: Int { get }
}

protocol Payable {
    var salary: Double { get set }
}

class Employee: Identifiable, Payable {
    var id: Int
    var salary: Double

    init(id: Int, salary: Double) {
        self.id = id
        self.salary = salary
    }
}

let emp = Employee(id: 101, salary: 50000)
emp.id=102
print(emp.id)        // 101
emp.salary = 55000
print(emp.salary)   // 55000
