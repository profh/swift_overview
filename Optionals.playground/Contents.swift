//: Optionals

var costume: String? = "Werewolf"
println(costume)
var hat: String?
println(hat)

// let msg = costume + " dressed as Michael J Fox"
let msg = costume! + " dressed as Michael J Fox"

if let something = hat {
  // The value is not nil, use it with confidence
  let msg = something + " dressed as Michael J Fox"
  println(msg)
} else {
  // The value is nil
  let msg = "Something dressed as Michael J Fox"
  println(msg)
}