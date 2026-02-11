import UIKit
//var sum = 0
//var fact = 1
//var counter = 1
//repeat {
//    
//    fact = fact * counter
//    counter += 1
//    print(fact)
////    sum = sum + 2
////    print(sum)
//} while counter <= 7


var array1 = [10, 20, 30]
var array2 = [35, 87, 21]
var array3 = array1 + array2
var emptyArray: [Int] = []
var emptyArray1 = [Int]()


print(array1)
print(emptyArray)
print(emptyArray1)
emptyArray.isEmpty ? print("empty") : print("not empty")
print("array length: ", array1.count, emptyArray.count)
print("concat array", array3)
array3.sort()
var sortedArray = array3.sorted(by: >)
print("sorted array", array3)
print("sorted array1", sortedArray)
print(sortedArray[2])
sortedArray.append(200)
sortedArray.append(contentsOf: [400, 500])
sortedArray.insert(100, at: 2)
sortedArray.insert(contentsOf: [2,3], at: 4)
print("sortedArray", sortedArray)
sortedArray.remove(at: 3)
sortedArray.removeAll()

print("after remove", sortedArray)



//dictonaries



