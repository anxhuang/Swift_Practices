//: Playground - noun: a place where people can play

import UIKit


//initial就是初始化 property只有lazy property在initial做完前仍可以不給值 (optional type是nil)


var n=Int(36) //initial一個Int的Struct物件 和n:Int=36相同
print(n.distance(to: 90))

var s=String("thirtySix") //initial一個String的Struct物件
print(s.capitalized)

struct Fahrenheit{
    var temperature:Double = 32
    /* 可以寫init, 但一旦寫了, memberwise的initial引數提示就會消失
     init(){
     
     }
     */
}

var f  = Fahrenheit() //沒給值就是default initial
f.temperature

var ff = Fahrenheit(temperature: 45.0) //memberwise的initial有啟動
ff.temperature

//初始化的參數
struct Celsius{
    var temperatureInCelsius:Double
    //自訂多個初始化的參數，由使用者自訂。
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celcius:Double){
        temperatureInCelsius = celcius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureInCelsius

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelsius

let bodyTemperature = Celsius(37.0)
bodyTemperature.temperatureInCelsius

//用let宣告常數的情況 讓Color可以有三種initial的方式可以挑選
struct Color{
    let red, green, blue:Double
    init(red:Double, green:Double, blue:Double){ //為了要寫init(white:Double), 所以要多寫一份這個保留memberwise initial
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white:Double){
        red = white //變數名稱不會搞混不用self.
        green = white
        blue = white
    }
    init(){ //呼叫另一個self的init作default initial
        self.init(red: 1.0, green: 1.0, blue: 1.0)
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
let white = Color()

//設定method return optional type的意義: 代表此method可能出錯, 要使用者注意
//設定optional property type的意義: 在initial時不想特別給值(default值為nil)
class SurveyQuestion{
    let text:String
    var response:String?//default值為nil
    init(text:String){
        self.text = text //這裡做完text才會成為常數
    }
    
    func ask(){
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese"


//Default initializer
class ShoppingListItem{
    var name:String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

//memberwise initializer
struct Size{
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

//value type 的 initializer Delegation
struct Point{
    var x = 0.0, y = 0.0
}


struct Rect{
    var origin = Point()
    var size = Size()
    init(){}//因為前兩行已經確定有值 可以自己給default initializer
    
    init(origin:Point, size:Size){//因為有複寫 所以還他memberwise initializer
        self.origin = origin
        self.size = size
    }
    
    init(center:Point, size:Size){
        let originX = center.x - (size.width / 2) //center.x來自於Point的default value
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size) //initializer Delegation, 就是Value Type可以去呼叫自己的其他initializer來用 實現以多樣化引數的方式來初始化
    }
}
