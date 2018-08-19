//: Playground - noun: a place where people can play

import UIKit

//stored property:
struct FixedLengthRange{
    var firstValue:Int
    var length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 2) //initial時就要建立給值
rangeOfThreeItems.firstValue = 6 //放在實體裡的就叫store property

print(rangeOfThreeItems.firstValue)


//lazy stored property: 第一次呼叫時才執行建立, 減少一次建立太多物件帶來的延遲感
class DataImpoter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImpoter()
    var data = [String]()
}

let manager = DataManager() //此時只先建立[String]
manager.data.append("SomeData")
manager.data.append("SomeData")
print(manager.importer.filename) //lazy stored property在這裡被第一次呼叫 馬上建立 DataImporter()

//computed property: 不需要有變數儲存的property 宣告時會和getter(必要)和setter(非必要)一起處理
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume:Double{ //這個就是computed property 一定要明確宣告 沒有=
        //get{  只有get時可以省略不寫
            return width * height * depth
        //}
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print(fourByFiveByTwo.volume)

//computer property例二
struct Point{
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        set{
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y:0.0), size: Size(width: 10, height: 10))
let initialSquareCenter = square.center //這裡會調用get
initialSquareCenter.x
initialSquareCenter.y

square.center = Point(x: 15, y: 15)  //這裡會調用set
square.origin.x
square.origin.y

//property observer
class StepCounter {
    var totalSteps:Int = 0{
        willSet{
            print("現在傳進來的是\(newValue)")
        }
        didSet{
            if totalSteps > oldValue {
                print("增加了\(totalSteps - oldValue)")
            }else{
                print("減少了\(oldValue - totalSteps)")
            }
        }
    }
}
let stepCounter = StepCounter()//若為struct在這裡給值一樣視為initial 不會進去observer
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
stepCounter.totalSteps = 400
