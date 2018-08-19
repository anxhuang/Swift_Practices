//: Playground - noun: a place where people can play

import UIKit

let twoThousand:UInt16 = 2000
let one:UInt8 = 1
let twoThsandAndOne = twoThousand + UInt16(one) //要轉型到範圍大的

let three = 3
let pointOneFourOneFive = 0.1415
let pi = Double(three) + pointOneFourOneFive
let intergerPi = Int(pi)
Int(1.51)  //floor , 後面會無條件捨去

//type Alias 暱稱
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.max

//boolean
let orangesAreOrange = true
let turuipsAreDelicious = false

if turuipsAreDelicious {
    print("Mmmm, tasty turuips!")
}else{
    print("Eww, turuips are horrible.")
}

/*
 let i = 1   //和Python或c不同 1不視為true
 if i {
 
 }
 */

//Tuple
let http404Error = (404, "Not Found")

//Tuple拆解
let (statusCode, statusMessage) = http404Error;
statusCode;
statusMessage;

//可使用省略運算子 "_" (底線） 用來省略變數
let (justTheStatusCode, _) = http404Error;
justTheStatusCode;


//使用索引取值
http404Error.0;
http404Error.1;

//使用tag取值
let http200Status = (statusCode:200, description:"OK");
http200Status.statusCode;
http200Status.description;

//Optional Type: Int? Float? Double? , 當不明確宣告的變數在接收return有可能為nil(即null)時 , 會自動轉型！！！ 避免錯誤！！！
let possibelNumber = "123"
let convertedNumber = Int(possibelNumber)
//let convertedNumber2:Int = Int(possibelNumber) //compiler不會過
let convertedNumber2:Int? = Int(possibelNumber) //等同於沒加:Int?

if convertedNumber != nil {
    print("轉換成功")
}else{
    print("轉換失敗")
}

var serverResponseCode:Int? = 404 //用var宣告
serverResponseCode = nil //可以給nil

//Optional Type 有default value = nil
var surveyAnswer:String?
//print(surveyAnswer) //會有警告

if convertedNumber != nil {
    print("轉換成功, 內容是: \(convertedNumber!)") //會有警告, 要給定作法, 指定強制取值(forced unwrapping) => 變數!
}

//Optional Binding: 將if和Forced unwrapping結合, 判斷完後自動unwrapping
if let actralNumber = Int(possibelNumber) {
    print("轉換成功, 內容是: \(actralNumber)")
}else{
    print("轉換失敗")
}

//巢狀Optional Binding可以改寫為一行
if let firstNumber = Int("4"){
    if let secondNumber = Int("42"){
        if firstNumber < secondNumber && secondNumber < 100{
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 { //&&可以換, ,不可以換&&
    print("\(firstNumber) < \(secondNumber) < 100")
}


//Oprional Type: Force unwrapping
let possibleString:String? = "An optional string"
let forcedString:String = possibleString!
//Implicitly Optinal Type: no need to do anything 和其他語言的預設變數一樣 不會有null警示 => 宣告資料型態的時候加! :Int! , Double!
let assumedString:String! = possibelNumber
let implicitString:String = assumedString

//debugging:  assert(condition, "print something when false")
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
