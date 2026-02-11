//syntax of protocol : protocol ProtocolName {//structure body }
//class className : protocol1,protocol2 {//structure body }

protocol identifiable
{
    var id:Int{get}
}

protocol payable
{
    var salary: Double {get set}
}

class Employee: identifiable,payable
{
    var id: Int
    var salary: Double
    
    init(id: Int, salary: Double) {
        self.id = id
        self.salary = salary
    }
}

let Employee1 = Employee(id: 1, salary: 60000)
print(Employee1.id)
//Employee1.id(2)
Employee1.salary = 70000
print(Employee1.salary)

//NOTE: We cannot write a property with let inside protocol defination
//Protocol property requirements mus use the var keyword even if they are readonly

