import UIKit

struct Person {
    // Stored Property
    var firstName: String {
        willSet {
            print("willSet: \(firstName) -> \(newValue)")
        }
        
        didSet {
            print("didset: \(oldValue) -> \(firstName)")
        }
    }
    var lastName: String
    
    // Lazy Property
    // 실행의 cost를 줄이기 위해 사용
    // 모든 사용자는 아니고, 몇몇 사용자에게만 값을 주고자할때
    lazy var isPopular: Bool = {
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }
    }()
    
    // Computed Property
    var fullName: String {
        get {
            print("Computed Property Get")
            return "\(firstName) \(lastName)"
        }
        
        set {
            print("Computed Property Set")
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    
    // Type Property
    // 생성된 인스턴스와 상관없이, 생성자 자체의 속성을 변경하고 싶을때 사용
    static let isAlien: Bool = false
}

//var person = Person(firstName: "Sanbal", lastName: "Kim")
var person = Person(firstName: "Jay", lastName: "Park")
//person.fullName = "
print(person.isPopular)



//--------------------------------------------------------------
struct Lecture {
    let title: String
    var maxNumOfStudents: Int = 10
    var numOfRegistered: Int = 0
    
    func remainSeats() -> Int {
        let remainSeats = maxNumOfStudents - numOfRegistered
        return remainSeats
    }
    
    mutating func register(){
        // 작성된 메소드가 자기자신의 값을 수정하려고 할때 mutating을 붙여 명시해야함
        numOfRegistered += 1
    }
    
    static var target: String = "Anybody want to learn something"
    
    static func 소속학원이름() -> String {
        return "패캠"
    }
}

var lec = Lecture(title: "iOS Basic")

//func remainSeats(of lec: Lecture) -> Int {
//    let remainSeats = lec.maxNumOfStudents - lec.numOfRegistered
//    return remainSeats
//}
//remainSeats(of: lec)

lec.remainSeats()
lec.register()
lec.register()
lec.register()

lec.remainSeats()

Lecture.target
Lecture.소속학원이름()


// Method 확장
struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}
Math.abs(value: -20)

extension Math {
    static func sqaure(value: Int) -> Int {
        return value * value
    }
    
    static func half(value: Int) -> Int {
        return value / 2
    }
}

Math.sqaure(value: 5)
Math.half(value: 10)

extension Int {
    func sqaure() -> Int {
        return self * self
    }
    
    func half() -> Int {
        return self / 2
    }
}

var value: Int = 3
value.half()
value.sqaure()
