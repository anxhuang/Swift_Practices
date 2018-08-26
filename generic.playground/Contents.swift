//: Playground - noun: a place where people can play

import UIKit

//generic 泛型，用於擴充功能 擴充function和type容許更多的類型

func swapTwoInts(_ a:inout Int, _ b:inout Int){
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)

someInt
anotherInt

func swapTwoStrings(_ a:inout String, _ b:inout String){
    let tempA = a
    a = b
    b = tempA
}

func swapTwoDoubles(_ a:inout Double, _ b:inout Double){
    let tempA = a
    a = b
    b = tempA
}

//使用genetic function => <T>代表由使用者決定資料類型
func swapTwoValue<T>(_ a:inout T, _ b:inout T){
    let tempA = a
    a = b
    b = tempA
}


swapTwoValue(&someInt, &anotherInt)//第一個帶入的參數就決定function的資料類型
someInt
anotherInt

var someString="hello"
var anotherString="world"
swapTwoValue(&someString, &anotherString)
someString
anotherString

//swapTwoValue(&someString , &anotherInt) <- Error


//例如建立一個管理Int陣列的struct, 放入元素用push(), 移出元素用pop()
struct IntStack{
    var items = [Int]()
    mutating func push(_ item:Int){
        items.append(item)
    }
    
    mutating func pop() -> Int{
        return items.removeLast()
    }
}

//使用genetic type => <Element> 由使用者第一個放入的資料類型決定
struct Stack<Element>{
    var items = [Element]()
    mutating func push(_ item:Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
}


//Type Constraint => type有部分限制的情形
/*
func someFunction<T:SomeClass, U:SomeProtocol>(someT:T, someU:U){
}
*/

func findIndex(ofString valueToFind:String, in array:[String]) -> Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}


let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]

if let foundIndex = findIndex(ofString: "llama", in: strings){
    print("The index of llama is \(foundIndex)") //2
}

//使用genetic function
func findIndex<T:Equatable>(of valueToFind:T, in array:[T]) -> Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{ //要能夠做 "==" 比較，限制必須採納Equatable這個protocol，否則Error
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
doubleIndex //nil


//針對protocol associated Type
protocol Container{
    associatedtype Item //自己定義一個名叫Item的Type
    mutating func append(_ item:Item)
    var count:Int {get}
    subscript(i:Int) -> Item {get}
}

//Int專用採納protocol
struct IntStackP:Container{
    var items = [Int]()
    mutating func push(_ item:Int){
        items.append(item)
    }
    
    mutating func pop() -> Int{
        return items.removeLast()
    }
    
    //以下為Container規定的內容
    typealias Item = Int  //把Int取一個相同的小名叫Item(用這招在copy需實作的protocol方法時不用一個一個改)
    
    mutating func append(_ item:Item){
        self.push(item)
    }
    var count:Int {
        return items.count
    }
    subscript(i:Int) -> Item {
        return items[i]
    }
}

//genetic type採納protocol
struct StackP<Element>:Container{
    var items = [Element]()
    mutating func push(_ item:Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
    
    //以下為Container規定的內容
    mutating func append(_ item:Element){
        self.push(item)
    }
    var count:Int {
        return items.count
    }
    subscript(i:Int) -> Element{
        return items[i]
    }
}

