//: Playground - noun: a place where people can play

import UIKit

/* Extension: 使用在擴充既有的Type(通常不是自己寫的)功能 讓該Type不用透過繼承或新建class就可以增加功能
 
 extension SomeType{
 }
 
 */
/* 一次採納多個Protocol的寫法
 
 extension SomeType :SomeProtocol, AnotherProtocol{
 }
 
 */

//擴充computed property
extension Double{
    var km:Double { return self * 1_000.0};
    var m:Double { return self };
    var cm:Double { return self / 100.0};
    var mm:Double { return self / 1_000.0 };
    var ft:Double {return self / 3.28084}; //feet英尺
}

print("\(1.0.km)");
print("\(1.0.m)");
print("\(1.0.cm)");
print("\(1.0.mm)");
print("\(1.0.ft)");

//擴充structure的initializer
//擴充class的convenience initializer
struct Size{
    var width = 0.0, height = 0.0;
}

struct Point{
    var x = 0.0 , y = 0.0
}

struct Rect{
    var origin = Point();
    var size = Size();
}

let defaultRect = Rect();
let memberwiseRect = Rect(origin: Point.init(x: 2.0, y: 2.0), size: Size.init(width: 5.0, height: 5.0));

extension Rect{
    init(center:Point, size:Size){
        let originX = center.x - (size.width / 2);
        let originY = center.y - (size.height / 2);
        self.init(origin: Point.init(x: originX, y: originY), size: size);
    }
}

let centerRect = Rect(center: Point.init(x: 10.0, y: 10.0), size: Size.init(width: 5.0, height: 5.0))

//擴充method
extension Int{
    //定義一個"要求closure當參數"的method
    func repetition(task:() -> Void){
        for _ in 0..<self{ //看Int為多少task()就做幾次
            task();
        }
    }
}

3.repetition{
    print("hello");
}

//可變動(mutating)內容實體method
extension Int{
    mutating func square(){
        self = self * self; //因為是mutating 所以可以把self改掉
    }
}

var someInt = 3;
someInt.square(); //3*3=9
print(someInt) //9 <= self 已經改變
someInt.square(); //9*9=81
print(someInt) //81


//擴充subscript
extension Int{
    subscript(digitIndex:Int) -> Int{
        var decimalBase = 1;
        for _ in 0..<digitIndex{ //這裡就是算10的幾次方 => decimalBase^decimalIndex
            decimalBase *= 10;
        }
        return (self/decimalBase) % 10; //取數字的最後一位
    }
}

74381295[0];
74381295[1];
74381295[2];
74381295[4];
74381295[5];
74381295[6];
74381295[7];

//擴充Nested Type
extension Int{
    enum Kind{
        case negative, zero, positive;
    }
    
    var kind:Kind{
        switch self{ //依self的值回傳enum的case
        case 0:
            return .zero;
        case let x where x > 0:
            return .positive;
        default:
            return .negative;
        }
    }
}

print((-5).kind)

func printIntegerKinds(_ numbers:[Int]){
    for number in numbers{
        switch number.kind{
        case .negative:
            print("- ", terminator:""); //terminator:"" 就是不換行 和下一個print相連
        case .zero:
            print("0 ", terminator:"");
        case .positive:
            print("+ ", terminator:"");
        }
    }
}

printIntegerKinds([3, 19, -27, 0, -6, 0 , 7])
print("");
