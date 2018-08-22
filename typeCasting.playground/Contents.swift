//: Playground - noun: a place where people can play

import UIKit

//Type Casting: 多型的存在就是為了"轉型" (就是遙控器可以遙控自己和自己的子類別) => 當參數需要接收多種子類別時 會用父類別宣告參數 讓參數視情況可以轉為它的子類別

//super class
class MediaItem{
    var name:String
    init(name:String){
        self.name = name
    }
}

//sub class
class Movie:MediaItem{
    var director:String
    init(name:String, director:String){
        self.director = director
        super.init(name: name)
    }
}

//sub class
class Song:MediaItem{
    var artist:String
    init(name:String, artist:String){
        self.artist = artist
        super.init(name: name)
    }
}

let library = [ // !!!這裡陣列會自動宣告成最接近的共同父類別!!!
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
];


//檢查是movie還是song 做法一
var movieCount = 0
var songCount = 0

for item in library{
    if item is Movie{ //用 is 來檢查這個實體的類型
        movieCount += 1
    }else if item is Song{
        songCount += 1
    }
}
print("Movie count: \(movieCount)")
print("Song count: \(songCount)")


//檢查是movie還是song 做法二
movieCount = 0
songCount = 0
print()

for item in library{
    if let movie = item as? Movie{ //用 as? 作判斷轉型 若失敗會回傳nil 所以要用optional binding
        print(type(of: movie))
        movieCount += 1
    }else if let _ = item as? Song{
        songCount += 1
    }
}
print()
print("Movie count: \(movieCount)")
print("Song count: \(songCount)")

//Any類型可以放任何的物件; AnyObject可以放任何的class物件
var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0)) //tuple
things.append(["Porche":911, "Toyota":86]) //dictionary
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman")) //class
things.append({ (name: String) -> String in "Hello, \(name)" }) //function type (closure)

for t in things{
    print("Type of t is: ", type(of: t))
}
