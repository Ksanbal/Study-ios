import UIKit

// Tuple
let coordinates = (4,6)

let x = coordinates.0
let y = coordinates.1

// Named Tuple
let coordinatesNamed = (x:2, y:3)

let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let (x3, y3) = coordinatesNamed

x3
y3

// Boolean
let yes = true
let no = false

let is4GranterThan5 = 4 > 5

if is4GranterThan5 {
    print("참")
} else {
    print("거짓")
}

let name1 = "Jin"
let name2 = "Jason"

let isJason = name2 == "Jason"
let isMale = true

let jasonAndMale = isJason && isMale
let jasonOrMale = isJason || isMale


let greetingMessage: String = isJason ? "Hello Jason" : "Hello Somebody"
print(greetingMessage)


// Scope

var hours = 50
let payPerHour = 10000
var salary = 0

if hours > 40 {
    let extraHours = hours - 40
    salary += extraHours * payPerHour * 2
    hours -= extraHours
}

salary += hours * payPerHour
print(salary)
