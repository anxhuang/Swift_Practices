//: Playground - noun: a place where people can play

import UIKit

//混合指定運算子
var a = 1
a += 2

//比較運算子
1 == 1
1 != 1
2 > 1
2 < 1
1 >= 1
2 <= 1

let name="world"
if name == "world"{
    print("Hello, world")
}else{
    print("I'm sorry \(name), but I don't recognized you")
}

//3元運算式，簡單的判斷 => 判斷式 ? true : false
let contentHeight = 40
let hasHeader = true
var rowHeight = contentHeight + (hasHeader ? 50 : 20)

if hasHeader{
    rowHeight = contentHeight + 50
}else{
    rowHeight = contentHeight + 20
}

//nil運算子 => optional type ?? value  , 若optional type不為nil , 自動回傳自己 ; 若為nil , 則回傳 value
let defaultColorName = "red"
var userDefinedColorName:String?
var colorNameToUse = userDefinedColorName ?? defaultColorName
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

//範圍運算子
for index in 1...5{
    print("\(index) times 5 is \(index * 5)")
}

let names = ["Anna","Alex","Brain","Jack"]
let count = names.count
for i in 0..<count{
    print("Person \(i + 1) is called \(names[i])")
}

print("")
for name in names{
    print(name)
}

print("\n2...")
for name in names[2...]{
    print(name)
}

print("\n...2")
for name in names[...2]{
    print(name)
}

print("\n..<2")
for name in names[..<2]{
    print(name)
}

print("")

//邏輯運算子 ! && ||
let allowedEntry = false
if !allowedEntry{
    print("Access denied")
}

let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
}else{
    print("Access denied")
}

if enteredDoorCode || passedRetinaScan {
    print("Welcome!")
}else{
    print("Access denied")
}

var x=1
if true || 3 == (x + 2) {
    print("true: \(x)")
}else{
    print("false: \(x)")
}

