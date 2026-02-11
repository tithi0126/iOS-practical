import UIKit

//struct student {
//    var name: String
//    var rollNo: Int
//    func show(){
//        print("rollNo: \(rollNo), name: \(name)")
//    }
//}
//var s1 = student(name: "A", rollNo: 1)
//var s2=s1
//s2.name="C"
//print(s1.name)
//print(s2.name)

class student {
    var name: String
    var rollNo: Int
    init (name: String, rollNo: Int) {
        self.name = name
        self.rollNo = rollNo
    }
    func show(){
        print("rollNo: \(rollNo), name: \(name)")
    }
}
var s1 = student(name: "A", rollNo: 1)
var s2=s1
s2.name="C"
print(s1.name)
print(s2.name)

