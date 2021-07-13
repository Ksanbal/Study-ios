import UIKit

// Queue - Main, Global, Custom

// - Main
DispatchQueue.main.async {
    // UI 업데이트
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}

// - Global
DispatchQueue.global(qos: .userInteractive).async {
    // 진짜 중요하고, 당장해야하는거
}

DispatchQueue.global(qos: .userInteractive).async {
    // 거의 바로 해줘야 할 것
}

DispatchQueue.global(qos: .default).async {
    // 이건 굳이...?
    // 우선순위 신경 안쓰고 쓰겠다는 뜻
}

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리는 일들
    // 사용자가 당장 기다리지 않는 것
    // 네트워킹, 디스크에서 큰파일 불러올때
}

DispatchQueue.global(qos: .background).async {
    // 사용자한테 당장 인식될 필요 없는 것들
    // 뉴스데이터 미리 받기
    // 위치 업데이트
    // 영상 다운로드
}

// - Custom
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)



// 복한적인 상황
func downloadImageFromServer() -> UIImage{
    // heavy task
    return UIImage()
}

func updateUI(image: UIImage){
    
}

DispatchQueue.global(qos: .background).async {
    let image = downloadImageFromServer()
    DispatchQueue.main.async {
        // UI 관련은 main 스레드로 넘겨주자
        updateUI(image: image)
    }
}

// Sync, Async

// - Async
DispatchQueue.global(qos: .background).async {
    for i in 0...5{
        print("😈 \(i)")
    }
}

DispatchQueue.global(qos: .background).sync {
    for i in 0...5{
        print("👻 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5{
        print("😃 \(i)")
    }
}


//-----------------------------------------------

let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)

url?.absoluteString
url?.scheme             // 통신방법 http or https
url?.host
url?.path
url?.query
url?.baseURL

let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)

relativeURL?.absoluteString
relativeURL?.scheme             // 통신방법 http or https
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL

// URLComponents
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")   // utf8로 자동변환해줌

urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)

urlComponents?.url
urlComponents?.string
urlComponents?.queryItems

//-----------------------------------------------
