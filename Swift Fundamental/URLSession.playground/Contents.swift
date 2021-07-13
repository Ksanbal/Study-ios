import UIKit

// URLSession
let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")   // utf8로 자동변환해줌

urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)

let requestURL = urlComponents?.url!


struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case tracks = "results"
    }
}

struct Track: Codable {
    let title: String
    let artistName: String
    let thumbnailPath: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl100"
    }
}

let dataTask = session.dataTask(with: requestURL!) { (data, response, error) in
    guard error == nil else { return }
    
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else { return }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    
    // 목표 : 트랙리스트 오브젝트로 가져오기
    
    // 하고싶은 목록
    // - data - Track 목록으로 가져오고싶다 [Track]
    // Track 오브젝트 만들기
    // data -> Track struct로 파싱하고싶다. -> Codable을 이용해서 만들자
    // json 파일, 데이터 -> 오브젝트로 만들때 Codable 이용하겠다
    // response Track 이렇게 2개 만들어야겠다
    
    // 해야할일
    // response, Track Struct
    // struct의 프로퍼치 이름과 실제 데이터의 키와 맞추기 (Codable 디코딩하기 위해서)
    // 파싱하기(Decoding)
    // 트랙리스트 가져오기
    
    // 파싱 & 트랙 가져오기
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        
        print("--> tracks: \(tracks.count) -\(tracks.last?.title) -\(tracks.last?.thumbnailPath)")
    } catch let error{
        print(error.localizedDescription)
    }
}
 
dataTask.resume()
