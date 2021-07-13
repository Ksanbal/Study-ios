//
//  TrackManager.swift
//  SanbalMusic
//
//  Created by 김현균 on 2021/07/12.
//

import UIKit
import AVFoundation

class TrackManager {
    var tracks: [AVPlayerItem] = []
    var todaysTrack: AVPlayerItem?
    
    init() {
        loadTracks()
        loadTodaysTrack()
    }
    
    // 가지고 있는 모든 음원 가져오기
    func loadTracks() {
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        self.tracks = urls.map { url in
            return AVPlayerItem(url: url)
        }
    }
    
    // 인덱스의 맞는 곡 뽑아주기
    func track(at index: Int) -> Track? {
        let playerItem = tracks[index]
        let track = playerItem.convertToTrack()
        return track
    }
    
    // 오늘의 음원 랜덤으로 뽑기
    func loadTodaysTrack() {
        self.todaysTrack = self.tracks.randomElement()
    }
}
