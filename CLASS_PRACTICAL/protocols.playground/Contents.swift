import UIKit

protocol Printable {
    func printDetails()
}

protocol Identifiable {
    var id: Int { get }
}

class Person: Identifiable, Printable {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    func printDetails() {
        print(id, name)
    }
}

let t1 = Person(id: 1, name: "xyz")
t1.printDetails()
