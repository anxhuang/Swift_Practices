//: Playground - noun: a place where people can play

import UIKit


//Protocol: 協定或功能藍圖，只要有人採納就要實作裡面規定的功能(不寫optional就是預設為required)
protocol SomeProtocol{
    var mustBeSettable:Int{get set} //宣告property時指示採納者的computed property一定要有get和set的功能
    var doesNotNeedToBeSettable:Int {get} //每個宣告的property一定至少要有get
    static func someTypeMethod() //Type Method Requirement
    func random() -> Double //Instance Method Requirement
    
}


protocol AnotherProtocol{
    static var someTypeProperty:Int{get set} //type property
}


protocol FullyNamed{
    var fullName:String {get}
}

struct Person:FullyNamed{
    var fullName:String //必須實作fullName
}

var john = Person(fullName: "John Appleseed")
john.fullName = "Set Another Name"
john.fullName

class Starship:FullyNamed{
    var prefix:String? //可以放nil
    var name:String
    init(name:String, prefix:String? = nil){ //prefix有預設nil
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String{
        return ((prefix != nil) ? (prefix! + " ") : "" ) + name //三元運算式 有前綴就和名字一起回傳 沒有就回傳名字而已
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName

//Method Requirement
protocol RandomNumberGenerator{
    func random() -> Double //instance method
}
class LinearCongruentialGenerator:RandomNumberGenerator{
    func random() -> Double{ //必須實作random()
        return 3.2345678845 //＊課本是一堆算式 這裡用一個數字代表以省略＊
    }
}

//Mutating Method Requirements
protocol Togglable{
    mutating func toggle()
}

enum OnOffSwitch:Togglable{
    case off, on
    mutating func toggle(){ //必須實作toggle()
        switch self{
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

//initializer Requirements
protocol YourPortocol{
    init() //initializer
}

class SomeSuperClass{
    init(){
    }
}

class SomeSubClass:SomeSuperClass,YourPortocol{ //先繼承 後採納
    required override init(){ //採納init()一定要有required前綴 這是protocol要求的; override是super class要求的
    }
}
//Protocol本身也是資料型態
class Dice{
    let sides:Int
    let generator:RandomNumberGenerator //宣告為protocol型態 (不是採納不用實作)
    init(sides:Int, generator:RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int{
        return Int(generator.random() * Double(sides)) + 1
    }
    
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator.init()) //當型態為protocol必須傳入有採納該protocol實體
for _ in 1...5{
    d6.roll()
}

