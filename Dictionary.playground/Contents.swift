//: Playground - noun: a place where people can play

import UIKit

//建立與清空(Empty) Dictionary
var namesOfIntegers = [Int:String]();
namesOfIntegers[16] = "sixteen" //沒有key會自己新增
namesOfIntegers = [:]

//使用純值來宣告 Dictionary
var airports = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]
airports.count

if airports.isEmpty {
    print("Empty")
}else{
    print("Not Empty")
}

airports["LHR"]="London" //沒有key會自己新增
airports["LHR"]="London Hearthrow" //有key的話就是更新 (沒有回傳值!!)

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") { //用方法修改 要處理nil (會有回傳值!!)
    print("oldValue: \(oldValue)")
}else{
    print("Update is failure")
}

airports["APL"] = "Apple International"
airports["APL"] = nil //將此key-value組清空，等同於removeValue

if airports.removeValue(forKey: "DUb") == nil {
    print("remove失敗")
}

/*guard ... else{} 只做false的block , 且一定要throw或return, 所以要用在func內
 
guard let removeValue = airports.removeValue(forKey: "DUb") else {
    print("remove失敗")
    throw
}*/

//一個一個抓key-value
for (airportCode, airportName) in airports {
    print("\(airportCode):\(airportName)")
}

for airportCode in airports.keys {
    print(airportCode)
}

//convert to array
let airportCode = [String](airports.keys)
let airportValue = [String](airports.values)
/* let airportValue:[String] = airports.values //Error */
/*let airportValue = airports.values //Error */
