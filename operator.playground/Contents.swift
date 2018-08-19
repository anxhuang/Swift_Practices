//: Playground - noun: a place where people can play

import UIKit

//指定運算子 =
var str = "Hello, playground"
var x=123
var y=x
let z=x
x=456
print(y)
print(z)

//數學運算子 // +,-,*,/,%
9 % 4
2 ^ 8 //^是bit XOR 不是power
pow(2,8)

var a = 1
a += 2
a = a + 2

//比較運算子 ==, !=, >, <, >=, <=
//使用比較運算子 必得boolean值
let name="world"
if name == "world"{
    print("Hello world")
}else{
    print("I'm sorry\(name)")
}
