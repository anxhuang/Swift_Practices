//: Playground - noun: a place where people can play

import UIKit

//(Int,Int) -> Int
func addTwoInts(_ a:Int, _ b:Int) -> Int{
    return a+b
}

//(Int,Int) -> Int
func multiplyTwoInts(_ a:Int, _ b:Int) -> Int{
    return a*b
}

//() -> Void
func printHelloWorld(){
    print("Hello, World")
}

//1. Function可以放到變數內
var mathFunction:(Int, Int) -> Int = addTwoInts
mathFunction(2,3)
mathFunction = multiplyTwoInts(_:_:)
mathFunction(2,3)

//2. Funciton可以當作參數傳入(最常用)
func printMathResult(_ mathFunction:(Int,Int) -> Int, _ a:Int, _ b:Int){
    print("Result:\(mathFunction(a,b))")
}

printMathResult(addTwoInts, 3, 5)
printMathResult(multiplyTwoInts, 3, 5)

//3. Function可以當作return type傳出
func stepForward(_ input:Int) -> Int{
    return input + 1
}

func stepBackward(_ input:Int) -> Int{
    return input - 1
}

//  Function名稱(引數:Type) -> ( 要傳出的functionType, 即(inputType)->returnType )
 func chooseStepFunction(backward:Bool) -> (Int) -> Int{
    return backward ?  stepBackward : stepForward //會自己找外面的
 }
 
 var currentValue = 3
 let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
 print(moveNearerToZero(5))
 

//巢狀function
func chooseStepFunction1(backward:Bool) -> (Int) -> Int{
    func stepForward(input:Int) -> Int { return input + 1}
    func stepBackward(input:Int) -> Int { return input - 1}
    return backward ? stepBackward : stepForward //優先找裡面的
}
 print(moveNearerToZero(5))
