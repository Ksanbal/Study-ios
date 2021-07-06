import UIKit

// 1. 성, 이름을 받아서 fullname을 출력하는 함수 만들기
func printFullname(lastName: String, firstName: String){
    print("\(lastName) \(firstName)")
}
printFullname(lastName: "kim", firstName: "sanbal")

// 2. 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullname 출력하는 함수 만들기
func printFullname(_ lastName: String, _ firstName: String){
    print("\(lastName) \(firstName)")
}
printFullname("kim", "sanbal")

// 3. 성, 이름을 받아서 fullname return 하는 함수 만들기
func getFullname(성 lastName: String, 이름 firstName: String) -> String {
    return "\(lastName) \(firstName)"
}
print(getFullname(성: "kim", 이름: "sanbal"))
