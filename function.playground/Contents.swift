//: Playground - noun: a place where people can play

import UIKit

func greet(person:String) -> String{ //這裡作定義時的person用途為"參數"
    let greeting = "hello" + person + "!"
    return greeting
}

print(greet(person: "Ann"))  //這裡作呼叫時的person叫"引數"

//沒有引參數
func sayHelloWorld() -> String{
    return "HelloWorld"
}

sayHelloWorld()

//多個引參數
func greet(person:String, alreadyGreeted:Bool) -> String{ //只要定義的引數名稱不同 func可以同名
    if alreadyGreeted{
        return greetAgain(person: person)
    }else{
        return greet(person:person)
    }
}

func greetAgain(person:String) -> String{ //func沒有前後順序限制
    return "hello again, " + person + "!"
}

//沒有傳出值(no return type) 但有引數必須明確宣告
func greet(person1:String){
    print("Hello, \(person1)")
}

greet(person: "John")

//
func printAndCount(string:String) -> Int{
    print(string)
    return string.count
}

printAndCount(string: "abcdef")

func printWithoutCounting(string:String){
    let _ = printAndCount(string:string) //用_省略回傳值 可以提示coder此處有回傳值
}

//傳出多個值 (這裡是用tuple接收)
func minMax(array:[Int]) -> (min:Int, max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1...]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    
    return (currentMin,currentMax)
}

let (min,max) = minMax(array: [8, -6, 2, 109, 3, 71])
min
max

//引數名稱和參數名稱相同
func someFunction (firstParameterName:Int, secondParameterName:Int){
}

someFunction(firstParameterName: 3, secondParameterName: 5)

//引數名稱和參數名稱不同 => 引數 參數:型態
func someFunction (argumentLabel parameterName:Int){
}

someFunction(argumentLabel: 5)

func greet(person:String, from hometown:String){
    print("hello \(person)! Glad you could visit from \(hometown)")
}

print(greet(person: "Bill", from: "Cupertino"))

//沒有引數名稱
func someFunction (_ firstParameterName:Int, _ secondParameterName:Int){
}

someFunction(5, 7)
