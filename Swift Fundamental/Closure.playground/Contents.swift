import UIKit

/*
{ (param) -> returnType in
    statement
    ...
}
*/


// Example 1: Cho Simple Closure
let exampleClosure1 = {}
exampleClosure1()


// Example 2: 코드블럭을 구현한 Closure
let exampleClosure2 = {
    print("Hello, 클로져!")
}
exampleClosure2()


// Example 3: input param을 받는 Closure
let exampleClosure3: (String) -> Void = { name in
    print("Hello, \(name)")
}
exampleClosure3("Sanbal")


// Example 4: 값을 리턴하는 Closure
let exampleClosure4: (String) -> String = { name in
    let message = "IOS 개발 재밌네, \(name)"
    return message
}
let result = exampleClosure4("Sanbal")
print(result)


// Example 5: Closure을 파라미터로 받는 함수 구현
func someSimpleFunction(choSimpleClosure: ()->Void){
    print("함수에서 호출이 되었어요")
    choSimpleClosure()
    
}
someSimpleFunction(choSimpleClosure: {
    print("헬로 코로나 from Closure")
})


// Example 6: Trailing Closure
someSimpleFunction() {
    print("헬로 코로나 from Closure")
}

