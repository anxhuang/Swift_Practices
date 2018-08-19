//: Playground - noun: a place where people can play

import UIKit

//===== global computed property =====
var myTotal:Int = 0{
    /*
     willSet{
     print("將傳進來\(newValue)");
     }
     */
    
    didSet{
        if myTotal < 0 {
            print("🐗");
            myTotal = 0;
        }else if myTotal > 100{
            print("🐗");
            myTotal = 100;
        }
        
        print("myTotal=\(myTotal)");
    }
}
//====================================

//static 存取修飾詞 => type property，即屬於type本身獨有的，呼叫要用type.property
struct SomeStructure{
    static var storedTypeProperty = "some value.";
    static var computedTypeProperty:Int{
        return 1;
    }
}

enum SomeEnumeration{
    static var storedTypeProperty = "some value.";
    static var computedTypeProperty:Int{
        return 6;
    }
}

class SomeClass{
    static var storedTypeProperty = "some value.";
    static var computedTypeProperty:Int{
        return 27;
    }
    //class存取修飾詞 => 和static功能相同但屬class才有，允許繼承後的子類別使用同名的computed type property並override
    class var overrideableComputedTypeProperty:Int{
        return 107;
    }
}

class SomeSubClass:SomeClass{
    override static var overrideableComputedTypeProperty:Int{
        return 207;
    }
}

//Local Scope
func someFunciton() {

    myTotal = 150; //可以存取global
    myTotal = -10;
    print(myTotal);
    
    var localMyTotal = 0;//local variable 區域變數
    localMyTotal += 100
    print(localMyTotal)
    
    //用type.property呼叫
    print(SomeStructure.computedTypeProperty);
    print(SomeEnumeration.computedTypeProperty);
    print(SomeClass.computedTypeProperty);
    print(SomeClass.overrideableComputedTypeProperty);
    print(SomeSubClass.overrideableComputedTypeProperty);
    
}

someFunciton()
