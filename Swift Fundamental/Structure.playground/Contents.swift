import UIKit

// 문제: 가장 가까운 편의점 찾기

// 거리 구하는 함수
//func distance(cureent: (x: Int, y: Int), target: (x: Int, y: Int)) -> Double {
func distance(current: Location, target: Location) -> Double {
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(pow(distanceX, 2) + pow(distanceY, 2))
    return distance
}

struct Location {
    let x: Int
    let y: Int
}

struct Store {
    let loc: Location
    let name : String
    let deliveryRange = 2.0
    
    func isDeliverable(userLoc: Location) -> Bool {
        let distanceToStore = distance(current: self.loc, target: userLoc)
        return distanceToStore < deliveryRange
    }
}

// 현재 스토어 위치들
//let store1 = (x: 3, y: 5, name: "gs")
//let store2 = (x: 4, y: 6, name: "seven")
//let store3 = (x: 1, y: 7, name: "cu")
let store1 = Store(loc: Location(x: 3, y: 5), name: "gs")
let store2 = Store(loc: Location(x: 4, y: 6), name: "seven")
let store3 = Store(loc: Location(x: 1, y: 7), name: "cu")


// 가장 가까운 스토어 구해서 프린트하는 함수
//func printClosesStore(cureentLocation: (x: Int, y: Int), stores: [(x: Int, y: Int, name: String)]) {
func printClosesStore(cureentLocation: Location, stores: [Store]) {
    var closestStoreName = ""
    var closestStoreDistance = Double.infinity
    var isDeliverable = false
    
    for store in stores {
//        let distanceToStore = distance(cureent: cureentLocation, target: (x: store.x, y: store.y))
        let distanceToStore = distance(current: cureentLocation, target: store.loc)
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore {
            closestStoreName = store.name
            isDeliverable = store.isDeliverable(userLoc: cureentLocation)
        }
    }
    print("Closest store : \(closestStoreName), isDeliverable: \(isDeliverable)")
}


// Stores Array 세팅, 현재 내 위치 세팅
//let myLocation = (x: 2, y: 2)
let myLocation = Location(x: 2, y: 5)
let stores = [store1, store2, store3]


// 현재 가장 가까운 스토어 출력하기
printClosesStore(cureentLocation: myLocation, stores: stores)



// ------------------------------------------------
// 도전과제
// 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기
// 2. 강의 배열과 강사 이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 만들기
// 3. 강의 3개 만들고 강사이름으로 강의 찾기

struct Lecture: CustomStringConvertible{
    var description: String {
        return "Title: \(name), instructor: \(teacher)"
    }
    
    let name: String
    let teacher: String
    let studentCount: Int
}

let lecture1 = Lecture(name: "Ios", teacher: "A", studentCount: 10)
let lecture2 = Lecture(name: "Android", teacher: "B", studentCount: 20)
let lecture3 = Lecture(name: "Flutter", teacher: "C", studentCount: 30)
let lectures = [lecture1, lecture2, lecture3]


func printLectureOfTeacher(lecs: [Lecture], tea: String) {
//    for lec in lecs {
//        if lec.teacher == tea {
//            print(lec.name)
//        }
//    }
    
//    let lectureName = lecs.first { (lec) -> Bool in
//        return lec.teacher == tea
//    }?.name ?? ""
    let lectureName = lecs.first { $0.teacher == tea }?.name ?? ""

    
    print(lectureName)
}
printLectureOfTeacher(lecs: lectures, tea: "C")

print(lecture1)
print(lecture2)
print(lecture3)

