//: Playground - noun: a place where people can play

import UIKit

var characters = ["kirk": "TOS", "spock": "TOS", "picard": "TNG", "janeway": "VOY", "scotty": "TOS", "sisko": "DS9", "kira": "DS9", "chakotay": "VOY", "seven": "VOY", "dax": "DS9", "tuvok": "VOY", "tpol": "ENT", "riker": "TNG", "troi": "TNG"]

var series = ["TOS": "The Original Series", "NTG": "The Next Generation", "DS9": "Deep Space 9", "VOY": "Voyager", "ENT": "Enterprise"]

var runtimes = ["TOS": [1966, 1969], "NTG": [1987, 1994], "DS9": [1993, 1999], "VOY": [1995, 2001] , "ENT": [2001, 2004]]

var captains = ["kirk": "ncc1701", "sisko": "nx74205", "janeway": "ncc74656", "picard": "ncc1701d"]

var firstOfficers = ["spock", "kira", "chakotay", "riker", "tpol"]

var vulcans = ["spock", "tuvok", "tpol"]

var humans = ["sisko", "kirk", "picard", "chakotay", "janeway", "riker", "seven"]

var females = ["kira", "dax", "tpol", "janeway", "troi", "seven"]

var ships = ["ncc1701": "Enterprise", "nx74205": "Defiant", "ncc1701d": "Enterprise", "ncc74656": "Voyager", "nx01": "Enterprise"]


// Create a comma-separated list of humans in alphabetical order
humans.sort(<)
var people = ", ".join(humans)


// Create a Captain structure with name and ship as properties

struct Captain {
  var name: String
  var ship: String
  
  init(name: String, ship: String){
    self.name = name
    self.ship = ship
  }
}

// Create two comma-separated lists of ships -- one captained by men and the other by women
var arrayCaptains = map(captains){ Captain(name: $0, ship: $1) }
var maleCaptainedShips = arrayCaptains.filter{!contains(females, $0.name)}.map({$0.ship})
var mList = ", ".join(maleCaptainedShips)
var femaleCaptainedShips = arrayCaptains.filter{contains(females, $0.name)}.map({$0.ship})
var fList = ", ".join(femaleCaptainedShips)


// Get an aphlabetical list of the names of the ships captained by men and another by women
struct Ship {
  var registry: String
  var name: String
  
  init(registry: String, name: String){
    self.registry = registry
    self.name = name
  }
}

var mListShips = map(ships){ Ship(registry: $0, name: $1) }.filter{contains(maleCaptainedShips, $0.registry)}.map({$0.name})
mListShips.sort(<)
var mList2 = ", ".join(mListShips)

var fListShips = map(ships){ Ship(registry: $0, name: $1) }.filter{contains(femaleCaptainedShips, $0.registry)}.map({$0.name})
fListShips.sort(<)
var fList2 = ", ".join(fListShips)


// Get the names of all series that had a vulcan character in it
struct Series {
  var short: String
  var name: String
  
  init(short: String, name: String){
    self.short = short
    self.name = name
  }
}

struct Character {
  var name: String
  var series: String
  
  init(name: String, series: String){
    self.name = name
    self.series = series
  }
}
var arraySeries = map(series){ Series(short: $0, name: $1) }
var arrayCharacters = map(characters){ Character(name: $0, series: $1) }

var vulcanCharacters = arrayCharacters.filter{contains(vulcans, $0.name)}
vulcanCharacters
var seriesShortWithVulcans = vulcanCharacters.map(){$0.series}
seriesShortWithVulcans
var seriesNameWithVulcans = arraySeries.filter{contains(seriesShortWithVulcans, $0.short)}.map(){$0.name}
seriesNameWithVulcans

// or the code golfing way and do it in one [hard-to-read] line...
var seriesWithVulcans = map(series){ Series(short: $0, name: $1) }.filter{contains(map(characters){ Character(name: $0, series: $1) }.filter{contains(vulcans, $0.name)}.map({$0.series}), $0.short)}.map{$0.name}
seriesWithVulcans


// Get the names of the first officers who were female
// (figured you needed a break with an easy one right about now...)
var femaleFirstOfficers = firstOfficers.filter{contains(females, $0)}
femaleFirstOfficers


// Get the names of the first officers who were in a series that started before 2000

struct Runtime {
  var series: String
  var startYear: Int
  var endYear: Int
  
  init(series: String, started: Int, ended: Int){
    self.series = series
    self.startYear = started
    self.endYear = ended
  }
}

var arrayRuntimes = map(runtimes){ Runtime(series: $0, started: $1[0], ended: $1[1]) }
arrayRuntimes

var seriesBeforeY2K = arrayRuntimes.filter{ $0.startYear < 2000 }.map{$0.series}
seriesBeforeY2K

//var charactersBeforeY2K = arrayCharacters.filter{contains(seriesBeforeY2K, $0.series)}.map{$0.name}
//charactersBeforeY2K
//
//var firstOfficersBeforeY2K = charactersBeforeY2K.filter{ contains(firstOfficers, $0) }
//firstOfficersBeforeY2K.sort(<)

// again the code golfing way...
var firstOfficersBeforeY2K = map(characters){ Character(name: $0, series: $1) }.filter{contains(map(runtimes){ Runtime(series: $0, started: $1[0], ended: $1[1]) }.filter{ $0.startYear < 2000 }.map{$0.series}, $0.series)}.map{$0.name}.filter{ contains(firstOfficers, $0) }
firstOfficersBeforeY2K.sort(<)
