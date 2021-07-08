import UIKit

struct PersonStrue {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    mutating func upppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}


class PersonClass {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    func upppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

var personStruct1 = PersonStrue(firstName: "Jason", lastName: "Lee")
var personStruct2 = personStruct1

var personClass1 = PersonClass(firstName: "Jason", lastName: "Lee")
var personClass2 = personClass1

personStruct2.firstName = "Jay"
personStruct1.firstName
personStruct2.firstName

personClass2.firstName = "Jay"
personClass1.firstName
personClass2.firstName


personClass2 = PersonClass(firstName: "Bob", lastName: "Lee")
personClass1.firstName
personClass2.firstName

personClass1 = personClass2
personClass1.firstName
personClass2.firstName


//---------------------------------------------

//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}
//
//class Student: Person {
//    var grades: [Grade] = []
//}
//
//
//let jay = Person(firstName: "Jay", lastName: "Lee")
//let jason = Student(firstName: "Jason", lastName: "Lee")
//
//jay.firstName
//jason.firstName
//
//jay.printMyName()
//jason.printMyName()
//
//let math = Grade(letter: "B", points: 8.5, credits: 3)
//let history = Grade(letter: "A", points: 10.0, credits: 3)
//jason.grades.append(math)
//jason.grades.append(history)
////jay.grades
//
//jason.grades.count
//
//
//// 학생인데 운동선수
//class StudentAthelete: Student {
//    var minimumTrainingTime: Int = 2
//    var trainedTime: Int = 0
//
//    func train() {
//        trainedTime += 1
//    }
//}
//
//// 운동선수인데 축구선수
//class FootballPlayer: StudentAthelete {
//    var footballTeam = "FC Swift"
//
//    override func train() {
//        trainedTime += 2
//    }
//}
//
//// Person > Student > Athelete > Football Player
//var athelete1 = StudentAthelete(firstName: "Yuna", lastName: "Kim")
//var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")
//
//athelete1.firstName
//athelete2.firstName
//
//athelete1.grades.append(math)
//athelete2.grades.append(math)
//
//athelete1.minimumTrainingTime
//athelete2.minimumTrainingTime
//
////athelete1.footballTeam
//athelete2.footballTeam
//
//athelete1.train()
//athelete1.trainedTime
//
//athelete2.train()
//athelete2.trainedTime
//
//
//athelete1 = athelete2 as StudentAthelete    // UpperCast
//athelete1.firstName
//athelete1.train()
//athelete1.trainedTime
////athelete1.footballTeam
//
//if let son = athelete1 as? FootballPlayer { // DownCast
//    print("--> team: \(son.footballTeam)")
//}


//----------------------------
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    override init(firstName: String, lastName: String){
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(student: Student){
        self.init(firstName: student.firstName, lastName: student.lastName)
    }
}

class StudentAthelete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String]
    
    // 2-phase Initialization
    init(firstName: String, lastName: String, sports: [String]) {
        // Phase 1
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
        
        // Phase 2
        self.train()
    }
    
    convenience init(name: String){
        self.init(firstName: name, lastName: "", sports: [])
    }
    
    func train() {
        trainedTime += 1
    }
}

// 운동선수인데 축구선수
class FootballPlayer: StudentAthelete {
    var footballTeam = "FC Swift"
    
    override func train() {
        trainedTime += 2
    }
}

let student1 = Student(firstName: "Jason", lastName: "Lee")
let student1_1 = Student(student: student1)
let student2 = StudentAthelete(firstName: "Jay", lastName: "Lee", sports: ["Football"])
let student3 = StudentAthelete(name: "Mike")
