//: Playground - noun: a place where people can play

import UIKit

//Nested Type: 巢狀Type，當TypeB只建立來給某個TypeA使用，一般會把B直接寫在A裡面，即為巢狀
struct BlackjackCard{
    enum Suit:Character{ //巢狀第一層 struct > enum
        case spades = "♠︎", hearts = "♥︎", diamonds = "♦︎", clubs = "♣︎"
    }
    enum Rank:Int{
        case two = 2, three, four, five, six, seven, eight, nine, ten;
        case jack, queen, king, ace;
        
        struct Values{ //巢狀第二層 struct > enum > struct
            let first:Int, second:Int?;
        }
        var values:Values{ //computed property
            switch self{
            case .ace:
                return Values(first: 1, second: 11);
            case .jack, .queen, .king:
                return Values(first: 10, second: nil);
            default:
                return Values(first: self.rawValue, second: nil);
            }
        }
    }
    let rank:Rank, suit:Suit; //在BlackjackCard裡面建立兩個自訂Type的實體
    var description:String{ //computed property
        var output = "suit is \(suit.rawValue),";
        output += " value is \(rank.values.first)";
        if let second = rank.values.second{ //optional binding
            output += " or \(second)"
        }
        return output;
    }
}

let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades);
print(theAceOfSpades.description);



