//: Protocols

protocol ExampleProtocol {
  var simpleDescription: String { get }
  mutating func adjust()
}

//** Having a class adopt the protocol **//
class SimpleClass: ExampleProtocol {
  var simpleDescription: String = "A very simple class."
  var anotherProperty: Int = 69105
  func adjust() {
    simpleDescription += "  Now 100% adjusted."
  }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription


//** Having a struct adopt the protocol **//
struct SimpleStructure: ExampleProtocol {
  var simpleDescription: String = "A simple structure"
  mutating func adjust() {
    simpleDescription += " (adjusted)"
  }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//** using protocols **//
protocol Food {
  var caloriesPerGram: Double { get }
}

struct Cat {
  var calorieCount: Double = 0
  mutating func eat(food: Food, grams: Double) {
    calorieCount += food.caloriesPerGram * grams
  }
}

struct Kibble: Food {
  var caloriesPerGram: Double {
    return 40
  }
}

let catFood = Kibble()
var dusty = Cat()

dusty.eat(catFood, grams: 30)
