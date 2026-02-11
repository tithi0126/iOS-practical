import UIKit
struct Person {
    var id: Int
    var name: String
    
    func display(name: String, id: Int) {
        print(name)
        print(id)
    }
}

var p1 = Person(id: 1, name: "xyz")
print(p1.name, p1.id)
var p2 = p1
p2.name = "abc"
print(p2.name, p2.id)
