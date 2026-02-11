import UIKit

class Person: NSObject
{
    var name: String
    
    init(name: String)
    {
        self.name = name
    }
    
    func drive() -> String
    {
        return "\(name) is driving."
    }
    
}

var myPerson = Person(name: "John")
var d = myPerson.drive()

print(d)
var d2 = myPerson.name
d2 = "mike"
print(myPerson.name)
print(d2)
