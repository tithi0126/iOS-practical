class Student
{
    var name: String
    var marks: Int
    
    init(name: String, marks: Int) {
        self.name = name
        self.marks = marks
    }
}
let s1 = Student(name: "tithi", marks: 325)

print (s1.name)
print(s1.marks)
