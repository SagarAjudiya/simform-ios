import UIKit

enum CompassPoint : CaseIterable{
    case north
    case south 
    case east
    case west
}
let direction = CompassPoint.allCases.count

var directionToHead = CompassPoint.south

switch directionToHead {
case .north :
    print("North")
case .south :
    print("South")
case .east :
    print("East")
case .west :
    print("West")
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
for i in Beverage.allCases {
    print(i)
}
 

enum Barcode {
    case upc (Int, Int, Int, Int)
    case qrCode (String)
}

var productBarcode = Barcode.upc(8, 52346, 45855, 3)
print(productBarcode)
productBarcode = .qrCode("FHRUEHUBVUWEHFUHWE")
print(productBarcode)

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

//If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the case name, for brevity:

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthOrder = Planet.earth.rawValue

let positiontoFind = 3
if let somePlanet = Planet(rawValue: positiontoFind) {
    switch somePlanet {
    case .earth:
        print("Earth")
    default:
        print("Default Case")
    }
}
else {
    print("No planet at position \(positiontoFind)")
}
        
