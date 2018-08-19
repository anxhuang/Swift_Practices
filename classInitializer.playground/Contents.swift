//: Playground - noun: a place where people can play

import UIKit

class Vehicle{ //base class
    var numberOfWheels = 0
    var description:String{
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle() //直接做default initializer
print("Vehicle: \(vehicle.description)")

class Bus:Vehicle{
    //一般沒寫會自動隱含 init(){super.init()}
}
let bus=Bus()
bus.numberOfWheels = 4
print(bus.numberOfWheels)



//有寫init()的情況
class Bicycle:Vehicle{
    override init(){ //因為super也有init() 所以要寫override
        super.init() //在這行之前不能存取super的東西
        numberOfWheels = 2
    }
}

//Designate initializer 和 convenience initializer
class Food{
    var name:String;
    init(name:String){ //Designate initializer若寫成由使用者給值 繼承的subClass每個都會要使用者給值
        self.name = name;
    }
    
    convenience init(){ //因為init()被覆寫了 所以用convenience initializer來取代 => 以後subClass就都會有初始值
        self.init(name: "[Unnamed]");
    }
}

let nameMeat = Food(name: "Bacon");
nameMeat.name;
let mysteryMeat = Food();
mysteryMeat.name;

class RecipeIngredient:Food{
    var quantity:Int;
    init(name:String, quantity:Int){ //引數不同不用override
        self.quantity = quantity;
        super.init(name: name);
    }
    
    override convenience init(name:String){ //引數和Food內的init(name:String)相同 所以要override
        self.init(name: name, quantity: 1)
    }
    
}

let oneMysteryItem = RecipeIngredient(); //繼承自Food的convenience init()
let oneBacon = RecipeIngredient(name: "Bacon"); //繼承自RecipeIngredient的convenience init(name:String)
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6); //繼承自RecipeIngredient的init(name:String, quantity:Int)


class ShoppingListItem:RecipeIngredient{ //沒寫init()所以全部繼承下來
    var purchased = false;
    var description:String{
        var output = "\(quantity) x \(name) ";
        output += purchased ? "✔︎":"✖︎";
        return output;
    }
}


var breakfastList = [ //直接建立一個裡面放物件的Array
    ShoppingListItem(), 
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
];

breakfastList[0].name = "orange juice"
breakfastList[0].purchased = true;
for item in breakfastList{
    print(item.description);
}


//Failable Initializers (就是Optional的意思，initial時有可能傳出nil)
struct Animal{
    let species:String;
    init?(species:String){
        if species.isEmpty { return nil};
        self.species = species;
    }
}

//Required Initializers (類似Java裡abstract的概念，subClass必須實作superClass的required init(), 不用寫override改寫required )
class SomeClass{
    var a = 0;
    var b = 0;
    required init(){
    }
}

class SomeSubClass:SomeClass{
    required init() {
        //若有要繼承property一樣要寫super.init()
    }
}

//Setting a Default Property Value with a Closure or function (需要建立實體但不能一行解決時，用Closure把多行的內容包在裡面回傳)
class SomeOtherClass{
    let someProperty:SomeClass = { // 注意!!! 這是property不是class，這裡的:SomeClass只有宣告型態 不是繼承!!!
        let someClass = SomeClass();
        someClass.a = 5;
        someClass.b = 10;
        return someClass;
    }();
}


