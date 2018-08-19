//: Playground - noun: a place where people can play

import UIKit

//deinitialization 物件在被消滅前一刻做的事情(被給nil)

//銀行 vs 賭客
class Bank{ //只有type property和method 叫做functional class
    static var coinsInBank = 10_000; //有static是type property
    static func distribute(coins numberOfCoinsRequested:Int) -> Int{ //有static是type method (這裡是付錢給賭客)
        let numberOfCoinToVend = min(numberOfCoinsRequested, coinsInBank);
        coinsInBank -= numberOfCoinToVend;
        return numberOfCoinToVend;
    }
    
    static func receive(coins:Int){ // (從賭客身上回收)
        coinsInBank += coins;
    }
}

class Player{
    var coinsInPurse:Int;
    init(coins:Int){
        coinsInPurse = Bank.distribute(coins: coins); //初始化直接調用functional class的method來幫他初始化
    }
    
    func win(coins:Int){
        coinsInPurse += Bank.distribute(coins: coins);
    }
    
    deinit{ //注意! 因為是自動執行所以沒有()
        Bank.receive(coins: coinsInPurse);
    }
}

var playerOne:Player? = Player(coins: 100); //因為你有意圖要給他nil 所以宣告要用optional type
print("A new player has joined the game with \(playerOne!.coinsInPurse)");
print("There are now \(Bank.coinsInBank) coins left in the bank");



playerOne!.win(coins: 2_000); //因為你要取出optional type的東西 所以要用implicit optional type => Object!.property
print("Player has win! Coins of player: \(playerOne!.coinsInPurse)");
print("There are now \(Bank.coinsInBank) coins left in the bank");

playerOne = nil; //給nil的時候會自動去做deinit
print("Player has dead");
print("There are now \(Bank.coinsInBank) coins left in the bank"); //黑心銀行
print("PlayerOne has left the game.");

