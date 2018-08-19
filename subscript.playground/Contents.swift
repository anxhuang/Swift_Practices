//: Playground - noun: a place where people can play

import UIKit

struct TimeTable{
    let multiplier:Int;
    subscript(index:Int)->Int{ //不用引數名稱
        //get{          只有一行可以不用寫get{}
            return multiplier*index
        //}
    }
}

let threeTimesTable = TimeTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

//Dictionary也是subscript
var numberOfLegs = ["spider":8, "ant":6, "cat":4];
numberOfLegs["bird"] = 2;

//用rows和columns製作一個陣列
struct Matrix{
    let rows:Int, columns:Int;
    var grid:[Double];
    init(rows:Int, columns:Int){
        self.rows = rows;
        self.columns = columns;
        grid = Array(repeating: 0.0, count: rows * columns);
    }
    
    //檢查該座標的格子是否存在
    func indexIsValid(row:Int, column:Int) -> Bool{
        return row >= 0 && row < rows && column >= 0 && column < columns;
    }
    
    subscript(row:Int, column:Int) -> Double{
        get{
            assert(indexIsValid(row: row, column: column),"Index out of ranges");//若false則console輸出Index out of ranges
            return grid[(row * columns) + column];//找格子的位置 用面積概念: 列*行=方形面積 再加上末列的column數 (要畫圖看圖)
        }
        
        set{
            assert(indexIsValid(row: row, column: column),"Index out of ranges");//若false則console輸出Index out of ranges
            grid[(row * columns) + column] = newValue;//將值給到格子內
        }
    }
}

var matrix = Matrix(rows: 3, columns: 2); //3*2=>6 grid總數=6
matrix[0,0] = 1.5;
matrix[0,0];
matrix[2,0] = 5.0; //2*2+0 = 4,  grid[4] 第5格
matrix[2,0];
