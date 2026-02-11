import UIKit

var numbers: [Int] = [10, 20, 30, 40]
var num2: [Int] = [50,60,70,90]
var names = ["avyansh", "jaksh", "reyansh", "devarth"]

//array
numbers.append(50)
print("append: ", numbers)
numbers.insert(15, at: 1)

print("insert: ", numbers)
numbers.remove(at: 2)
print("removeAT: ", numbers)
numbers.removeLast()
print("removeLast: ", numbers)
//numbers.removeAll()
//print("removeAll: ", numbers)
print("way to access")
print("at specific index: ", numbers[0])
print("At first index: ", numbers.first!)
print("At last index: ", numbers.last)

print("array length: ", numbers.count)
print("check array is empty or not: ", numbers.isEmpty)

print("for in loop for array")
print("the range of indexes of array: ", numbers.indices)
for num in numbers {
    print(num)
}

numbers.append(contentsOf: num2)
print("append multiple array: ", numbers)

numbers.insert(contentsOf: [24,34], at: 7)
print("insert multiple array: ", numbers)

let doubled = numbers.map { $0 * 2 }
//numbers.map((i) => {})
print("map function: ", doubled)

let evenNumbers = numbers.filter { $0 % 2 == 0 }
print("filter function: ", evenNumbers)

let sum = numbers.reduce(0) { $0 + $1 }
print("reduce function: ", sum)

print("contains value or not: ", numbers.contains(30))

numbers.sort()
print("sort using sort() which only modifies original array: ", numbers)         // modifies original
let sortedNums = numbers.sorted()  // new array
print("sort using sorted() which returns new array: ", sortedNums)


//set
var colors: Set<String> = ["Red", "Green", "Blue"]
colors.insert("Yellow")
print("insert: ", colors)
colors.remove("Red")
print("remove: ", colors)
print("check if exists: ", colors.contains("Red"))
print("count: ", colors.count)
print("for in loop for set")
for color in colors {
    print(color)
}

let a: Set = [1, 2, 3]
let b: Set = [3, 4, 5]

print("union", a.union(b))
print("intersact", a.intersection(b))
print("subtract", a.subtracting(b))


//dictonaries
var studentMarks: [String: Int] = [
    "ar": 90,
    "jr": 85
]

print("OG: ", studentMarks)
studentMarks["Rahul"] = 88
print("add::", studentMarks)
studentMarks.updateValue(95, forKey: "ar")
print("update:", studentMarks)

studentMarks.removeValue(forKey: "Rahul")
print("remove: ", studentMarks)

print("way to access")
print("using key", studentMarks["jr"] ?? 0)

print("keys: ", studentMarks.keys)
print("values: ", studentMarks.values)

print("for in loop for dictionary")
for (name, marks) in studentMarks {
    print("\(name): \(marks)")
}


print("collection common functions")
numbers.forEach { i in numbers
    print(i)
}


print("prefix (gives first 3 element): ", numbers.prefix(3))

print("suffix(gives last 2 elements): ", numbers.suffix(2))









