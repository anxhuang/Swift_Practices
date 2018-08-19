//: Playground - noun: a place where people can play

import UIKit

//Closure匿名函數
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"];



//作法一：非closure(匿名)作法
func backward(_ s1:String,_ s2:String) -> Bool{
    return s1 > s2;
}

var reverseNames = names.sorted(by: backward);





//作法二：closure(匿名)作法
reverseNames = names.sorted(by: {  //<=closure正規寫法好習慣
    (s1:String,s2:String) -> Bool in
    return s1 > s2
})

//因為sorted()有規定inpuTtype和returnType 故closure可以省略
reverseNames = names.sorted(by: {
    s1,s2 in
    return s1 > s2
})

//因為statement只有一行 故可以省略return
reverseNames = names.sorted(by: {
    s1,s2 in s1 > s2
})

//然後 s1 和 s2 在這裡可以用 $0 和 $1 取代 (不過執行次數會多一次？)
reverseNames = names.sorted(by: {$0 > $1})

//若傳出為bool, $0 和 $1可以省略
reverseNames = names.sorted(by: > )

//Trailing Closure: 若Closure身為最後一個代入的參數, 可以把{}放到後面; 若是唯一的參數, ()亦可以省略
reverseNames = names.sorted{
    (s1:String,s2:String) -> Bool in
    return s1 > s2
}

//Trailing Closure:
let digitNames = [
    0: "Zero",  1: "One",2: "Two",  3: "Three", 4: "Four",
    5: "Five",  6: "Six",7: "Seven",8: "Eight", 9: "Nine"
];

let numbers = [16, 58, 510];
let strings = numbers.map{
    (number:Int) -> String in
    var number = number; //因為input的number是let不好用 所以多var一個同名的來用
    var output = "";
    repeat{
        output = digitNames[number % 10]! + output;  //510餘數為0 -> Zero + output (因為個位數都先做 所以output放後面)
        number /= 10; //510的商為51
    }while  number > 0
    return output;
};

print(numbers)
print(strings)

//上面的map若用for寫
var strings1:[String]=[];
for i in numbers {
    var number = i; //因為i是let不好用 所以多var一個number來用
    var output = "";
    repeat{
        output = digitNames[number % 10]! + output;  //510餘數為0 -> Zero + output (因為個位數都先做 所以output放後面)
        number /= 10; //510的商為51
    }while  number > 0
    strings1.append(output);
}
print(numbers)
print(strings1)
