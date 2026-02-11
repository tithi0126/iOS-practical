import UIKit
//--------
//Int
let a: Int = 10
let b: Int = 20

let sumInt = a + b
let diffInt = a - b
let mulInt = a * b
let divInt = a / b       // Integer division → 3
let modInt = a % b       // Remainder → 1
print("Sum: ", sumInt, "Difference: ", diffInt, "Multiplication: ", mulInt, "Division: ", divInt, "Modulus: ", modInt)

//--------
//double
let x: Double = 20.20
let y: Double = 10.20

let sumDouble = x + y
let diffDouble = x - y
let mulDouble = x * y
let divDouble = x / y
//let modDouble = x%y

print("Sum: ", sumDouble, "Difference: ", diffDouble, "Multiplication: ", mulDouble, "Division: ", divDouble)

//--------
//Float
let p: Float = 20.25
let q: Float = 10.20

let sumFloat = p + q
let diffFloat = p - q
let mulFloat = p * q
let divFloat = p / q
//let modDouble = x%y

print("Sum: ", sumFloat, "Difference: ", diffFloat, "Multiplication: ", mulFloat, "Division: ", divFloat)


//--------
//mixed datatypes
let intValue: Int = 10
let doubleValue: Double = 4.5

let mixedSum = Double(intValue) + doubleValue
let mixedMul = Double(intValue) * doubleValue

let floatValue: Float = 2.5
let mixFloatInt = floatValue + Float(intValue)
print("Sum: ", mixedSum, "Multiplication: ", mixedMul, "mixFloatInt: ", mixFloatInt)


//--------
//bool datatype
let isOn = true
let isAdmin = true

//let c=5, d=10

let andResult = isOn && isAdmin
//let andResult1 = c==d && isOn
let orResult  = isOn || isAdmin
//let orResult2  = c==d || isAdmin
let notResult = !isOn
let notResult3 = !isOn
print("andResult: ", andResult, "orResult: ", orResult, "notResult: ", notResult)

let boolVar : Bool = true
let boolVar1 : Bool = false
if (boolVar && boolVar1) {
    print("both match")
} else {
    print("not matched")
}


//--------
//string
let first = "Hello"
let second = "World"
let result = first + " " + second
print("result: ", result)


//--------
//character
let char: Character = "A"
let asciiValue = char.asciiValue!       // UInt8 → 65

let nextCharValue = asciiValue + 2      // 66
let nextChar = Character(UnicodeScalar(nextCharValue))
print("nextChar: ", nextChar)


//--------
//Array
let marks = [10, 20, 30, 40, 50, 100]

let totalMarks = marks.reduce(0, +)
let maxMark = marks.max()
let minMark = marks.min()
let countMarks = marks.count
let avgMarks = Double(totalMarks / countMarks)
print("totalMarks: ", totalMarks, "maxMark: ", maxMark as Any, "minMark: ", minMark as Any, "countMarks: ", countMarks, "avgMarks: ", avgMarks)


//--------
//Dictionary
let scores = ["abc": 80, "xyz": 95, "pqr": 70]

let totalScores = scores.values.reduce(0, +)
let averageScore = Double(totalScores) / Double(scores.count)
print("totalScores: ", totalScores, "averageScore: ", averageScore)


//--------
//Set
let setA: Set<Int> = [1, 2, 3, 4]
let setB: Set<Int> = [3, 4, 5, 6]

let unionSet = setA.union(setB)            // 1,2,3,4,5,6
let intersectionSet = setA.intersection(setB) // 3,4
let differenceSet = setB.subtracting(setA) // 6,5
let differenceSet1 = setA.subtracting(setB) // 1,2
print("unionSet: ", unionSet)
print("intersectionSet: ", intersectionSet)
print("differenceSet: ", differenceSet)
print("differenceSet1: ", differenceSet1)

//--------
//Optional
var num1: Int? = 10
var num2: Int? = 20

if let a = num1, let b = num2 {
    let sumOptional = a + b
    
    print("sumOptional: ", sumOptional)
}

//--------
//Tupels
let values = (2, 4)
let sumTuple = values.0 + values.1
let mulTuple = values.0 * values.1
print("sumTuple: ", sumTuple)
print("mulTuple: ", mulTuple)

let uint: Int = -10


