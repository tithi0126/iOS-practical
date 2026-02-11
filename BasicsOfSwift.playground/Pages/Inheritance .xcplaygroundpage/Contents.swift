class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func display() -> String {
        return "Name: \(name), Age: \(age)"
    }
}

class Student: Person {
    var rollno: Int
    
    init(name: String, age: Int, rollno: Int) {
        self.rollno = rollno
        super.init(name: name, age: age)
    }
    
    override func display() -> String {
        return super.display() + ", Roll no: \(rollno)"
    }
}

let s = Student(name: "Tithi", age: 20, rollno: 110)
print(s.display())
// Output: Name: Tithi, Age: 20, Roll no: 101

//super keyword = we can access super class members using the keyword in swift
// 

//self keyword = to access
