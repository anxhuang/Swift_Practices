//: Playground - noun: a place where people can play

import UIKit

class Vehicle{ //Swift的class預設沒有繼承Object 一律為base class
    var currentSpeed = 0.0 //store property被繼承會直接多一份到子類別
    var description:String{
        return "現在的速度是每小時\(currentSpeed)公里"
    }
    
    func makeNoise(){ //方法被繼承 子類別實際上是reference過來執行 但是行為上比較接近"有相同的方法在子類別裡"
    }
}

let someVehicle = Vehicle()
print("Vehicle:\(someVehicle.description)")

class Bicycle:Vehicle{ // 繼承 子類別名:父類別
    var hasBasket = false //只有Bicycle有
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle:\(bicycle.description)")

class Tandem:Bicycle{
    var currentNumberOfPassengers = 0 //只有Tandem有
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandom:\(tandem.description)")


//override 實體的method
class Train:Vehicle{
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise() //會輸出Choo Choo了

//override computed Property
class Car:Vehicle{
    var gear = 1
    override var description:String{
        return super.description + " in gear \(gear)" //用super.property先把父類別的內容做完 可以避免override時將父類別重要的資訊覆蓋掉
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car:\(car.description)")


//override property observer
class AutomaticCar:Car{
    override var currentSpeed:Double{ //override store property必須用observer
        didSet{
            gear = Int(currentSpeed / 10.0) + 1 //～算式不重要
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar:\(automatic.description)")


//final: 避免被override
class iCar:Vehicle{
    final var brand:String = "Apple"
    final func showBrand() -> String{
        return self.brand
    }
    final subscript(name:String)-> String{
        return "\(name)'s iCar"
    }
    //final class func == static func
}
