import UIKit

//struct Student {
//    var name: String
//    var marks: Int
//    
//    func add () {
//        print(10+10)
//    }
//}
//
//extension Student {
//    func displayResult() {
//        if marks >= 40 {
//            print("\(name) passed")
//        } else {
//            print("\(name) failed")
//        }
//    }
//}
//
//let s1=Student(name: "A", marks: 90)
//s1.displayResult()
//s1.add()
extension String{
    func isPalindrome()->Bool{
        self == String(self.reversed()) ? print("palindrome") : print("non-palindrome")
        return self == String(self.reversed())
    }
}
let s2 = String("abc")
s2.isPalindrome()

