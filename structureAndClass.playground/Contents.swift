//: Playground - noun: a place where people can play

import UIKit

//宣告方式
class SomeClass{
}
struct SomeStructure{
}

//2個成員在裡面
struct Resolution{
    var width = 0; //這裡的變數叫property
    var height = 0;
}

class VideoMode{
    var resolution = Resolution(); //建立一個Resolution放到resolution
    var interlaced = false;
    var frameRate = 0.0;
    var name:String?; //optinal type 有 default value = nil
}

//建立實體 (initial)
let someResolution = Resolution();
let someVideoMode = VideoMode();

//使用property
someResolution.width;
someVideoMode.resolution.width;
someVideoMode.resolution.width = 1280;

//initial時直接給property初值
let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080);

// 重要！Structure和Enumeration是Value Type
var cinema = hd;
cinema.width = 2048;
cinema.width; //2048
hd.width; //1920



enum CompassPoint{
    case north, south, east, west;
}

var currentDirection = CompassPoint.west;
let rememberedDirection = currentDirection;
currentDirection = .east; //.east

if rememberedDirection == .west{ //.west
    print("is west");
}

// 重要！Class是Reference Ｔype
let tenEighty = VideoMode();
tenEighty.resolution = hd; //structure是value type, 這裡是複製一份hd給tenEighty.resolution
tenEighty.interlaced = true;
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0;


let alsoTenEighty = tenEighty;
alsoTenEighty.frameRate = 30.0
tenEighty.frameRate; //和alsoTenEighty為同一個實體, 故回傳為30

//identity operators === 或 !== , 用來檢查參考的是不是同一個實體
if tenEighty === alsoTenEighty {
    print("同一個實體")
}
