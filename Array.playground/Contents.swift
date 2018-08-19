//: Playground - noun: a place where people can play

import UIKit

var someInts = [Int]()
someInts.count
someInts.append(3)
someInts = []

//someInts[0]=9 => Fatal error: Index out of range

//建立Array有default value
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

//用literal建立array
var shoppingList = ["Eggs","Milk"]

//存取和修改陣列
shoppingList.count

if shoppingList.isEmpty {
    print("empty")
}else{
    print("not empty")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
shoppingList.count

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
shoppingList

shoppingList[4...6] = ["Banana", "Apples"] // 把4,5,6的元素替換成 "Banana","Apples" (3個換2個)
shoppingList.insert("Maple Syrup", at: 0)
shoppingList.remove(at: 0)
firstItem = shoppingList[0]
let apples = shoppingList.removeLast()

//一個一個讀取陣列
//使用for in
for item in shoppingList{
    print(item)
}
for (index, value) in shoppingList.enumerated(){
    print("item \(index+1): \(value)")
}
