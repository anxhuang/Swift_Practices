//: Playground - noun: a place where people can play

import UIKit

//Raw Value: C語言的產物 每個成員會有內定的raw value成員 可以一次全部初始化
enum Planet:Int{
    case mercury = 1, venus, earth, mars, jupter, saturn, uranus, neptune //會自動遞增
}


enum CompassPoint:String{
    case north, south, east, west //會自動把名字轉字串
}

//使用raw-value
let earthsOrder = Planet.earth.rawValue

let possiblePlanet = Planet(rawValue: 7)
let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind){ //因為有可能會回傳nil 所以要用optional binding
    switch somePlanet{
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
}else{
    print("not found")
}
