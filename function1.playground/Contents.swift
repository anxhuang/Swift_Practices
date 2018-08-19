//: Playground - noun: a place where people can play

import UIKit

//Default value for parameter
func someFunction(parameterWithoutDefault:Int, parameterWithDefault:Int = 12){
}

someFunction(parameterWithoutDefault: 3)
someFunction(parameterWithoutDefault: 5, parameterWithDefault: 15)

//沒有限定參數的數量 (會自動用array接收)
func arithmeticMean(_ numbers:Double...) -> Double{
    var total:Double = 0
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,4,5,6,7)
arithmeticMean(34.56,23.45,67.98)

//in-out參數: 參數傳入預設為let 需用in-out作reference才可以更動
func swapTwoInt(_ a:inout Int, _ b:inout Int){
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
someInt
anotherInt

