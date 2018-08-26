print("Hello world!")

var myVariable = 7 //宣告變數
myVariable = 22
let myConstant = 2018 //宣告常數

let implicitInteger = 70
let implicitDouble = 70.0

let explicitDouble:Double = 70
//let explicitInteger:Int  = 70.5
		
//print(myVariable)
//print(myConstant)

let a = 0.5           //不明確宣告
let b:Double = 0.5    //明確宣告

let apple = 3
let orange = 5
/*
let appleSummary = " I have " + String(apple) + " apples."
let fruitsSummary = " I have " + String(apple) + " apples and " + String(orange) + " oranges. total是："+String(apple+orange)+" fruits."
*/

let label = "The width is "
let width = 94
//運算要用相同的資料類型
let widthLabel = label + String(width)
let widthLabel1 = "\(label) \(width)."

//字串插補
let appleSummary = "I have \(apple) apples."
let fruitSummary = "I have \(apple) apples and (orange) oranges. total是: \(apple+orange) fruits."

let quotation = """
（中央社記者汪淑芬台北23日電）今天是二十四節氣中的大暑，中央氣象局預報，台灣東部海面的熱帶性低氣壓可能發展為輕度颱風，天氣不穩定，易有短暫陣雨或雷雨。

  根據氣象局最新天氣資料，熱帶性低氣壓清晨2時位置在台北東方240公里海面上，路徑將朝北轉北北西方向，先通過台灣北部外海，再往大陸浙江移動，強度可能發展為輕度颱風。

    氣象局說，受熱帶性低氣壓影響，台灣天氣不穩定，北部、南部及宜蘭、花蓮易有短暫陣雨或雷雨，其他地區也有局部短暫陣雨或雷雨，午後各地可能有局部大雨。

      今天雖是大暑，天氣並沒有特別熱，氣象局預報各地高溫約攝氏32至35度，沒下雨時感受較悶熱。
"""

print(quotation)
