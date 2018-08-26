//: Playground - noun: a place where people can play

import UIKit


let someString = "Some string literal value"
let quotation = """
東亞奧會委員會（EAOC）原預定2019年在台中舉辦首場東亞青年運動會，不過卻被大陸施壓，蠻橫取消台中市的主辦權。對此，台灣智庫諮詢委員董立文表示，這是國際奧會「史無前例」的案例，與中國大陸的對台政策、兩岸一家親理念是背道而馳的；從這件事可以看出大陸國家領導人習近平，對中共的控制力並未達到百分之百，「有人對習近平不滿，在政策上扯後腿」。

董立文指出，這是一件非常莫名其妙、不是文明大國會做的事情，因為眾所周知，台中市早就申辦東亞青運成功，準備工作全都照計畫順利進行，臨時召開理事會，強迫取消台中的主辦權，整個過程非常蠻橫、粗魯。他強調，大陸做的這件事，跟中共的對台政策、兩岸一家親，是背道而馳的，「他們應該知道這樣做，對兩岸關係不僅沒有幫助，還會得到反效果，不知道為何會有這種愚蠢的決定。」
"""

//建立一個字串
var emptyString=""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing is see here")
}

//字串的可編輯性
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"
var c = constantString + variableString

//String are value type , not reference type (Python, Java)

//使用Character
for char in "Dog!🐶"{
    print(char)
}

let exclamationMark:Character = "!"
let catCharacters:[Character] = ["C","a","t","!","🐱"] //字元陣列
let catString = String(catCharacters) //陣列轉字串
print(catString)

//字串和字元的相加
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = " look over"
instruction += string2
welcome.append(exclamationMark) //字串.append(字元)

let multiplier = 3
let message = "\(multiplier) times 2.5 in \(Double(multiplier) * 2.5)"


//stringABC[stringABC.index] 中括弧內不能放數字 只能放String.Index這個資料類別 !!! 不能放Int !!!
let greeting = "Guten Tag!"
//              012345678910
greeting[greeting.startIndex] //.startIndex=起始位置0

greeting[greeting.index(before: greeting.endIndex)] //.endIndex=結束位置10
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.indices{
    print("\(greeting[index])", terminator:" ") //terminator預設為\n
}
print()

//insert and remove
var welcome1="hello"
welcome1.insert("!", at: welcome1.endIndex) //在末端插(放)入"!"
welcome1.insert(contentsOf: " there", at: welcome1.index(before: welcome1.endIndex)) //在"!"前面插入
welcome1.remove(at: welcome.index(before: welcome.endIndex)) //移除"!" (回傳值為移除的部分)
let range = welcome1.index(welcome1.endIndex, offsetBy: -6) ..< welcome1.endIndex //取末端offsetBy:-6 ～ 字串末端
welcome1.removeSubrange(range) //移除range設定的範圍(即末7字元)
welcome1

let greeting1 = "Hello, world!"
let index1 = greeting1.index(of: ",") ?? greeting1.endIndex //回傳","的位置 因為會是nil 所以要用 nil運算 ?? 給預設值
let beginning = greeting1[..<index1] //擷取開頭到index1(就是","之前)
let newString = String(beginning)
print("Yo! "+beginning)

greeting.count //回傳字串長度
