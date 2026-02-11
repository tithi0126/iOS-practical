import UIKit

class Automobile {
    var name: String
    init(name: String) {
        self.name = name
    }
    func display(){
        print("1")
        print(name)
        print("2")
    }
}

class Motorcycle: Automobile {
    var price: Double
    
    init(name: String, price: Double) {
        self.price = price
        super.init(name: name)
    }
    
    override func display(){
        print("*************")
        print("price: ", price)
        print("name: ", super.name)
        print("*************")
    }
    
}


let car = Motorcycle(name: "Toyota", price: 1800000)
car.display()

struct Person {
    var name: String
    var age: Int
    func show() {
        print(name, age)
    }
    
}
let p1 = Person(name: "xyz", age: 23)
p1.show()
//let p1= Person
