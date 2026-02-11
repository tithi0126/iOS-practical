//aminal sound class dog
class Animal{
    func sound()
    {
        print("Animal makes sound")
    }
}

class dog:Animal{
    override func sound()
    {
        print("Dog makes sound")
    }
}
let d = dog()
d.sound()

//multiple inheritance support nathi kartu ane partially use karva protocol usr karye apde 
