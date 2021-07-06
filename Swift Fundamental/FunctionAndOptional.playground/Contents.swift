import UIKit


func printName(){
    print("My name is Sanbal")
}
printName()


func printMultipleOfTen(value: Int){
    print("\(value) * 10 = \(value * 10)")
}
printMultipleOfTen(value: 5)


func printTotalPrice(price: Int, count: Int){
    print("Total price : \(price * count)")
}
printTotalPrice(price: 1500, count: 5)


func printTotalPrice(_ price: Int, _ count: Int){   // 파라미터 이름을 명시하지않음
    print("Total price : \(price * count)")
}
printTotalPrice(1500, 5)


func printTotalPrice(가격 price: Int, 갯수 count: Int){ // 파라미터 이름을 원하는걸로 정함
    print("Total price : \(price * count)")
}
printTotalPrice(가격: 1500, 갯수: 5)


func printTotalPriceWithDefaultValue(price: Int = 1500, count: Int){
    print("Total price : \(price * count)")
}
printTotalPriceWithDefaultValue(count: 5)
printTotalPriceWithDefaultValue(count: 10)
printTotalPriceWithDefaultValue(price: 2000, count: 3)


func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}
let calculatedPrice = totalPrice(price: 10000, count: 7)


// overload
func printTotalPrice(price: Double, count: Double){
    print("Total Price: \(price * count)")
}
func printTotalPrice(가격: Double, 갯수: Double){
    print("Total Price: \(가격 * 갯수)")
}


// In-out parameter
func incremnetAndPrice(_ value: inout Int){
    value += 1
    print(value)
}
var value = 3
incremnetAndPrice(&value)



func add(_ a : Int, _ b : Int) -> Int {
    return a + b
}

func substract(_ a : Int, _ b : Int) -> Int {
    return a - b
}

var function = add
function(4, 2)
function = substract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a : Int, _ b : Int) {
    let result = function(a, b)
    print(result)
}
printResult(add, 4, 2)
printResult(substract, 4, 2)


// Optional
var carName: String?    // nil로 초기화
carName = nil   // 없는것을 명시적으로 지정
carName = "탱크"

var favoriteMovieStar: String?
let num = Int("10")  // num은 Int?로 지정됨


// 고급 기능 4가지
// Forced unwrapping
// Optional binding (if let)
// Optional binding (guard)
// Nil coalescing

//print(carName)
//print(carName!)
//
//carName = nil
//print(carName!)


if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("No Car Name")
}


func printParsedInt(from: String){
    guard let parsedInt = Int(from) else {
        print("Int로 컨버팅 안된다고 함다")
        return
    }
    print(parsedInt)
}

printParsedInt(from: "100")
printParsedInt(from: "Hello")

carName = nil
let myCarName:String = carName ?? "모델 S"


// -- 도전 과제
// 1. 최애 음식이름을 담는 변수(String?)를 작성
// 2. 옵셔널 바인딩을 이용해서 값을 확인해보기
// 3. 닉네임을 받아서 출력하는 함수 만들기, 조건 입력 파라미터는 String?

var favoritFood: String?
//favoritFood = "삼겹살"

if let food = favoritFood {
    print(food)
} else {
    print("No Favorite")
}

func printNickName(name: String?){
    guard let nickname = name else {
        print("nickname 만들어보자")
        return
    }
    print(nickname)
}
printNickName(name: "하이하이")
printNickName(name: nil)

