//: [Previous](@previous)

import Foundation

//Create following string manipulation functions using string extensions:
//    •    Add a character in a string at 5th position
//    •    Replace one character with other in a string
//    •    Remove white spaces from string
//    •    Get number of words in a string

extension String {
    
    mutating func addChatAtFive(char: Character) {
        var newIndex = index(startIndex, offsetBy: 5)
        insert(char, at: newIndex)
    }
    
    mutating func replaceChar(old: String, new: String) {
        self = self.replacingOccurrences(of: old, with: new)
    }
    
    mutating func removeSpace(old: String, new: String) {
        self = self.replacingOccurrences(of: old, with: "")
    }
    
    mutating func numOfWord() -> Int {
        var wordCnt = 1
        
        // second way
//        for i in 0...self.count-1 {
//            if self[self.index(startIndex, offsetBy: i)] == " " {
//                wordCnt += 1
//            }
//        }
        
        for char in self {
            if char == " "{
                wordCnt+=1
            }
        }
        return wordCnt
    }
    
}

var name = "sagar"
name.addChatAtFive(char: "n")
name.replaceChar(old: "a", new: "z")

var str = "A B    C "
str.removeSpace(old: " ", new: "")
str.numOfWord()

var myStr = "This is car"
myStr.numOfWord()
