import UIKit

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

// checking type (is)

 var movieCount = 0
 var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Movie \(movieCount) and Songs \(songCount)")


// Downcasting (as? or as!)

for item in library {
    if let movie = item as? Movie {
        print(movie.name, movie.director)
    } else if let song = item as? Song {
        print(song.name, song.artist)
    }
}

// type casting for Any and AnyObject

var things: [Any] = []

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("Zero as an Int")
    case 0 as Double:
        print("Zero as a double")
    case let someInt as Int:
        print("Int",someInt)
    case let someDouble as Double where someDouble > 0:
        print("Double", someDouble)
    case let someString as String:
        print("String",someString)
    case let (x, y) as (Double, Double):
        print(x,y)
    case let movie as Movie:
        print(movie.name, movie.director)
    case let strConvert as (String) -> String:
        print(strConvert("SAGAR"))
    default:
        print("Default case")
    }
}

