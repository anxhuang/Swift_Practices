//: Playground - noun: a place where people can play

import UIKit

var someCharacter:Character = "z"

switch someCharacter {
case "a":
    print("a")
case "z":
    print("z")
default:
    print("others")
}

//Group比對
switch someCharacter {
case "a","A":
    print("a")
case "z","Z":
    print("z")
default:
    print("others")
}

//數值區段的比對
let approximateCount = 62
switch approximateCount {
case 0:
    print("zero")
case 1..<5:
    print("1-4")
case 5..<12:
    print("5-11")
case 12..<100:
    print("12-99")
case 100..<1000:
    print("100-999")
default:
    print("over 999")
}

//tuple比對
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("origin")
case (_,0):
    print("on axis-x")
case (0,_):
    print("on axis-y")
case(-2...2,-2...2):
    print("in square range")
default:
    print("other field")
}

//value binding
let anothterPoint = (2, 2)
switch anothterPoint{
case (let x, 0):
    print("x=\(x),y=0") // ex. (2,0) => print: x=2,y=0
    
case (0, let y):
    print("x=0,y=\(y)") // ex. (0,5) => print: x=0,y=5
    
case let(x,y):
    print("x=\(x),y=\(y)") // ex. (4,6) => print: x=4,y=6
}

//where
let yetAnotherPoint = (1,-1)
switch yetAnotherPoint {
case let (x,y) where x == y:
    print("x==y")
case let (x,y) where x == -y:
    print("x==-y")
case let (x,y):
    print("x=\(x),y=\(y)")
}

//switch true
let ascii = 99
switch true{
case 48<=ascii && ascii<=57:
    print("numbers")
case 65<=ascii && ascii<=90:
    print("upper case")
case 97<=ascii && ascii<=122:
    print("lower case")
default:
    print("other symbol")
}

//continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove:[Character] = ["a","e","i","o","u"," "]
for character in puzzleInput { //g->r->e->a->t-> ->m->i->n->d->s-> ->t......
    if charactersToRemove.contains(character){ //查看character有沒有在characterToRemove裡
        continue
    }else{
        puzzleOutput.append(character)
    }
}

print(puzzleOutput)

//guard else 提早離開
func greet(person:[String:String]){ //代入dictionary
    guard let name = person["name"] else{ //注意！！ name 在此不是guard else區域變數！！ 為func變數
        return
    }
    
    print("hello \(name)")
    
    guard let location = person["location"] else{
        print("no location")
        return
    }
    print(location)
    
}

greet(person: ["name":"john"])
greet(person: ["name":"jane","location":"cupertino"])

//Checking API Availability
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
