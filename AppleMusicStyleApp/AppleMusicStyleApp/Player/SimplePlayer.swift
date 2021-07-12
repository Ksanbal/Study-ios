//
//  SimplePlayer.swift
//  AppleMusicStyleApp
//
//  Created by 김현균 on 2021/07/09.
//

import AVFoundation

class SimplePlayer {
    // 싱글톤 만들기, 왜 만드는가?
    static let shared = SimplePlayer()
    
    private let player = AVPlayer()
    
    var currentTime: Double {
        // currentTime 구하기
        return player.currentItem?.currentTime().seconds ?? 0.0
    }
    
    var totalDurationTime: Double {
        // totalDurationTime 구하기
        return player.currentItem?.duration.seconds ?? 0.0
    }
    
    var isPlaying: Bool {
        // isPlaying 구하기
        return player.isPlaying
    }
    
    var currentItem: AVPlayerItem? {
        // currentItem 구하기
        return player.currentItem
    }
    
    init() { }
    
    func pause() {
        // pause 구현
        player.pause()
    }
    
    func play() {
        // play 구현
        player.play()
    }
    
    func seek(to time: CMTime) {
        // seek 구현
        player.seek(to: time)
    }
    
    func replaceCurrentItem(with item: AVPlayerItem?) {
        // replace current item 구현
        player.replaceCurrentItem(with: item)
    }
    
    func addPeriodTimeObserver(forInterval: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void) {
        player.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
    }
}
