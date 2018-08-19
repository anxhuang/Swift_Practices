//: Playground - noun: a place where people can play

import UIKit

var letters = Set<Character>();
letters.count
letters.insert("a")
letters.insert("c")
letters = []

//使用literal 建立Set
var favoriteGenres:Set = ["Rock", "Classical", "HipHop"]

//set的存取和修改
favoriteGenres.count
favoriteGenres.isEmpty
favoriteGenres.insert("Jazz")

if let removeGenre = favoriteGenres.remove("rock") {
    print("\(removeGenre) 移除成功")
}else{
    print("移除失敗");
}

if favoriteGenres.contains("Funk") {
    print("有");
}else{
    print("沒有");
}

//一個一個讀set
for genre in favoriteGenres {
    print("\(genre)");
}

//set的集合運算
let oddDigits:Set = [1,3,5,7,9]
let evenDigits:Set = [0,2,4,6,8]
let singleDigitPrimeNumbers:Set = [2,3,5,7]

oddDigits.union(evenDigits).sorted() //聯集
oddDigits.intersection(evenDigits).sorted() //交集
oddDigits.subtracting(singleDigitPrimeNumbers).sorted() //減去
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() //差集

let houseAnimals: Set = ["🐶","🐱"]
let farmAnimals: Set=["🐮","🐔","🐑","🐶","🐱"]
let cityAnimals: Set=["🐦","🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
cityAnimals.isDisjoint(with: houseAnimals)
