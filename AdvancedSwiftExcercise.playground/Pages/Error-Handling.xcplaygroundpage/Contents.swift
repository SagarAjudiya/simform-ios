//: [Previous](@previous)

import Foundation

//Create a password validation program. If length of password is less than 8 characters, it throws “Password too short” exception and if password is empty, throw “Empty password” exception.


enum ValidatePass: Error {
    case shortPassword
    case emptyPassword
}

func passwordCheck(pass: String) throws {
    if pass.isEmpty {
        throw ValidatePass.emptyPassword
    } else if pass.count < 8 {
        throw ValidatePass.shortPassword
    }
}

do {
    try passwordCheck(pass: "@123")
} catch ValidatePass.emptyPassword {
    print("Empty Password")
} catch ValidatePass.shortPassword {
    print("Short Password")
}


//Create a program for shopping cart. If desired quantity for an item is not available, throw exception.

enum ShoppingCart: Error {
    case itemNotAvailable
    case itemAvailable
}

func checkItem(item: Int) throws {
    throw item == 0 ? ShoppingCart.itemNotAvailable : ShoppingCart.itemAvailable
}

do {
    try checkItem(item: 10)
} catch ShoppingCart.itemNotAvailable {
    print("Item not available")
} catch ShoppingCart.itemAvailable {
    print("item is available")
}
