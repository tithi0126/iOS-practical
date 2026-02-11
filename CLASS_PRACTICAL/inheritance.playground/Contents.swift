import UIKit

class Person {
    var name: String
    var age: Int
    
    init (name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func displayInfo() {
        print("\(name) is \(age) years old.")
    }
}

class Student: Person {
    var course: String
    var rollno: Int
    
    init (name: String, age: Int, rollno: Int, course: String) {
        self.rollno = rollno
        self.course = course
        super.init(name: name, age: age)
    }
    
    
    //    func displayDetail() {
    //        super.displayInfo()
    //        print("=======================")
    //        print("RollNo.: ", rollno)
    //        print("Name: ", name)
    //        print("Age: ", age)
    //        print("Course: ", course)
    //        print("=======================")
    //    }
    
    //override func
    override func displayInfo() {
        //        super.displayInfo()
        print("=======================")
        print("RollNo.: ", rollno)
        print("Name: ", name)
        print("Age: ", age)
        print("Course: ", course)
        print("=======================")
    }
}

var s1 = Student(name: "anay", age: 23, rollno: 21, course: "MScIT")
var s2 = Student(name: "kevil", age: 23, rollno: 22, course: "MScIT")
var s3 = Student(name: "ananya", age: 23, rollno: 23, course: "MScIT")
var s4 = Student(name: "reyanshi", age: 23, rollno: 24, course: "MScIT")
var s5 = Student(name: "aashvi", age: 23, rollno: 25, course: "MScIT")
s1.displayInfo()
s2.displayInfo()
s3.displayInfo()
s4.displayInfo()
s5.displayInfo()
