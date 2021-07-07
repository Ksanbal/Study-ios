import UIKit

// Array
var evenNumbers: [Int] = [2, 4, 6, 8]
var evenNumbers2: Array<Int> = [2, 4, 6, 8]

evenNumbers.append(10)
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18, 20])

evenNumbers.isEmpty
evenNumbers.count

let firstItem = evenNumbers.first   // Optional을 반환
let lastItem = evenNumbers.last

if let firstItem = evenNumbers.first {
    print(firstItem)
}

evenNumbers.min()
evenNumbers.max()

evenNumbers[0]
evenNumbers[1]
evenNumbers[evenNumbers.count - 1]


let firstThree = evenNumbers[0...2]

evenNumbers.contains(4)

evenNumbers.insert(0, at: 0)
//evenNumbers.removeAll()

let temp = evenNumbers.remove(at: 0)    // 제거된 값을 반환
evenNumbers

evenNumbers[0...2] = [-2, 0 , 2]
evenNumbers

evenNumbers.swapAt(0, 9)


for num in evenNumbers {
    print(num)
}

for (index, num) in evenNumbers.enumerated() {
    print(index, num)
}

evenNumbers.dropFirst(3)    // 입력된 값만큼 빼고 반환
evenNumbers.dropLast()

evenNumbers.prefix(3)   // 처음부터 3개
evenNumbers.suffix(3)   // 마지막부터 3개





// Dictionary
var scoreDic: [String: Int] = ["Jason": 80, "Jay":95, "Jake":90]
var scoreDic2: Dictionary<String, Int> = ["Jason": 80, "Jay":95, "Jake":90]

let test = scoreDic["Jason"]    // Optional 반환

scoreDic.isEmpty
scoreDic.count

scoreDic["Jason"] = 99  // update
scoreDic

scoreDic["Jack"] = 100  // add
scoreDic

scoreDic["Jack"] = nil  // delete
scoreDic

for (name, score) in scoreDic {
    print(name, score)
}

for key in scoreDic.keys {
    print(key)
}

for value in scoreDic.values {
    print(value)
}

// 1. 이름, 직업, 도시 에 대해서 본인의 딕셔너리 만들기
// 2. 도시를 부산으로 업데이트
// 3. 딕셔너리를 받아서 이름과 도시 프린트 하는 함수 만들기

var info: [String: (String, String)] = ["sanbal" : ("Developer", "Seoul")]
info["sanbal"]!.1 = "Busan"

var myInfo: [String: String] = ["name": "sanbal", "job": "Developer", "live": "Seoul"]
myInfo["live"] = "Busan"
func printDic(dic: [String: String]) {
    guard let name = dic["name"], let live = dic["live"] else {
        print("Nope")
        return
    }
    print(name, live)
}
printDic(dic: myInfo)





// Set
var someSet: Set<Int> = [1, 2, 3, 1]

someSet.isEmpty
someSet.count

someSet.contains(4)
someSet.contains(1)

someSet.insert(1)
someSet

someSet.remove(1)
someSet





// Closure
//var multiplyClosure: (Int, Int) -> Int = {
//    (a: Int, b: Int) -> Int in return a * b
//}
var multiplyClosure: (Int, Int) -> Int = { a, b in
    return a * b
}
//var multiplyClosure: (Int, Int) -> Int = { $0 * $1 }

let result = multiplyClosure(5, 4)

// param으로 func을 받는 경우
func operateTwoNum(a: Int, b: Int, opertion: (Int, Int)->Int) -> Int {
    let result = opertion(a, b)
    print(result)
    return result
}

operateTwoNum(a: 5, b: 4, opertion: {a, b in return a * b})
operateTwoNum(a: 5, b: 4, opertion: {$0 / $1})


// Capturing Value
let voidClosure: () -> Void = {
    print("IOS 최고얍")
}
voidClosure()


var count = 0
let incrementer = {
    count += 1
}

incrementer()
incrementer()
incrementer()
incrementer()

count
