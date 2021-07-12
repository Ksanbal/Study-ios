//
//  TrackCollectionHeaderView.swift
//  AppleMusicStyleApp
//
//  Created by 김현균 on 2021/07/09.
//

import UIKit
import AVFoundation

class TrackCollectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var desriptionLabel: UILabel!
    
    var item: AVPlayerItem?
    var tapHandler: ((AVPlayerItem) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 4
    }
    
    func update(with item: AVPlayerItem) {
        // 헤더뷰 업데이트 하기
        self.item = item
        guard let track = item.convertToTrack() else { return }
        
        self.thumbnailImageView.image = track.artwork
        self.desriptionLabel.text = "Today's pick is \(track.artist)'s album - \(track.albumName), Let listen."
    }
    
    @IBAction func cardTapped(_ sender: UIButton) {
        // 탭 했을때 처리
        guard let todaysItem = item else { return }
        tapHandler?(todaysItem)
    }
}
