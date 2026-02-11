import UIKit

//class
class Automobile
{
    var make: String
    var model: String
    var year: Int
    
    init(make: String, model: String, year: Int)
    {
        self.make = make
        self.model = model
        self.year = year
    }
    
    func description(vehicleType: String) -> String
    {
        return vehicleType
    }
}

class Motorcycle: Automobile
{
    override func description(vehicleType: String) -> String
    {
        return "\(vehicleType), \(make) \(model)"
    }
}

class Sedan: Automobile
{
    func description(vehicleType: String) -> String
    {
        return "\(vehicleType), \(make) \(model)"
    }
}
class SUV: Automobile
{
    func description(vehicleType: String) -> String
    {
        return "\(vehicleType), \(make) \(model)"
    }
}

var myCar: Automobile = Automobile(make: "Toyota", model: "Corolla", year: 2018)
var myBike: Motorcycle = Motorcycle(make: "Honda", model: "CBR", year: 2019)
var mySedan: Sedan = Sedan(make: "Honda", model: "Civic", year: 2017)
var mySUV: SUV = SUV(make: "Toyota", model: "RAV4", year: 2016)
print("=====================================================")
print(myCar.description(vehicleType: "Car"))
print(myBike.description(vehicleType: "Bike"))
print(mySedan.description(vehicleType: "Sedan"))
print(mySUV.description(vehicleType: "SUV"))
print("=====================================================")
