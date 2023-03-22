import UIKit

class Person {
    var residence: Residence?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Residence {
    var rooms: [Room] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("Number of room is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let john = Person()
//john.residence = Residence()

// acessing properties through optional chainning
if let roomCount = john.residence?.numberOfRooms {
    print(roomCount)
} else {
    print("Not found")
}

//let someAddress =  Address()
//someAddress.buildingNumber = "85"
//someAddress.street = "Asia"
//john.residence?.address = someAddress

func createAddress() -> Address {
    print("createAddress function is called")

    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
john.residence?.address = createAddress()

// calling methods through optional chaining
if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

// accessing subscript through optional chaining
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

john.residence?[0] = Room(name: "Drawing")

let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("First room name id \(firstRoomName)")
} else {
    print("Unable to find room")
}

// acessing subscript of optional type
var testScore = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScore["Dev"]?[0] = 91
testScore["Bev"]?[0] += 1
//testScores["Brian"]?[0] = 72   // error bacause Brain key not in testScore

// linking multiple level of chaining

//If the type you are trying to retrieve isn’t optional, it will become optional because of the optional chaining.

//If the type you are trying to retrieve is already optional, it will not become more optional because of the chaining.

if let johnsStreet = john.residence?.address?.street{
    print("john street name is \(johnsStreet)")
} else {
    print("Unable to find address")
}

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress

if let johnsStreet = john.residence?.address?.street {
    print("John street name is \(johnsStreet)")
} else {
    print("Unable to find address")
}


// chaining method with optional return value

if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
    type(of: buildingIdentifier)
}

if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("identifier begins with \"The\".")
    } else {
        print("identifier doesn't begins with \"The\".")
    }
}
