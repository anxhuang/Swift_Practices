//: Playground - noun: a place where people can play

import UIKit

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("\(name)")
}

let numberOfLegs = ["spider":8, "ant":6, "cat":4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for index in 1...5 {
    print("\(index) time 5 is \(index * 5)")
}

let base = 5
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power \(power) is \(answer)")

//搭配stride() 即其他語言的range()
let minutes = 60
for tickMark in 0..<minutes{
    print(tickMark)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("使用to:\(tickMark)")
}

for tickMark in stride(from: 0, through: minutes, by: minuteInterval) {
    print("使用throuth:\(tickMark)")
}

let hours = 12	
let hourInterval = 3
for tickMark in stride(from: 0, through: hours, by: hourInterval) {
    print("使用throuth:\(tickMark)")
}

//square board game 從1走到25的遊戲(看圖)
let finalSquare = 25
var board = [Int](repeating:0, count:finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02;
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08;

var square = 0
var diceRoll = 0
while square < finalSquare {
    diceRoll += 2 //骰出2,4,6
    if diceRoll >= 7 {
        diceRoll = 1
    }
    
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}

print("game over")

//repeat-while
var payment = 300
repeat {
    payment -= 100
} while payment > 500
payment
