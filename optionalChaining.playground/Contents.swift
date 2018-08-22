//: Playground - noun: a place where people can play

import UIKit

//Optional Chaining: 當需要檢查nil時用後綴?來串連classes和property
class Person{
    var residence:Residence?; //此時Optional Type初值為nil
}

/*
class Residence{
    var numberOfRooms = 1;
}

let john = Person();
john.residence = Residence(); //實體建立後residence就不是nil

//幾乎都配合optional binding使用
if let roomCount = john.residence?.numberOfRooms{
    print("John's residence has \(roomCount) room(s).");
}else{
    print("Unable to retrieve the nubmer of rooms");
}
*/

class Residence{
    var rooms = [Room](); //[Room]物件的空陣列
    var numberOfRooms:Int{
        return rooms.count;
    }
    
    subscript(i:Int) -> Room{ //用residence[i]來存取rooms
        get{
            return rooms[i];
        }
        set{
            rooms[i] = newValue;
        }
    }
    
    func printNumberOfRooms(){
        print("The number of rooms is \(numberOfRooms)");
    }
    
    var address:Address?; //初值nil
}

class Room{
    let name:String;
    init(name:String){
        self.name = name;
    }
}

class Address{ //三個都是nil
    var buildingName:String?;
    var buildingNumber:String?;
    var street:String?;
    
    func buildingIdentifier() -> String?{ //return Optional Type
        if let buildingNumber = buildingNumber, let street = street{ //連兩個Optional Binding
            return "\(buildingNumber)\(street)";
        }else if buildingName != nil{
            return buildingName;
        }else{
            return nil;
        }
    }
}


let john = Person();

let johnHuouse = Residence();
johnHuouse.rooms.append(Room.init(name: "Living Room"))
johnHuouse.rooms.append(Room.init(name: "Kitchen"))
john.residence = johnHuouse

if let roomCount = john.residence?.numberOfRooms{ //沒有建立residence => nil => else block
    print("John's residence has \(roomCount) room(s).");
}else{
    print("Unable to retrieve the nubmer of rooms");
}

let someAddress = Address();
someAddress.buildingNumber = "29";
someAddress.street = "Acacia Road";

if (john.residence?.address = someAddress) != nil { //把整個給值的部分包起來 去判斷給值是否成功
    print("給值成功");
} else{
    print("給值不成功"); //因為residence是nil
}

if let firstRoomName = john.residence?[0].name{
    print("The first room name is\(firstRoomName)")
}else{
    print("Unable to retrive the first room name")
}
