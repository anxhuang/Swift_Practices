//: Playground - noun: a place where people can play

import UIKit

//定義錯誤: 要繼承Error這個protocol，以販賣機的作業模式為例
enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int) //associated value
    case outOfStock
}

//丟出錯誤
//throw VendingMachineError.insufficientFunds(coinsNeeded: 45)


struct Item{ //商品的基本屬性
    var price:Int
    var count:Int
}

class VendingMachine{
    var inventory = [ //販賣機的商品
        "Candy Bar":Item(price: 12, count: 7),
        "Chips":Item(price: 10, count: 4),
        "Pretzels":Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0 //投入的金額
    
    func vend (itemNamed name:String) throws {
        //"我保證" input的name指向inventory有值給item "否則"
        guard var item = inventory[name] else{
            throw VendingMachineError.invalidSelection
        }
        //"我保證" item庫存數量>0 "否則"
        guard item.count > 0 else{
            throw VendingMachineError.outOfStock
        }
        //"我保證" item金額少於投入的金額 "否則"
        guard item.price <= coinsDeposited else{
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        print("Dispensing \(name)")
    }
}

//人和喜歡的商品
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"
];

//買商品的method 這裡用try + func做throws 稱為propagate(向上傳遞) <= 錯誤處理方式第一種
func buyFavoriteSnack(person:String, vendingMachine:VendingMachine) throws{
    let snackName = favoriteSnacks[person] ?? "Candy Bar";
    try vendingMachine.vend(itemNamed: snackName)
}

//
struct PurchaseSnack{
    let name:String;
    //init也可以做propagate
    init(name:String, vendingMachine:VendingMachine) throws{
        try vendingMachine.vend(itemNamed: name);
        self.name = name;
    }
}

//終於要開始販賣了...
var vendingMachine = VendingMachine();
vendingMachine.coinsDeposited = 8;
do{ //用do...try...catch處理錯誤 <= 錯誤處理方式第二種
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine); //若沒有處理throw不會過
    print("Success! Yum.");
}catch VendingMachineError.invalidSelection{
    print("invalid selection.");
}catch VendingMachineError.outOfStock{
    print("out of Stock");
}catch VendingMachineError.insufficientFunds(let coinsNeeded){ //用let 去接收associated value
    print("Insufficient funds. please insert an additional \(coinsNeeded) coins.");
}catch{
    print("unexpected error:\(error)");
}

//用try?處理錯誤 當錯誤發生就會產生nil <= 錯誤處理方式第三種
if (try? buyFavoriteSnack(person: "Bob", vendingMachine: vendingMachine)) == nil {
    print("錯誤發生 產生nil")
}

//用try!處理就是自殺式處理 賭他不發生錯誤 <= 錯誤處理方式第四種
try! buyFavoriteSnack(person: "Eve", vendingMachine: vendingMachine)


/* 補充範例
 func processFile(filename:String) throws{
     if exists(filename){
         let file = open(filename); //IO典型地容易產生錯誤
         defer{ //defer代表不管錯誤有無產生 在跳出func方法前一定會執行
            close(file); //例如關檔案是一定要做的事
         }
         while let line = try file.readline(){
         }
     }
}
 */
