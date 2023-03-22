import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyfavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}


// handling errors using de catch

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do{
    try buyfavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success!")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection")
} catch VendingMachineError.outOfStock {
    print("Out of stock")
} catch VendingMachineError.insufficientFunds(coinsNeeded: let coinsNeed) {
    print("Insufficient fund, Insert \(coinsNeed) coins")
} catch {
    print("Error: \(error)")
}


func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}

func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
        print("Invalid selection, out of stock, or not enough money.")
    }
}

// converting errors to optional values

//func fetchData() -> Data? {
//    if let data = try? fetchDataFromDisk() { return data }
//    if let data = try? fetchDataFromServer() { return data }
//    return nil
//}


//You can use a defer statement even when no error handling code is involved.


//Steps For Error Handling in Swift
//    Create an enum that represents the types of errors.
//    Create a throwing function using the throws keyword.
//    Call the function using the try keyword.
//    Wrap the code with try in the do {...} block and add the catch {...} block to handle all errors.


// create enum of errors
enum DivisionError: Error {
  case dividedByZero
}

// create throwing functiom
func division(numerator: Int, denominator: Int) throws {
    if denominator == 0 {
        throw DivisionError.dividedByZero
    } else {
        let result = numerator / denominator
        print(result)
    }
}

// function call using try keyword
//try division(numerator: 10, denominator: 0)

// handling error using do-catch statement
do {
    try division(numerator: 10, denominator: 0)
    print("Valid division")
} catch DivisionError.dividedByZero {
    print("Error:")
}


// disable error handling

try! division(numerator: 10, denominator: 5)

//In Swift, sometimes we can be confident that the throwing function won't throw an error at runtime.
//when we use try!, we don't need to use the do-catch statement.
//Note: If we use try! and there is an error, our app will simply crash.

