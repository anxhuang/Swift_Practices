//: Playground - noun: a place where people can play

import UIKit

//Enumeration列舉
enum CompassPoint{ //enum 定義Type  =>  enum typeName{}
    case north  //case 定義成員
    case south
    case east
    case west
}

enum Planet{
    //可以用","一次定義多個
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
directionToHead = .east //已經知道type為CompassPoint 故可以直接用".成員"表示

//使用switch檢查
switch directionToHead {
case .north:
    print("north")
case .south:
    print("south")
case .east:
    print("east")
case .west:
    print("west")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("earth")
default:
    print("others")
}

//成員可以有自己的Associated Value 故可以實現一個變數放不同的value type
enum Barcode{
    case upc(Int,Int,Int,Int)
    case qrcode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrcode("ABCEFGHIJKL")
type(of: productBarcode) //productBarcode的資料型態(type)始終是Barcode, 但是指定的成員會在=時跟著變
print(productBarcode)

//因為要處理不同的value type 所以常用switch
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC:\(numberSystem), \(manufacturer), \(product), \(check)")
case .qrcode(let productCode):
    print("QR code:\(productCode)")
}

