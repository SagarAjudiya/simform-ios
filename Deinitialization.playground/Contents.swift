import UIKit

class  Race {
  var laps: Int

  init() {
    laps = 5
    print("Race Completed")
    print("Total laps:", laps)
  }

  deinit {
    print("Memory Deallocated")
  }
}

var result: Race? = Race()
result = nil

//In Swift, we only use deinitializers when we manually want to deallocate instances. Otherwise, Swift automatically does the deallocation.
//Deinitializers can only be used with classes and not with structs.
//Each class can only have a single deinitializer.


class Bank {
    static var coinsInBank = 10_000
    
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsTovend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsTovend
        return numberOfCoinsTovend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("New player joined game with \(playerOne?.coinsInPurse ?? 0) coins")

print("There are \(Bank.coinsInBank) coins left in Bank")

playerOne?.win(coins: 2_000)
print("playerOne won 2000 coins & now has \(playerOne?.coinsInPurse ?? 0) coins")

print("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
print("left the game")

print("The bank has now \(Bank.coinsInBank) coins")










