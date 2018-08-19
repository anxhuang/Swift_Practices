//: Playground - noun: a place where people can play

import UIKit

//method: The functions in "Type"
class Counter{
    var count = 0
    func increment(){
        count += 1
    }
    func increment(by amount:Int){
        count += amount
    }
    func reset(){
        count = 0
    }
}

var counter = Counter()
counter.increment() //count => 1
print(counter.count)
counter.increment(by: 5) //count => 6
print(counter.count)
counter.reset() //count => 0
print(counter.count)

//self
struct Point{
    var x = 0.0, y = 0.0
    func isToTheRightOf(x:Double) -> Bool{
        return self.x > x //因為和參數同名 要加self.做區隔
    }
    
    mutating func moveBy(x deltaX:Double, y deltaY:Double){
        x += deltaX //struct是value type 一定要用mutating func才能修改property
        y += deltaY
    }
    
    mutating func MoveBy(x deltaX:Double, y deltaY:Double){
        self = Point(x: x + deltaX, y: y + deltaY) //因為struct是value type 故可以實現對自己重新初始
    }
    //* MoveBy效果同moveBy
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("x==1.0")
}

//mutating
enum TriStateSwitch{
    case off, low, high
    mutating func next(){
        switch self {
            case .off:
                self = .low
            case .low:
                self = .high
            case .high:
                self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()
ovenLight.next()


//Type Methods
struct  LevelTracker{
    static var highestUnlockedLevel = 1 //有static是type property
    var currentLevel = 1 //store property
    
    static func unlock (_ level:Int){ //有static是type method
        if level > highestUnlockedLevel{
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level:Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    
    @discardableResult //表示advance這個func可以不接收 return
    mutating func advance(to level:Int) -> Bool{ //沒static是instance func
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        }else{
            return false
        }
    }
}

var player = LevelTracker() //建立一個玩家
player.advance(to: 2) //玩家要進入第二關 被回傳false
LevelTracker.highestUnlockedLevel //確認目前最高的Unlocked關卡 回傳1
LevelTracker.unlock(3) //解鎖到第3關
LevelTracker.isUnlocked(2) //檢查第2關是否已經解鎖
player.advance(to: 2) //前進第2關
player.currentLevel //確認玩家目前關卡
