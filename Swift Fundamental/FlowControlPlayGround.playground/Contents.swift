import UIKit
import Foundation

// While
print("--- while")
var i = 10
while i < 10 {
    print(i)
    
    if i == 5 {
        break
    }
    
    i += 1
}

print("--- repeat") // Do While처럼 실행
i = 10
repeat {
    print(i)
    i += 1
} while i < 10

// For Loop
let closedRange = 0...10
let halfClosedRange = 0..<10

var sum = 0
for i in closedRange{
    print("--> \(i)")
    sum+=i
}
print("--> Total sum : \(sum)")

sum = 0
for i in halfClosedRange{
    print("--> \(i)")
    sum+=i
}
print("--> Total sum : \(sum)")


var sinVlaue: CGFloat = 0
for i in closedRange {
    sinVlaue = sin(CGFloat.pi/4 * CGFloat(i))
}

let name = "Jason"
for _ in closedRange {
    print("--> name: \(name)")
}


for i in closedRange {
    if i % 2 == 0 {
        print("--> 짝수 : \(i)")
    }
}
for i in closedRange where i % 2==0 {
    print("--> 짝수 : \(i)")
}
for i in closedRange {
    if i == 3 {
        continue
    }
    print("--> \(i)")
}

for i in closedRange {
    for j in closedRange {
        print("gugu -> \(i) * \(j) = \(i*j)")
    }
}

// Switch
let num = 8
switch num {
case 0:
    print("--> 0 입니다.")
case 1...9:
    print("--> 1~9 입니다.")
case 10:
    print("--> 10입니다.")
case _ where num % 2 == 0:
    print("짝수")
default:
    print("--> 나머지입니다.")
}

let pet = "bird"
switch pet {
case "dog", "cat", "bird":
    print("집동물이네요")
default:
    print("모르겠소요")
}

let coordinate = (x:10, y:10)
switch coordinate {
case (0,0):
    print("원점")
case (let x,0):
    print("x축이네요 \(x)")
case (0,let y):
    print("y축이네요 \(y)")
case (let x, let y) where x == y:
    print("둘이 같음 \(x), \(y)")
case (let x, let y):
    print("좌표 어딘가 \(x), \(y)")
}
